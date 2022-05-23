package hk.hku.cs.comp7506;

import android.content.res.Resources;

import java.io.Serializable;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Course implements Serializable {
    private String courseName;
    private String courseCode;
    private String courseYear;
    private String courseSession;

    private String courseLink;



    private String courseZoom;

    private String courseTeacher;
    private ArrayList<CalEvent> courseSchedule;


    private boolean expanded;

    public Course(){
    }

    public Course(String courseName){
        this(courseName, "","");
    }

    public Course(String courseName, String courseTeacher, String courseLink){
        this.courseName = courseName;
        this.courseCode = setCourseCode(courseName);
        this.courseYear = setCourseYear(courseName);
        this.courseSession = setCourseSession(courseName);
        this.courseTeacher = courseTeacher;
        this.courseLink = courseLink;
        this.expanded = false;
    }


    public String getCourseZoom() {
        return courseZoom;
    }

    public void setCourseZoom(String courseZoom) {
        this.courseZoom = courseZoom;
    }

    public String getCourseTeacher() {
        return courseTeacher;
    }
    public String getCourseCode() {
        return courseCode;
    }

    public String getCourseSession() {
        return courseSession;
    }

    public String getCourseYear() {
        return courseYear;
    }

    public String getCourseName(){
        return courseName;
    }


    public boolean isExpanded() {
        return expanded;
    }

    public void setExpanded(boolean expanded) {
        this.expanded = expanded;
    }

    private String setCourseYear(String courseName) {
        Pattern pattern = Pattern.compile("[12][0-9]{3}(?=\\])");
        Matcher matcher = pattern.matcher(courseName.substring(courseName.length() - 7));
        if (matcher.find()) {
            return matcher.group(0);
        } else {
            return "0000";
        }
    }

    private String setCourseSession(String courseName) {
        Pattern pattern = Pattern.compile("(?<=Section )[12S]");
        Matcher matcher = pattern.matcher(courseName.substring(courseName.length() - 20));
        if (matcher.find()) {
            return matcher.group(0);
        } else {
            return "0";
        }
    }

    private String setCourseCode(String courseName) {
        String cname_code = courseName.substring(0,8);
        if(cname_code.substring(0,4).matches("[a-zA-Z]+")
                && cname_code.substring(4,8).matches("[0-9]+")){
            return cname_code;
        } else {
            return "";
        }
    }

    public String getCourseLink(){
        return courseLink;
    }


    public void setCourseLink(String courseLink) {
        this.courseLink = courseLink;
    }

    public ArrayList<CalEvent> getCourseSchedule(){
        return this.courseSchedule;
    }

    public void setCourseSchedule(ArrayList<ArrayList<String>> schedulelist){
        try {
            this.courseSchedule = (schedulelist == null ? null : this.getCourseSchedule(schedulelist));
            Collections.sort(this.courseSchedule, new Comparator<CalEvent>() {
                @Override
                public int compare(CalEvent t1, CalEvent t2) {
                    return t1.compareTo(t2);
                }
            });
        } catch (ParseException e) {
            //e.printStackTrace();
            this.courseSchedule = null;
        }
    }

    public ArrayList<CalEvent> getNowFutureSchedule(){
        ArrayList<CalEvent> result = new ArrayList<>();
        if (this.courseSchedule != null && this.courseSchedule.size() > 0){
            Date sysdate = new Date();

            // The course Schedule was sorted
            for(int i = 0; i < this.courseSchedule.size(); i++){
                // Find the current schedule first
                if (this.courseSchedule.get(i).getEndDate().compareTo(sysdate) >= 0 ){
                    result.add(this.courseSchedule.get(i));
                }
            }
        }
        return  result;
    }

    public CalEvent getCurrentNextSchedule(){
        return (getNowFutureSchedule().size() > 0 ? getNowFutureSchedule().get(0) : null);
    }

    public ArrayList<CalEvent> getCourseSchedule(ArrayList<ArrayList<String>> scheduleSet) throws ParseException {
        ArrayList<CalEvent> result = new ArrayList<CalEvent>();
        Resources res = App.getContext().getResources();

        for(int i = 0; i < scheduleSet.size(); i++){
            ArrayList<String> rec = new ArrayList<String>(scheduleSet.get(i));
            ArrayList<String> dow = new ArrayList<String>();
            for (int j = res.getInteger(R.integer.posMON); j < res.getInteger(R.integer.posSun) + 1; j++)
                if (!rec.get(j).trim().equals("")) dow.add(rec.get(j).trim());

            String str_CourseCode = rec.get(res.getInteger(R.integer.posCourseCode));
            if (!str_CourseCode.trim().equals(this.getCourseCode().trim())) continue;
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


    /* keep these columns:
        COURSE CODE
        CLASS SECTION
        START DATE
        END DATE
        MON
        TUE
        WED
        THU
        FRI
        SAT
        SUN
        VENUE
        START TIME
        END TIME
        COURSE TITLE
      */
}
