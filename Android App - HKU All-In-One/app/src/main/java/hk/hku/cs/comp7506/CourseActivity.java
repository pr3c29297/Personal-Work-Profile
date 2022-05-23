package hk.hku.cs.comp7506;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

//import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


public class CourseActivity extends Activity implements View.OnClickListener {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.course_item);

        // Initialise Buttons
        btn_btnGoZoom = (Button) findViewById(R.id.btnGoZoom);
        btn_btnGoZoom.setOnClickListener(this);

        btn_btnAddGCalendar = (Button) findViewById(R.id.btnAddGCalendar);
        btn_btnAddGCalendar.setOnClickListener(this);

        Intent intent = this.getIntent();

        // Get coursename from parent view and initialise Course object with coursename
        Bundle bun_CourseSelected = intent.getBundleExtra("Bun_CourseSelected");
        this_course = (Course) bun_CourseSelected.getSerializable("Obj_CourseSelected") ;
        TextView txt_courseHead = findViewById(R.id.txtCourseHead);
        txt_courseHead.setText(this_course.getCourseName());

        // Get zoomlink from parent view and control the zoom button
        //strZoomLink = intent.getStringExtra("SelectedCourseZoomLink");
        // If Zoom Link not found, remove the Go Zoom button
        if(this_course.getCourseLink().indexOf("hku.zoom.us") < 0){
            btn_btnGoZoom.setVisibility(View.GONE);
            //RelativeLayout.LayoutParams lp_btnAddGCalendar = (RelativeLayout.LayoutParams) btn_btnAddGCalendar.getLayoutParams();
            //lp_btnAddGCalendar.removeRule(RelativeLayout.ABOVE);
            //lp_btnAddGCalendar.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM, RelativeLayout.TRUE);
        }

        // If no schedule, disable add Calendar function
        if(this.this_course.getCurrentNextSchedule() == null){
            btn_btnAddGCalendar.setVisibility(View.GONE);
            //con_Cal.setVisibility(View.GONE);
        } else
            // If the schedule is not complete, add Calendar function should be disabled
            if(this_course.getCurrentNextSchedule().getStartDate() == null
                    || this_course.getCurrentNextSchedule().getEndDate() == null
                    || this_course.getCurrentNextSchedule().getDayOfWeek().size() == 0){
                //con_Cal.setVisibility(View.GONE);
                btn_btnAddGCalendar.setVisibility(View.GONE);
            }

        /*
        // Get this course's schedule, show the current schedule
        Bundle bun_FilteredSchedule = intent.getBundleExtra("Bun_FilteredSchedule");
        ArrayList<ArrayList<String>> filtered_schedule =
                (ArrayList<ArrayList<String>>) bun_FilteredSchedule.getSerializable("Obj_FilteredSchedule");
        try {
            ArrayList<CalEvent> courseSchedule = new ArrayList<CalEvent>(getCourseSchedule(filtered_schedule));
        } catch (ParseException e) {
            e.printStackTrace();
        }
         */

        TextView txt_courseschedule = findViewById(R.id.txtCourseSchDesc);
        String desc = "";
        for (CalEvent i : this_course.getCourseSchedule()){
            desc += i.getEventAsString() + "\r\n";
        }
        txt_courseschedule.setText(desc);

        System.out.println(this_course.getCourseName());
    }

    @Override
    public void onClick(View view) {
        if (view.getId() == R.id.btnGoZoom){
            Intent i = new Intent(Intent.ACTION_VIEW);
            i.setData(Uri.parse(this_course.getCourseLink()));
            startActivity(i);
        } else if (view.getId() == R.id.btnAddGCalendar){
            CalEvent currentEvent = this_course.getCurrentNextSchedule();
            QueryHandler.insertEvent(this
                    , currentEvent.getCourseCode() + " - " + currentEvent.getCourseTitle()
                    , currentEvent.getStartDate()
                    , currentEvent.getEndDate()
                    , currentEvent.getStartTime()
                    , currentEvent.getEndTime()
                    , currentEvent.getEventVenue()
                    , currentEvent.getDayOfWeek()
            );
        }
    }

    public ArrayList<CalEvent> getCourseSchedule(ArrayList<ArrayList<String>> scheduleSet) throws ParseException {
        ArrayList<CalEvent> result = new ArrayList<CalEvent>();
        Resources res = getResources();

        for(int i = 0; i < scheduleSet.size(); i++){
            ArrayList<String> rec = new ArrayList<String>(scheduleSet.get(i));
            ArrayList<String> dow = new ArrayList<String>();
            for (int j = res.getInteger(R.integer.posMON); j < res.getInteger(R.integer.posSun) + 1; j++)
                if (!rec.get(j).trim().equals("")) dow.add(rec.get(j).trim());

            String str_CourseCode = rec.get(res.getInteger(R.integer.posCourseCode));
            if (!str_CourseCode.trim().equals(this_course.getCourseCode().trim())) continue;
            String str_ClassSection = rec.get(res.getInteger(R.integer.posClassSection));
            String str_CourseTitle = rec.get(res.getInteger(R.integer.posCourseTitle));

            Date date_StartDate;
            Date date_EndDate;
            Time time_StartTime;
            Time time_EndTime;

            try{
                date_StartDate = new SimpleDateFormat("yyyy-MM-dd").parse(rec.get(res.getInteger(R.integer.posStartDate)));
            } catch(ParseException e){
                date_StartDate = null;
                //date_StartDate = new SimpleDateFormat("yyyy-MM-dd").parse(getAcademicYearStart(0)+"-09-01");
            }

            try{
                date_EndDate = new SimpleDateFormat("yyyy-MM-dd").parse(rec.get(res.getInteger(R.integer.posEndDate)));
            } catch(ParseException e){
                date_EndDate = null;
                //date_EndDate = new SimpleDateFormat("yyyy-MM-dd").parse(getAcademicYearStart(1)+"-08-31");
            }

            try{
                time_StartTime = new Time(new SimpleDateFormat("HH:mm").parse(rec.get(res.getInteger(R.integer.posStartTime))).getTime());
            }catch(ParseException e){
                time_StartTime = null;
                // time_StartTime = new Time(new SimpleDateFormat("HH:mm").parse("00:00").getTime());
            }

            try{
                time_EndTime = new Time(new SimpleDateFormat("HH:mm").parse(rec.get(res.getInteger(R.integer.posEndTime))).getTime());
            }catch(ParseException e){
                time_EndTime = null;
                // time_EndTime = new Time(new SimpleDateFormat("HH:mm").parse("00:00").getTime());
            }
            String str_venue = rec.get(res.getInteger(R.integer.posVenue));

            CalEvent event = new CalEvent(
                    str_CourseCode,
                    str_ClassSection,
                    str_CourseTitle,
                    date_StartDate,
                    date_EndDate,
                    time_StartTime,
                    time_EndTime,
                    dow,
                    str_venue
            );

            result.add(event);
        }

        return result;
    }

    private String getAcademicYearStart(Integer offset){
        Date date = new Date();
        String yr;
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int month = cal.get(Calendar.MONTH);

        if(month < 8 /* 8 = Sept */ ){
            yr = Integer.toString(cal.get(Calendar.YEAR) - 1 + offset);
        } else {
            yr = Integer.toString(cal.get(Calendar.YEAR) + offset);
        }

        return yr;
    }

    private
    Button btn_btnGoZoom, btn_btnAddGCalendar;
    String strZoomLink;
    Course this_course;

    //ConstraintLayout con_Zoom, con_Cal;

}