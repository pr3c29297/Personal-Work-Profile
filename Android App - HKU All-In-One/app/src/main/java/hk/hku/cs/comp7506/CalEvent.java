package hk.hku.cs.comp7506;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CalEvent implements Serializable {
    private String courseCode;
    private String courseSession;
    private String courseTitle;
    private Date startDate;
    private Date endDate;
    private Time startTime;
    private Time endTime;
    private ArrayList<String> dayOfWeek;
    private String eventVenue;

    CalEvent(String courseCode,
             String courseSession,
             String courseTitle,
             Date startDate,
             Date endDate,
             Time startTime,
             Time endTime,
             ArrayList<String> dayOfWeek,
             String eventVenue){
        this.courseCode = courseCode;
        this.courseSession = courseSession;
        this.courseTitle = courseTitle;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.dayOfWeek = dayOfWeek;
        this.eventVenue = eventVenue;
    }

    public String getEventAsString(){
        String d = ((this.startDate == null)||(this.endDate == null))
                ? ""
                : ((new SimpleDateFormat("dd MMM yyyy").format(this.startDate)) + " to " + (new SimpleDateFormat("dd MMM yyyy").format(this.endDate)));
        String w = (android.text.TextUtils.join(",", this.dayOfWeek) == "" ) ? "" : ", " + android.text.TextUtils.join(",", this.dayOfWeek);
        String t = ((this.startTime == null)||(this.endTime == null))
                ? ""
                : (", " + (new SimpleDateFormat("HH:mm").format(this.startTime)) + " - " + (new SimpleDateFormat("HH:mm").format(this.endTime)));
        String v = ((this.eventVenue == null)||(this.eventVenue == "")) ? "" : " @" + this.eventVenue;
        return d + w + t + v;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public Time getStartTime() {
        return startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public String getEventVenue() {
        return eventVenue;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public ArrayList<String> getDayOfWeek() {
        return dayOfWeek;
    }

    public int compareTo(CalEvent c){
        return c.getStartDate().compareTo(c.getStartDate());
    }
}
