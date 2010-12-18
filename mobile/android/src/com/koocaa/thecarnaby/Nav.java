package com.koocaa.thecarnaby;

import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.Window;
import android.widget.TextView;

public class Nav extends Activity {
	
	public void setupTitle(int resid){
		getWindow().setFeatureInt(Window.FEATURE_CUSTOM_TITLE, R.layout.custom_title);
        TextView title_txt = (TextView) findViewById(R.id.title_txt);
        title_txt.setText(resid);
	}

	public boolean onCreateOptionsMenu(Menu menu){
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.nav, menu);
		return true;
	}
	
	public boolean onOptionsItemSelected(MenuItem item){
		switch (item.getItemId()) {
		case R.id.m_brands:
			startActivity(new Intent(this, Brands.class));
	        return true;

		case R.id.m_newarrivals:
			Intent act = new Intent(this, GalleryAct.class);
			act.putExtra("type", 2);
			startActivity(act);
	        return true;

		case R.id.m_coupons:
			startActivity(new Intent(this, Coupons.class));
	        return true;

		case R.id.m_shops:
			startActivity(new Intent(this, Shops.class));
	        return true;

		case R.id.m_videos:
			startActivity(new Intent(this, Videos.class));
	        return true;

		case R.id.m_share:
			startActivity(new Intent(this, Share.class));
	        return true;

		case R.id.m_preferences:
			startActivity(new Intent(this, Preferences.class));
	        return true;

		default:
			return super.onOptionsItemSelected(item);
		}
	}
}
