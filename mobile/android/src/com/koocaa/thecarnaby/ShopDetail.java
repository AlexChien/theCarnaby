package com.koocaa.thecarnaby;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.koocaa.thecarnaby.model.Coupon;
import com.koocaa.thecarnaby.model.Shop;

public class ShopDetail extends Nav {
	private static String TAG = "ShopDetail";
	private Shop theShop;
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.shopdetails);
        
        Bundle extras = getIntent().getExtras();
        int shop_id = extras.getInt("shop_id");
        theShop = Shops.find(shop_id);
        
        Log.w(TAG, "shop_id: " + shop_id);
        Log.w(TAG, "shop_name: " + theShop.name);
        
        setupTitle(R.string.title_shopdetail);
        
        ImageView shop_image = (ImageView) findViewById(R.id.sd_image);
        TextView shopname_txt = (TextView) findViewById(R.id.sd_name_txt);
        TextView shopaddr_txt = (TextView) findViewById(R.id.sd_address_txt);
        Button gotomap_btn = (Button) findViewById(R.id.goto_map_btn);
        
        shop_image.setImageResource(theShop.image_res_id);
        shopname_txt.setText(FieldHelper.getLocalFieldValue(getApplicationContext(), Shop.class, "name", theShop));
        shopaddr_txt.setText(FieldHelper.getLocalFieldValue(getApplicationContext(), Shop.class, "address", theShop));
        
        gotomap_btn.setOnClickListener(new View.OnClickListener(){

			public void onClick(View v) {
				Intent act = new Intent(ShopDetail.this, ShopMap.class);
				act.putExtra("shop_id", theShop.id);
				startActivity(act);
			}
        	
        });
    }
}
