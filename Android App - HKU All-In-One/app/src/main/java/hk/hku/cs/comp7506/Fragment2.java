package hk.hku.cs.comp7506;

import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;

public class Fragment2 extends Fragment {

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment2_layout, container, false);
    }


/// Start - Parse data from sites to RecyclerView using Jsoup ///
    private RecyclerView recyclerView;
    private ParseAdapter adapter;
    private ArrayList<ParseItem> parseItems = new ArrayList<>();
    private ProgressBar progressBar;
    private Integer pageNum=1;

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        progressBar = view.findViewById(R.id.progressBar);
        recyclerView = view.findViewById(R.id.recyclerView);

        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this.getContext()));
        adapter = new ParseAdapter(parseItems, this.getContext());
        recyclerView.setAdapter(adapter);
        Content content = new Content();
        content.execute();
    }

    private class Content extends AsyncTask<Void, Void, Void>{
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressBar.setVisibility(View.VISIBLE);
            progressBar.startAnimation(AnimationUtils.loadAnimation(Fragment2.this.getContext(), android.R.anim.fade_in));
        }

        @Override
        protected void onPostExecute(Void unused) {
            super.onPostExecute(unused);
            progressBar.setVisibility(View.GONE);
            progressBar.startAnimation(AnimationUtils.loadAnimation(Fragment2.this.getContext(), android.R.anim.fade_out));
            adapter.notifyDataSetChanged();
        }

        @Override
        protected void onCancelled() {
            super.onCancelled();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            try{
                String url="https://covid19.hku.hk/topics/all/";
                Document doc = Jsoup.connect(url).get();
                Elements page = doc.select("a.page-numbers");
                int pageNum = page.size();
                String lastPageUrl = page.select("a.page-numbers").eq(pageNum-2).attr("href");
                int startPos=0;
                int count = 0;
                for (int i=lastPageUrl.length()-1; i>=0; i--){
                    if (lastPageUrl.charAt(i)=='/'){
                        startPos=i;
                        count++;
                    }
                    if (count == 2){
                        break;
                    }
                }
                pageNum = Integer.parseInt(lastPageUrl.substring(startPos+1, lastPageUrl.length()-1));
                long startTime = System.currentTimeMillis();
                for (int pn=1; pn<=pageNum; pn++){
                    String pageUrl = "https://covid19.hku.hk/topics/all/page/"+Integer.toString(pn)+'/';
                    Log.d("currentUrl", ""+pageUrl);
                    Document pageDoc = Jsoup.connect(pageUrl).get();
                    Elements data = pageDoc.select("h2.entry-title");
                    int size = data.size();
                    for (int i=0; i<size; i++){
                        String title = data.select("h2.entry-title").select("a").eq(i).text();
                        String detailUrl = data.select("h2.entry-title").select("a").eq(i).attr("href");
                        if (title.indexOf("Portal Login Required")==-1){
                            // Filter out those require Portal Login
                            parseItems.add(new ParseItem(title, detailUrl));
                        }
                        Log.d("item", "title: "+title);
                    }
                    long endTime = System.currentTimeMillis();
                    Log.d("timeElapsed", ""+Integer.toString((int) (endTime-startTime)));
                    if (endTime-startTime>4000){
                        break;
                    }
                }
            }catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
    }

}



