package com.koocaa.thecarnaby;

import android.os.Bundle;
import android.view.Window;

public class Share extends Nav {
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.share);
        
        setupTitle(R.string.title_share);
    }
}
