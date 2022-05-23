package hk.hku.cs.comp7506;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.metrics.Event;
import android.net.Uri;
import android.os.Build;
import android.provider.CalendarContract;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;


public class Courselist_Adapter extends RecyclerView.Adapter<Courselist_Adapter.ViewHolder> {
    private CourseList courselist;
    private Context context;

    public Courselist_Adapter(CourseList courselist, Context context){
        this.courselist = courselist;
        this.context = context;
        //connect(courselist);
    }

    @NonNull
    @Override
    public Courselist_Adapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.course_list_item, parent, false);
        return new Courselist_Adapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Courselist_Adapter.ViewHolder holder, int position) {
        Course course = courselist.getCourseArray().get(position);
        holder.tv_CourseName.setText(course.getCourseName());
        holder.tv_Teacher.setText(course.getCourseTeacher());
        holder.tv_CourseLInk.setText(course.getCourseLink());
        boolean isExpanded = course.isExpanded();
        holder.cl_expLayout.setVisibility(isExpanded ? View.VISIBLE : View.GONE );
        if(isExpanded) bindbuttonControl(holder.itemView, course);


    }

    @Override
    public int getItemCount() {
        try {
            return courselist.getCourseArray().size();
        } catch (Exception e){
            return 0;
        }
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        TextView tv_CourseName, tv_Teacher, tv_CourseLInk;
        Button btnGoZoom, btnAddGCalendar;
        ConstraintLayout cl_expLayout;
        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            tv_CourseName = itemView.findViewById(R.id.coursename);
            tv_Teacher = itemView.findViewById(R.id.teachers);
            tv_CourseLInk = itemView.findViewById(R.id.courselink);

            cl_expLayout = itemView.findViewById(R.id.expandableLayout);
            btnGoZoom = itemView.findViewById(R.id.btnGoZoom);
            btnAddGCalendar = itemView.findViewById(R.id.btnAddGCalendar);

            itemView.setOnClickListener(this);
        }

        @RequiresApi(api = Build.VERSION_CODES.O)
        @Override
        public void onClick(View view) {
            int position = getAdapterPosition();
            Course course = courselist.getCourseArray().get(position);
            course.setExpanded(!course.isExpanded());
            notifyItemChanged(getAdapterPosition());
        }
    }

    public void bindbuttonControl(View view, Course course){
        Button btn_btnGoZoom = (Button) view.findViewById(R.id.btnGoZoom);
        btn_btnGoZoom.setVisibility(course.getCourseZoom() == null || course.getCourseZoom().indexOf("hku.zoom.us") < 0 ? View.GONE : View.VISIBLE);
        // If no schedule, disable add Calendar function
        Button btn_btnAddGCalendar = (Button) view.findViewById(R.id.btnAddGCalendar);
        if(course.getCurrentNextSchedule() == null){
            btn_btnAddGCalendar.setVisibility(View.GONE);
            //con_Cal.setVisibility(View.GONE);
        } else
            // If the schedule is not complete, add Calendar function should be disabled
            if(course.getCurrentNextSchedule().getStartDate() == null
                    || course.getCurrentNextSchedule().getEndDate() == null
                    || course.getCurrentNextSchedule().getDayOfWeek().size() == 0){
                //con_Cal.setVisibility(View.GONE);
                btn_btnAddGCalendar.setVisibility(View.GONE);
            }else{
                btn_btnAddGCalendar.setVisibility(View.VISIBLE);
            }

        TextView txt_courseschedule = view.findViewById(R.id.txtCourseSchDesc);
        TextView txt_courseschedule_title = view.findViewById(R.id.txtCourseSchTitle);
        String desc = "";
        if (course.getCourseSchedule() != null && course.getCourseSchedule().size() > 0) {
            for (CalEvent i : course.getCourseSchedule()) {
                desc += i.getEventAsString() + "\r\n";
            }
            txt_courseschedule_title.setVisibility(View.VISIBLE);
        } else {
            txt_courseschedule_title.setVisibility(View.GONE);
            desc = "Schedule not available";
        }
        txt_courseschedule.setText(desc);


        btn_btnGoZoom.setOnClickListener(new Button.OnClickListener() {
            public void onClick(View v) {
                Intent i = new Intent(Intent.ACTION_VIEW);
                i.setData(Uri.parse(course.getCourseZoom()));
                context.startActivity(i);
            }
        });

        btn_btnAddGCalendar.setOnClickListener(new Button.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.O)
            public void onClick(View v) {
                CalEvent currentEvent = course.getCurrentNextSchedule();

                if (currentEvent.getStartDate() != null && currentEvent.getEndDate() != null && currentEvent.getDayOfWeek().size() > 0){
                    Intent intent = new Intent(Intent.ACTION_INSERT);

                    TimeZone timeZone = TimeZone.getDefault();
                    Date RealStartDate = getRealStartDate(currentEvent.getStartDate(), currentEvent.getDayOfWeek().get(0));


                    intent.setData(CalendarContract.Events.CONTENT_URI);
                    intent.putExtra(CalendarContract.Events.TITLE, currentEvent.getCourseCode() + " - " + currentEvent.getCourseTitle());
                    intent.putExtra(CalendarContract.Events.DESCRIPTION, currentEvent.getEventAsString());
                    intent.putExtra(CalendarContract.Events.EVENT_LOCATION, currentEvent.getEventVenue());
                    intent.putExtra(CalendarContract.Events.EVENT_TIMEZONE, timeZone.getID());
                    intent.putExtra(CalendarContract.Events.CALENDAR_ID, 1);

                    if (currentEvent.getStartTime() != null && currentEvent.getEndTime() != null){
                         //non all-day event
                        intent.putExtra(CalendarContract.EXTRA_EVENT_ALL_DAY, "true");
                        intent.putExtra(CalendarContract.EXTRA_EVENT_BEGIN_TIME, combineDateTime(RealStartDate, currentEvent.getStartTime()).getTime());
                        intent.putExtra(CalendarContract.EXTRA_EVENT_END_TIME, combineDateTime(RealStartDate, currentEvent.getEndTime()).getTime());

                        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
                        String strDate = formatter.format(currentEvent.getEndDate());
                        intent.putExtra(CalendarContract.Events.RRULE, "FREQ=WEEKLY;BYDAY="+RecurWeekDayString(currentEvent.getDayOfWeek())+";INTERVAL=1;UNTIL="+strDate+"T000000Z");

                    } else {
                        // all day event
                        intent.putExtra(CalendarContract.Events.ALL_DAY, "true");
                        intent.putExtra(CalendarContract.Events.DTSTART, RealStartDate.getTime());
                        intent.putExtra(CalendarContract.Events.DTEND, currentEvent.getEndDate().getTime());

                    }

                    context.startActivity(intent);

                }

            }
        });
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    private String RecurWeekDayString(ArrayList<String> st){
        ArrayList<String> result = new ArrayList<>();
        for(int i = 0; i < st.size(); i++){
            result.add(st.get(i).substring(0,2));
        }

        return String.join(",",result);
    }

    private Date combineDateTime(Date date, Date time)
    {
        Calendar calendarA = Calendar.getInstance();
        calendarA.setTime(date);
        Calendar calendarB = Calendar.getInstance();
        calendarB.setTime(time);

        calendarA.set(Calendar.HOUR_OF_DAY, calendarB.get(Calendar.HOUR_OF_DAY));
        calendarA.set(Calendar.MINUTE, calendarB.get(Calendar.MINUTE));
        calendarA.set(Calendar.SECOND, calendarB.get(Calendar.SECOND));
        calendarA.set(Calendar.MILLISECOND, calendarB.get(Calendar.MILLISECOND));

        Date result = calendarA.getTime();
        return result;
    }

    private Date getRealStartDate(Date date, String dayOfWeek){
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        Integer daydiff = (getDay_of_week(dayOfWeek) - c.get(Calendar.DAY_OF_WEEK) + 7 ) % 7;
        c.add(Calendar.DATE, daydiff);
        return c.getTime();
    }

    private Integer getDay_of_week(String dayofweek){
        switch (dayofweek){
            case "SUN": return Calendar.SUNDAY;
            case "MON": return Calendar.MONDAY;
            case "TUE": return Calendar.TUESDAY;
            case "WED": return Calendar.WEDNESDAY;
            case "THU": return Calendar.THURSDAY;
            case "FRI": return Calendar.FRIDAY;
            case "SAT": return Calendar.SATURDAY;
            default: return null;
        }
    }

    protected void alert(String title, String mymessage){
        new AlertDialog.Builder(this.context)
                .setMessage(mymessage)
                .setTitle(title)
                .setCancelable(true)
                .setNegativeButton(android.R.string.cancel,
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int whichButton){}
                        }
                )
                .show();
    }

}
