package hk.hku.cs.comp7506;


import android.content.AsyncQueryHandler;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.CalendarContract.*;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;


public class QueryHandler extends AsyncQueryHandler
    {
        private static final String TAG = "QueryHandler";

        // Projection arrays
        private static final String[] CALENDAR_PROJECTION = new String[]{
            Calendars._ID
        };

        // The indices for the projection array above.
        private static final int CALENDAR_ID_INDEX = 0;

        private static final int CALENDAR = 0;
        private static final int EVENT    = 1;
        private static final int REMINDER = 2;

        private static QueryHandler queryHandler;

        // QueryHandler
        public QueryHandler(ContentResolver resolver)
        {
            super(resolver);
        }

        // insertEvent
        public static void insertEvent(Context context, String title, Date startDate, Date endDate, Time startTime,
                                       Time endTime, String venue, ArrayList<String> recurWD)
        {
            ContentValues values = new ContentValues();

            long startMillis = 0;
            long endMillis = 0;
            long allday = 0;

            Calendar startDT = Calendar.getInstance();
            Calendar endtDT = Calendar.getInstance();

            if(startTime == null || endTime == null){
                startDT.set(startDate.getYear(), startDate.getMonth(), startDate.getDay(), 0, 0);
                endtDT.set(endDate.getYear(), endDate.getMonth(), endDate.getDay(), 0, 0);
                allday = 1;
            } else {
                startDT.set(startDate.getYear(), startDate.getMonth(), startDate.getDay(), startTime.getHours(), startTime.getMinutes());
                endtDT.set(endDate.getYear(), endDate.getMonth(), endDate.getDay(), endTime.getHours(), endTime.getMinutes());
            }

            startMillis = startDT.getTimeInMillis();
            endMillis = endtDT.getTimeInMillis();

            //FREQ=WEEKLY;INTERVAL=1;BYDAY=SU,MO,TU,WE,TH,FR,SA;UNTIL=20220404T000000Z

            for(int i = 0; i < recurWD.size(); i++){
                recurWD.set(i, recurWD.get(i).substring(0,2));
            }

            String rrule = (
                    "FREQ=WEEKLY;INTERVAL=1;BYDAY="
                            + android.text.TextUtils.join(",", recurWD)
                            + ";UNTIL="
                            + (new SimpleDateFormat("yyyyMMdd'T'").format(endDate))
                            + (new SimpleDateFormat("HHmmss'Z'").format(endTime))
            );

            ContentResolver resolver = context.getContentResolver();

            if (queryHandler == null)
                queryHandler = new QueryHandler(resolver);

            values.put(Events.DTSTART, startMillis);
            values.put(Events.DTEND, endMillis);
            values.put(Events.RRULE, rrule);
            values.put(Events.EVENT_TIMEZONE, "HKT");
            values.put(Events.EVENT_LOCATION, venue);
            values.put(Events.TITLE, title);
            values.put(Events.TITLE, allday);

            queryHandler.startQuery(CALENDAR, values, Calendars.CONTENT_URI,
                    CALENDAR_PROJECTION, null, null, null);
        }

        // onQueryComplete
        @Override
        public void onQueryComplete(int token, Object object, Cursor cursor)
        {
            // Use the cursor to move through the returned records
            // cursor.moveToFirst();

            // Get the field values
            //long calendarID = cursor.getLong(CALENDAR_ID_INDEX);
            long calendarID = CALENDAR_ID_INDEX;

            if (BuildConfig.DEBUG)
                System.out.println("Calendar query complete " + calendarID);

            ContentValues values = (ContentValues) object;
            values.put(Events.CALENDAR_ID, calendarID);
            values.put(Events.EVENT_TIMEZONE,
                    TimeZone.getDefault().getDisplayName());

            startInsert(EVENT, null, Events.CONTENT_URI, values);
        }

        // onInsertComplete
        @Override
        public void onInsertComplete(int token, Object object, Uri uri)
        {
            if (uri != null)
            {
                if (BuildConfig.DEBUG)
                    System.out.println( "Insert complete " + uri.getLastPathSegment());

                switch (token)
                {
                    case EVENT:
                        long eventID = Long.parseLong(uri.getLastPathSegment());
                        ContentValues values = new ContentValues();
                        values.put(Reminders.MINUTES, 10);
                        values.put(Reminders.EVENT_ID, eventID);
                        values.put(Reminders.METHOD, Reminders.METHOD_ALERT);
                        startInsert(REMINDER, null, Reminders.CONTENT_URI, values);
                        break;
                }
            }
        }
    }
