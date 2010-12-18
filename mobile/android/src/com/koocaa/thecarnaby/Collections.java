package com.koocaa.thecarnaby;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.ImageView;

public class Collections extends Nav {
	private String TAG = "Collections";
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.collections);
        
        Bundle extras = getIntent().getExtras();
        int collection_id = 0;
        int brand_name = R.string.title_collections;
        try {
        	collection_id = extras.getInt("collection_id");
        	brand_name = extras.getInt("brand_name");
            Log.i(TAG, "Collection Id: " + collection_id);
		} catch (Exception e) {
			Log.e(TAG, "intent doesn't have id info, using default value");
		}
		
        setupTitle(brand_name);
        
//        add listeners for collection covers (hard coded)
//        only for theCarnaby brand, which has multiple collections
        ImageView col2 = (ImageView) findViewById(R.id.col_cover_image_2);
        ImageView col3 = (ImageView) findViewById(R.id.col_cover_image_3);
        
        col2.setOnClickListener(new View.OnClickListener(){
        	public void onClick(View view){
        		Intent act = new Intent(Collections.this, GalleryAct.class);
        		act.putExtra("collection_id", 2);
        		act.putExtra("type", 1);
        		startActivity(act);
        	}
        });
        
        col3.setOnClickListener(new View.OnClickListener(){
        	public void onClick(View view){
        		Intent act = new Intent(Collections.this, GalleryAct.class);
        		act.putExtra("collection_id", 3);
        		act.putExtra("type", 1);
        		startActivity(act);
        	}
        });
    }
}
