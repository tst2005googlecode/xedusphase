package org.love2d.android.dc;

import java.io.File;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Love2DDCActivity extends Activity {
    /** Called when the activity is first created. */
	
	Button love, game;
	Button blog, mods;
	TextView display;
	
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        love = (Button) findViewById(R.id.buttonlove);
        game = (Button) findViewById(R.id.buttongame);
        mods = (Button) findViewById(R.id.buttonmods);
        blog = (Button) findViewById(R.id.buttonblog);
        
        display = (TextView) findViewById(R.id.textView1);
        love.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://ghoulsblade.schattenkind.net/love-android/love-android.apk"));
				startActivity(browserIntent);
				
			}
		});
        game.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://xedusphase.googlecode.com/files/Phase.love"));
				startActivity(browserIntent);	
				// File (or directory) to be moved
				File file = new File("Phase.zip");

				// Destination directory
				File dir = new File("/mnt/sdcard/love/");

				// Move file to new directory
				boolean success = file.renameTo(new File(dir, file.getName()));
				if (!success) {
				    // File was not successfully moved
				}
			}
		});
        mods.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://code.google.com/p/xedusphase/wiki/PhaseModifications"));
				startActivity(browserIntent);
				
			}
		});
        blog.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://xedusphase.blogspot.com/"));
				startActivity(browserIntent);
				
			}
		});
        
    }
}