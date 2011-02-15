/**
 * 
 */
package com.koocaa.thecarnaby;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

/**
 * @author AChien
 *
 */
public class Brands extends Nav {
	private ColAdapter colAdapter;
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.brands);
        
        setupTitle(R.string.title_brands);
        
        ListView lv = (ListView) findViewById(R.id.col_lt);
        
        colAdapter = new ColAdapter(Brands.this);
        lv.setAdapter(colAdapter);
        lv.setOnItemClickListener(new OnItemClickListener(){
        	public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
        		if (view != null) {
        			int collection_id = position+4;
        			Intent act;
        			
//        			if YANZI, go to gallery directly
//        			if (collection_id == 1) {
//        				act = new Intent(Brands.this, GalleryAct.class);
//        			} 
//        			if theCarnaby, go to collection list
//        			else {
//        				act = new Intent(Brands.this, Collections.class);
//        				act.putExtra("brand_name", colAdapter.getTitle(position));
//        			}
        			
        			act = new Intent(Brands.this, GalleryAct.class);
        			act.putExtra("brand_name", colAdapter.getTitle(position));
        			Log.w("BRANDS","BrandName: "+colAdapter.getTitle(position));
        			
        			act.putExtra("collection_id", collection_id);
        			act.putExtra("type", 1);
        			startActivity(act);
        		}
        	}
        });
    }
    
    class ColAdapter extends BaseAdapter {
    	Context container;
    	//private int[] cols = {R.string.label_brand1,R.string.label_brand2};
    	private int[] cols = {R.string.label_collection4,R.string.label_collection5};
    	public ColAdapter(Context context) {
    		container = context;
		}

		public int getCount() {
			return 2;
		}

		public Object getItem(int position) {
			return position;
		}

		public long getItemId(int position) {
			return position;
		}
		
		public int getTitle(int position){
			return cols[position];
		}

		public View getView(int position, View convertView, ViewGroup parent) {
			TextView pv = (TextView) convertView;
			if (pv == null) {
				LayoutInflater inflater = getLayoutInflater();
				pv = (TextView) inflater.inflate(R.layout.collist_item, parent, false);
			}
			
			pv.setText(getResources().getText(cols[position]));

			return pv;

		}
    }
}
