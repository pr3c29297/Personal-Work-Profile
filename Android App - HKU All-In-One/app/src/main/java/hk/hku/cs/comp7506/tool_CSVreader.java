package hk.hku.cs.comp7506;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import android.content.Context;

public class tool_CSVreader {
    private ArrayList<String> header;
    private Context context;

    public ArrayList<ArrayList<String>> readCSVFile(InputStream fileInputstream) throws IOException {
        return readCSVFile(fileInputstream, -1, null);
    }

    public ArrayList<ArrayList<String>> readCSVFile(InputStream fileInputstream, Integer filterpos, ArrayList<String> filter) throws IOException {

        String line = null;
        BufferedReader stream = null;
        ArrayList<ArrayList<String>> csvData = new ArrayList<>();
        ArrayList<String> header = new ArrayList<>();

        try {
            stream = new BufferedReader(
                    new InputStreamReader(fileInputstream));
            String[] header_split = stream.readLine().split(",");
            for (String data : header_split)
                header.add(data);
            this.header = header;

            while ((line = stream.readLine()) != null) {
                String[] splitted = line.split(",");

                if(filterpos >= 0 && filter != null && !filter.contains(splitted[filterpos]))
                    continue;

                ArrayList<String> dataLine = new ArrayList<String>(splitted.length);
                for (String data : splitted)
                    dataLine.add(data);
                csvData.add(dataLine);
            }
        } finally {
            if (stream != null)
                stream.close();
        }

        return csvData;

    }

}
