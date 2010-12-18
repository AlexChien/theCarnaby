package com.koocaa.thecarnaby;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class SplashScreen extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        new Handler().postDelayed(new Runnable(){ 
            public void run() { 
                 /* Create an Intent that will start the Main Brands Activity. */ 
            	SplashScreen.this.startActivity(new Intent(SplashScreen.this, Shops.class)); 
                SplashScreen.this.finish(); 
            } 
       }, 2900); //2900 for release
    }
}