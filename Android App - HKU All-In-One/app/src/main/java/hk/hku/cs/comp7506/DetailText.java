package hk.hku.cs.comp7506;

import android.os.AsyncTask;
import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.squareup.picasso.Picasso;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;

import java.io.IOException;

public class DetailText extends AppCompatActivity {
    private ImageView imageView;
    private TextView titleTextView, detailTextView;
    private String detailString, strWithNewLines;
    private ProgressBar progressBar;
    private Toolbar detailtoolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.covid_measurement_detail);
        imageView = findViewById(R.id.imageView);
        progressBar = findViewById(R.id.progressBarDetail);
        //titleTextView=findViewById(R.id.textView);
        detailTextView=findViewById(R.id.detailTextView);
        //titleTextView.setText(getIntent().getStringExtra("title"));
        detailtoolbar = (Toolbar) findViewById(R.id.detail_toolbar);
        detailtoolbar.setTitle(getIntent().getStringExtra("title"));

        detailtoolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });

        //Picasso.get().load("https://thehkshopper.com/wp-content/uploads/2019/06/hku-e1562157250157.jpg").into(imageView);
        Content content = new Content();
        content.execute();

    }

    private class Content extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressBar.setVisibility(View.VISIBLE);
            progressBar.startAnimation(AnimationUtils.loadAnimation(DetailText.this, android.R.anim.fade_in));
        }

        @Override
        protected void onPostExecute(Void unused) {
            super.onPostExecute(unused);
            progressBar.setVisibility(View.GONE);
            progressBar.startAnimation(AnimationUtils.loadAnimation(DetailText.this, android.R.anim.fade_out));
            detailTextView.setText(detailString);
            detailTextView.setMovementMethod(new ScrollingMovementMethod());
        }

        @Override
        protected void onCancelled() {
            super.onCancelled();
        }

        @Override
        protected Void doInBackground(Void... voids) {
            try {
                String detailUrl = getIntent().getStringExtra("detail");
                Document doc = Jsoup.connect(detailUrl).get();
                Elements data = doc.getElementsByClass("entry-content clearfix");
                detailString = data.toString();
                Log.d("detaHTML",""+detailString);
                String temp = detailString.replace("<br>", "$$$");
                temp = temp.replace("</br>", "$$$");
                temp = temp.replace("<p>","***");
                temp = temp.replace("</p>","***");
                temp = temp.replace("<li>","***");
                Document tempDoc = Jsoup.parse(temp);
                detailString = tempDoc.text().replace("$$$","\n").toString();
                detailString = detailString.replace("***","\n");

//                Log.d("detailafter",""+detailString);
//                detailString = data.text();


            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
