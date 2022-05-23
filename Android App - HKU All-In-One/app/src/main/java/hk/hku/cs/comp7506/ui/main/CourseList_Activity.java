package hk.hku.cs.comp7506.ui.main;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import java.util.ArrayList;
import java.util.Map;

import hk.hku.cs.comp7506.Course;
import hk.hku.cs.comp7506.CourseList;
import hk.hku.cs.comp7506.Courselist_Adapter;
import hk.hku.cs.comp7506.ParseAdapter;
import hk.hku.cs.comp7506.R;

public class CourseList_Activity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private Courselist_Adapter adapter;

    private ArrayList<Map<String, Object>> list = new ArrayList< Map<String, Object> >();
    private String selected_coursename;
    private ArrayList<ArrayList<String>> filtered_schedule;
    private CourseList courselist;

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.courselist);

        Intent intent = this.getIntent();

        Bundle bun_CourseSelected = intent.getBundleExtra("Bun_CourseList");
        courselist = (CourseList) bun_CourseSelected.getSerializable("Obj_CourseList");
        recyclerView = findViewById(R.id.recyclerView_courselist);

        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new Courselist_Adapter(courselist, this);
        recyclerView.setAdapter(adapter);
    }


}