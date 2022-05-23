package hk.hku.cs.comp7506;
        ;

import android.os.Build;

import androidx.annotation.RequiresApi;

        import java.io.Serializable;
        import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CourseList implements Serializable {
    private ArrayList<Course> CourseArray;
    private final boolean testing = false;

    public CourseList(){
    }

    // Construct CourseList object by just list of course names
    public CourseList(ArrayList<String> ar_coursename){
        ArrayList<Course> ar_course = new ArrayList<>();

        for (String i : ar_coursename){
            ar_course.add(new Course(i));
        }

        this.CourseArray = ar_course;

    }

    // Construct CourseList object by course list HTML source
    public CourseList(String HTMLsource){
        ArrayList<Course> ar_course = new ArrayList<>();

        // Course Name Array
        Pattern p_coursename = Pattern.compile("<h3 class=\"coursename\".*?>.*?>(.*?)</a>");
        Matcher m_course = p_coursename.matcher(HTMLsource);

        ArrayList<String> cname = new ArrayList<>();
        ArrayList<Integer> cnamePos = new ArrayList<Integer>();

        while (m_course.find()) {
            String course_name = m_course.group(1);
            Integer pos = m_course.start();
            boolean flag = true;
            for (String sss : cname) {
                if (sss.equals(course_name)) {
                    flag = false;
                }
            }
            if (flag) {
                cname.add(course_name);
                cnamePos.add(pos);
            }
        }


        // Teacher array
        Pattern p_teachercandidates = Pattern.compile("<div class=\"teachers\">Teacher: <.*?>(.*?)</a>");
        Matcher m_teachercandidates = p_teachercandidates.matcher(HTMLsource);

        ArrayList<String> cteachers = new ArrayList<String>();
        ArrayList<String> cteachersfinal = new ArrayList<String>();
        ArrayList<Integer> cteachersPos = new ArrayList<Integer>();
        ArrayList<Integer> cteachersIdx = new ArrayList<Integer>();

        while(m_teachercandidates.find()){
            String string_teachername = m_teachercandidates.group(1);
            cteachers.add(string_teachername);
            Integer pos = m_teachercandidates.start();
            cteachersPos.add(pos);
        }

        int cIdx=0;
        for(int i=0 ; i<cteachersPos.size() ; ){
            int cpos0 = -1, cpos1 = -1;
            int tpos = cteachersPos.get(i);
            if(cIdx < cnamePos.size()){
                cpos0 = cnamePos.get(cIdx);
            }
            if(cIdx+1 < cnamePos.size()){
                cpos1 = cnamePos.get(cIdx+1);
            }
            if(cpos0 < 0 || tpos < cpos0){ /// a course with 2 teachers!? Assume the teacher belongs to the previous course
                cteachersIdx.add(cIdx-1);
                i++;
            } else if(cpos1 < 0 || (cpos0 < tpos && cpos1 > tpos)){
                cteachersIdx.add(cIdx);
                i++; cIdx++;
            } else { /// tpos > cpos1 ==> teacher belongs to next classes
                cIdx++;
            }
        }

        for(int i=0 ; i<cname.size() ; i++){
            String tname = "";
            for(int j=0 ; j<cteachersIdx.size() ; j++){
                int cidx = cteachersIdx.get(j);
                if(cidx == i){
                    tname += cteachers.get(j);
                }
            }
            cteachersfinal.add(tname);
        }


        // Course Link Array
        Pattern p_courselink = Pattern.compile("(?<=href=\")https\\:\\/\\/moodle\\.hku\\.hk\\/course\\/view\\.php\\?id=(.*?)(?=\")");
        Matcher m_courselink = p_courselink.matcher(HTMLsource);

        ArrayList<String> ar_courselink = new ArrayList<String>();
        while (m_courselink.find()) {
            String course_link = m_courselink.group(0);
            boolean flag = true;
            for (String sss : ar_courselink) {
                if (sss.equals(course_link)) {
                    flag = false;
                }
            }
            if (flag) {
                ar_courselink.add(course_link);
            }

        }

        for (int i = 0; i < cname.size(); i++) {
            ar_course.add(new Course(cname.get(i), cteachersfinal.get(i), ar_courselink.get(i)));
        }

        this.CourseArray = ar_course;
    }

    // Sort any String array with course's chronological order
    @RequiresApi(api = Build.VERSION_CODES.N)
    public ArrayList<String> sortBySemesterDESC(ArrayList<String> liststring){
        ArrayList<Course> ar_course = this.CourseArray;
        Integer[] indexes = getCourseNameSequence(ar_course);

        if (ar_course.size() == liststring.size()) {
            String[] arSortedList = new String[liststring.size()];
            for (int i = 0; i < liststring.size(); i++) {
                arSortedList[i] = liststring.get(indexes[i]);
            }
            List<String> list = new ArrayList<>(Arrays.asList(arSortedList));
            return (ArrayList<String>) list;
        }else{
            return liststring;
        }
    }

    // Sort the courelist in chronological order
    @RequiresApi(api = Build.VERSION_CODES.N)
    public void sortBySemesterDESC(){
        ArrayList<Course> ar_course = this.CourseArray;
        ArrayList<Course> result = new ArrayList<>();
        Integer[] indexes = getCourseNameSequence(ar_course);

        for (int i : indexes) {
            result.add(ar_course.get(i));
        }
        this.CourseArray = result;
    }

    // Get the list of Courses' Parameter
    public ArrayList<String> getCourseParameterList(String param){
        ArrayList<String> result = new ArrayList<>();
        switch(param) {
            case "Name":
                for(Course i : CourseArray) result.add(i.getCourseName());
                break;
            case "Year":
                for(Course i : CourseArray) result.add(i.getCourseYear());
                break;
            case "Session":
                for(Course i : CourseArray) result.add(i.getCourseSession());
                break;
            case "Code":
                for(Course i : CourseArray) result.add(i.getCourseCode());
                break;
            case "Link":
                for(Course i : CourseArray) result.add(i.getCourseLink());
                break;
            default:
                System.out.println("Invalid Param Code!");
                break;
        }
        return result;
    }

    // Get the list of Courses of this semester
    public ArrayList<Course> getThisYearsCourses() {
        if(testing) {
            return CourseArray;
        }else {
            ArrayList<Course> result = new ArrayList<>();

            String dt_yearstart;
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);

            int month = cal.get(Calendar.MONTH);

            if (month < 8) { // 8 = Sept
                dt_yearstart = Integer.toString(cal.get(Calendar.YEAR) - 1);
            } else {
                dt_yearstart = Integer.toString(cal.get(Calendar.YEAR));
            }

            for (int i = 0; i < this.CourseArray.size(); i++) {
                if (this.getCourseArray().get(i).getCourseYear().equals(dt_yearstart)) {
                    result.add(this.getCourseArray().get(i));
                }
            }

            return result;
        }
    }

    // Return the sorting order of the course according to its chronological order
    private Integer[] getCourseNameSequence(ArrayList<Course> ar_courses){
        try{

            ArrayList<String> arCodeYear = new ArrayList<String>();
            for (int i = 0; i < ar_courses.size(); i++) {
                arCodeYear.add(ar_courses.get(i).getCourseYear()
                        + ar_courses.get(i).getCourseSession()
                        + ar_courses.get(i).getCourseCode());
            }

            ArrayIndexComparator comparator = new ArrayIndexComparator(arCodeYear);
            Integer[] indexes = comparator.createIndexArray();
            Arrays.sort(indexes, comparator);

            return indexes;
        } catch (Exception e) {
            return new Integer[0] ;
        }
    }

    public ArrayList<Course> getCourseArray() {
        return CourseArray;
    }

    public void setCourse(Integer pos, Course course){
        CourseArray.set(pos, course);
    }
}