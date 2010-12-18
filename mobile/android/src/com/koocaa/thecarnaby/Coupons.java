/**
 * 
 */
package com.koocaa.thecarnaby;

import android.os.Bundle;
import android.view.Window;

/**
 * @author AChien
 *
 */
public class Coupons extends Nav {
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.coupons);
        
        setupTitle(R.string.title_coupons);
    }
}
