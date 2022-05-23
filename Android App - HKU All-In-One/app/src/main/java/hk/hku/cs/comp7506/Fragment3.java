package hk.hku.cs.comp7506;

import static android.content.Context.MODE_PRIVATE;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragmentCompat;

import java.util.ArrayList;

public class Fragment3 extends Fragment {
    private static Context mContext;
    private static Activity activity;
    SharedPreferences sharedPreferences;
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment3_layout, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        mContext = this.getContext();
        activity = this.getActivity();
        sharedPreferences = getActivity().getSharedPreferences("AccountInfo",MODE_PRIVATE);
    }



    public static class MainPreferenceFragment extends PreferenceFragmentCompat {
        @Override
        public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
            setPreferencesFromResource(R.xml.root_preferences, rootKey);
            SharedPreferences ac = getActivity().getSharedPreferences("AccountInfo", MODE_PRIVATE);
            Preference PrefName = findPreference(getString(R.string.key_username));
            PrefName.setSummary(ac.getString("username", "DefaultText"));
            Preference PrefFeedBack = findPreference(getString(R.string.key_send_feedback));
            PrefFeedBack.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
                public boolean onPreferenceClick(Preference preference) {
                    sendFeedback(getActivity());
                    return true;
                }
            });
            Preference PrefStay = findPreference("key_stay_login");
            boolean state = ac.getBoolean("StayLogin", false);
            PrefStay.setDefaultValue(state);
            PrefStay.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
                @Override
                public boolean onPreferenceChange(Preference preference, Object newValue) {
                    if (state) {
                        SharedPreferences.Editor acEdit = getActivity().getSharedPreferences("AccountInfo", MODE_PRIVATE).edit();
                        acEdit.putBoolean("StayLogin", false);
                        acEdit.remove("username");
                        acEdit.remove("upw");
                        acEdit.apply();
                    } else {
                        SharedPreferences.Editor acEdit = getActivity().getSharedPreferences("AccountInfo", MODE_PRIVATE).edit();
                        acEdit.putBoolean("StayLogin", true);
                        acEdit.apply();
                    }
                    return true;
                }
            });
            Preference PrefLogout = findPreference(getString(R.string.key_logout));
            PrefLogout.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
                public boolean onPreferenceClick(Preference preference) {
                    jumpLogout();
                    return true;
                }
            });
        }
    }

    public static void jumpLogout() {
        Intent logout = new Intent(mContext, MainActivity.class);
        mContext.startActivity(logout);
        activity.finish();
    }
    public static void sendFeedback(Context context) {
        String body = null;
        try {
            body = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            body = "\n\n-----------------------------\n Device OS: Android \n Device OS version: " +
                    Build.VERSION.RELEASE + "\n App Version: " + activity.getString(R.string.version) + "\n Device Brand: " + Build.BRAND +
                    "\n Device Model: " + Build.MODEL + "\n Device Manufacturer: " + Build.MANUFACTURER;
        } catch (PackageManager.NameNotFoundException e) {
        }
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("message/rfc822");
        intent.putExtra(Intent.EXTRA_EMAIL, new String[]{"u3528129@connect.hku.hk"});
        intent.putExtra(Intent.EXTRA_SUBJECT, "Feedback on HKU All-in-One");
        intent.putExtra(Intent.EXTRA_TEXT, body);
        context.startActivity(Intent.createChooser(intent, context.getString(R.string.choose_email_client)));
    }

}
