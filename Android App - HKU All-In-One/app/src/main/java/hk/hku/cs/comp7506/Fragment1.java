package hk.hku.cs.comp7506;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.ProgressBar;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Fragment1 extends Fragment {

    private RecyclerView recyclerView;
    private Courselist_Adapter adapter;

    private CourseList courselist;
    private Context context;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //courselist = (CourseList) getArguments().getSerializable("FRAGOBJ");
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        FragmentActivity fa = (FragmentActivity) getActivity();
        courselist = fa.getCourselist();
        return inflater.inflate(R.layout.fragment1_layout, container, false);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        context = this.getContext();


        //Intent intent = getActivity().getIntent();
        //Bundle bun_CourseSelected = intent.getBundleExtra("Bun_CourseList");
        //courselist = (CourseList) bun_CourseSelected.getSerializable("Obj_CourseList");
        recyclerView = view.findViewById(R.id.recyclerView_courselist);

        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this.getContext()));

        adapter = new Courselist_Adapter(courselist, this.getContext());
        recyclerView.setAdapter(adapter);
        connect(courselist);
    }

    private void connect(CourseList param_courselist){

        final ProgressDialog pdialog = new ProgressDialog(this.getContext());

        pdialog.setCancelable(false);
        pdialog.setMessage("Loading Data...");

        if(getActivity() != null && !getActivity().isFinishing()) {
            pdialog.show();
        }

        AsyncTask<String, Void, String> task = new AsyncTask<String, Void, String>() {
            String CoursePageContent;
            String LinkZoom;

            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            protected String doInBackground(String... arg0) {
                ArrayList<Course> courseArrayList = param_courselist.getThisYearsCourses();
                for (int i = 0; i < courseArrayList.size(); i++) {
                    pdialog.setMessage("Loading Data...(" + (i * 100 / courseArrayList.size()) + "%)");

                    Course c = courseArrayList.get(i);
                    CoursePageContent = getCoursePageContent(c.getCourseLink());
                    Pattern p_link = Pattern.compile("(?<=href=\\\")https\\:\\/\\/hku\\.zoom\\.us(.*?)(?=\\\")");
                    Matcher m_link = p_link.matcher(CoursePageContent);
                    if (m_link.find()) {
                        LinkZoom= m_link.group(0);
                    } else {
                        LinkZoom = null;
                    };
                    c.setCourseZoom(LinkZoom);
                    try {
                        c.setCourseSchedule(getFiltered_Schedule(c.getCourseName()));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    param_courselist.setCourse(i, c);
                    pdialog.setMessage("Loading Data...(" + ((i+1) * 100 / courseArrayList.size()) + "%)");

                }

                return null;
            }

            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            protected void onPostExecute(String result) {
                if (pdialog != null && pdialog.isShowing()) {
                    pdialog.dismiss();
                }
            }

            @Override
            protected void onCancelled() {
                super.onCancelled();
            }


        }.execute("");
    }

    public String getCoursePageContent(String courselink) {
        // get URL content
        final int HTML_BUFFER_SIZE = 2 * 1024 * 1024;
        char htmlBuffer[] = new char[HTML_BUFFER_SIZE];

        try {
            String a = courselink;
            URL url = new URL(a);
            URLConnection conn = url.openConnection();

            // open the stream and put it into BufferedReader
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));

            String HTMLSource = ReadBufferedHTML(br, htmlBuffer, HTML_BUFFER_SIZE);

            br.close();

            return HTMLSource;

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "";
    }

    private String ReadBufferedHTML(BufferedReader reader, char[] htmlBuffer, int bufSz) throws java.io.IOException {
        htmlBuffer[0] = '\0';
        int offset = 0;
        do {
            int cnt = reader.read(htmlBuffer, offset, bufSz - offset);
            if (cnt > 0) {
                offset += cnt;
            } else {
                break;
            }
        } while (true);
        return new String(htmlBuffer);
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    public ArrayList<ArrayList<String>> getFiltered_Schedule (ArrayList<String> ar_courseName) throws IOException {
        ArrayList<ArrayList<String>> result;
        CourseList cl = new CourseList(ar_courseName);
        //cl.getThisYearsCourses();
        ArrayList<String> courseCodeList = cl.getCourseParameterList("Code");
        InputStream ins = context.getAssets().open(context.getString(R.string.ScheduleFilename));
        tool_CSVreader reader = new tool_CSVreader();
        result = reader.readCSVFile(ins, 0 , courseCodeList);
        return  result;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    private ArrayList<ArrayList<String>> getFiltered_Schedule(String courseName) throws IOException {
        ArrayList<String> ar_courseName = new ArrayList<>();
        ar_courseName.add(courseName);
        return getFiltered_Schedule(ar_courseName);
    }

}


