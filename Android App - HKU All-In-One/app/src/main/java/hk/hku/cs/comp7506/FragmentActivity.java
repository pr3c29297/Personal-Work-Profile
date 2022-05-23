package hk.hku.cs.comp7506;

import static android.content.pm.PackageManager.PERMISSION_GRANTED;

import android.Manifest;
import android.content.Intent;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.tabs.TabLayout;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.viewpager.widget.ViewPager;
import androidx.appcompat.app.AppCompatActivity;

import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import java.io.Serializable;

import hk.hku.cs.comp7506.ui.main.SectionsPagerAdapter;
import hk.hku.cs.comp7506.databinding.ActivityFragmentBinding;

public class FragmentActivity extends AppCompatActivity {

    private ActivityFragmentBinding binding;
    private CourseList courselist;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);


        Intent intent = this.getIntent();
        Bundle bun_CourseList = intent.getBundleExtra("Bun_CourseList");
        courselist = (CourseList) bun_CourseList.getSerializable("Obj_CourseList");

        //Bundle FragBun = new Bundle();
        //FragBun.putSerializable("FRAGOBJ",(Serializable)courselist);
        //Fragment1 fragobj = new Fragment1();
        //fragobj.setArguments(FragBun);
        //getSupportFragmentManager().beginTransaction().add(android.R.id.content, fragobj).commit();


        binding = ActivityFragmentBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        SectionsPagerAdapter sectionsPagerAdapter = new SectionsPagerAdapter(this, getSupportFragmentManager());
        ViewPager viewPager = binding.viewPager;
        viewPager.setAdapter(sectionsPagerAdapter);
        TabLayout tabs = binding.tabs;
        tabs.setupWithViewPager(viewPager);
    }

    public CourseList getCourselist(){
        return courselist;
    }


}