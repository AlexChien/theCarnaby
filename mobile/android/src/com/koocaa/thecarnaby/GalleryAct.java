package com.koocaa.thecarnaby;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.util.Log;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.Toast;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.AdapterView.OnItemClickListener;

//type: 1:collection 2:newarrivals
//collection_id: 1:YANZI 2:punk 3:
public class GalleryAct extends Nav {
	private final String TAG = "GalleryAct";
//	private Integer[] mThumbsNewArrival = {R.drawable.thumb_46,R.drawable.thumb_47,R.drawable.thumb_48,R.drawable.thumb_49,R.drawable.thumb_50,R.drawable.thumb_51,R.drawable.thumb_52,R.drawable.thumb_53,R.drawable.thumb_54,R.drawable.thumb_55,R.drawable.thumb_56,R.drawable.thumb_57,R.drawable.thumb_58,R.drawable.thumb_59,R.drawable.thumb_60,R.drawable.thumb_61,R.drawable.thumb_62,R.drawable.thumb_63,R.drawable.thumb_64,R.drawable.thumb_12,R.drawable.thumb_13,R.drawable.thumb_14,R.drawable.thumb_15,R.drawable.thumb_16,R.drawable.thumb_17,R.drawable.thumb_18,R.drawable.thumb_19,R.drawable.thumb_20,R.drawable.thumb_21,R.drawable.thumb_22,R.drawable.thumb_23,R.drawable.thumb_1,R.drawable.thumb_2,R.drawable.thumb_3,R.drawable.thumb_4,R.drawable.thumb_5};
//	private Integer[] mLargesNewArrival = {R.drawable.c_46,R.drawable.c_47,R.drawable.c_48,R.drawable.c_49,R.drawable.c_50,R.drawable.c_51,R.drawable.c_52,R.drawable.c_53,R.drawable.c_54,R.drawable.c_55,R.drawable.c_56,R.drawable.c_57,R.drawable.c_58,R.drawable.c_59,R.drawable.c_60,R.drawable.c_61,R.drawable.c_62,R.drawable.c_63,R.drawable.c_64,R.drawable.c_12,R.drawable.c_13,R.drawable.c_14,R.drawable.c_15,R.drawable.c_16,R.drawable.c_17,R.drawable.c_18,R.drawable.c_19,R.drawable.c_20,R.drawable.c_21,R.drawable.c_22,R.drawable.c_23,R.drawable.c_1,R.drawable.c_2,R.drawable.c_3,R.drawable.c_4,R.drawable.c_5};
//	private Integer[] mThumbs_1 = {R.drawable.thumb_1,R.drawable.thumb_2,R.drawable.thumb_3,R.drawable.thumb_4,R.drawable.thumb_5,R.drawable.thumb_6,R.drawable.thumb_7,R.drawable.thumb_8,R.drawable.thumb_9,R.drawable.thumb_10,R.drawable.thumb_11,R.drawable.thumb_12,R.drawable.thumb_13,R.drawable.thumb_14,R.drawable.thumb_15};
//	private Integer[] mLarges_1 = {R.drawable.c_1,R.drawable.c_2,R.drawable.c_3,R.drawable.c_4,R.drawable.c_5,R.drawable.c_6,R.drawable.c_7,R.drawable.c_8,R.drawable.c_9,R.drawable.c_10,R.drawable.c_11,R.drawable.c_12,R.drawable.c_13,R.drawable.c_14,R.drawable.c_15};
//	private Integer[] mThumbs_2 = {R.drawable.thumb_16,R.drawable.thumb_17,R.drawable.thumb_18,R.drawable.thumb_19,R.drawable.thumb_20,R.drawable.thumb_21,R.drawable.thumb_22,R.drawable.thumb_23,R.drawable.thumb_24,R.drawable.thumb_25,R.drawable.thumb_26,R.drawable.thumb_27,R.drawable.thumb_28,R.drawable.thumb_29,R.drawable.thumb_30,R.drawable.thumb_31,R.drawable.thumb_32,R.drawable.thumb_33,R.drawable.thumb_34,R.drawable.thumb_35,R.drawable.thumb_36,R.drawable.thumb_37,R.drawable.thumb_38,R.drawable.thumb_39,R.drawable.thumb_40,R.drawable.thumb_41,R.drawable.thumb_42,R.drawable.thumb_43,R.drawable.thumb_44,R.drawable.thumb_45,R.drawable.thumb_46,R.drawable.thumb_47,R.drawable.thumb_48};
//	private Integer[] mLarges_2 = {R.drawable.c_16,R.drawable.c_17,R.drawable.c_18,R.drawable.c_19,R.drawable.c_20,R.drawable.c_21,R.drawable.c_22,R.drawable.c_23,R.drawable.c_24,R.drawable.c_25,R.drawable.c_26,R.drawable.c_27,R.drawable.c_28,R.drawable.c_29,R.drawable.c_30,R.drawable.c_31,R.drawable.c_32,R.drawable.c_33,R.drawable.c_34,R.drawable.c_35,R.drawable.c_36,R.drawable.c_37,R.drawable.c_38,R.drawable.c_39,R.drawable.c_40,R.drawable.c_41,R.drawable.c_42,R.drawable.c_43,R.drawable.c_44,R.drawable.c_45,R.drawable.c_46,R.drawable.c_47,R.drawable.c_48};
//	private Integer[] mThumbs_3 = {R.drawable.thumb_49,R.drawable.thumb_50,R.drawable.thumb_51,R.drawable.thumb_52,R.drawable.thumb_53,R.drawable.thumb_54,R.drawable.thumb_55,R.drawable.thumb_56,R.drawable.thumb_57,R.drawable.thumb_58,R.drawable.thumb_59,R.drawable.thumb_60,R.drawable.thumb_61,R.drawable.thumb_62,R.drawable.thumb_63,R.drawable.thumb_64,R.drawable.thumb_65,R.drawable.thumb_66,R.drawable.thumb_67,R.drawable.thumb_68,R.drawable.thumb_69,R.drawable.thumb_70,R.drawable.thumb_71,R.drawable.thumb_72,R.drawable.thumb_73,R.drawable.thumb_74,R.drawable.thumb_75,R.drawable.thumb_76,R.drawable.thumb_77,R.drawable.thumb_78,R.drawable.thumb_79,R.drawable.thumb_80};
//	private Integer[] mLarges_3 = {R.drawable.c_49,R.drawable.c_50,R.drawable.c_51,R.drawable.c_52,R.drawable.c_53,R.drawable.c_54,R.drawable.c_55,R.drawable.c_56,R.drawable.c_57,R.drawable.c_58,R.drawable.c_59,R.drawable.c_60,R.drawable.c_61,R.drawable.c_62,R.drawable.c_63,R.drawable.c_64,R.drawable.c_65,R.drawable.c_66,R.drawable.c_67,R.drawable.c_68,R.drawable.c_69,R.drawable.c_70,R.drawable.c_71,R.drawable.c_72,R.drawable.c_73,R.drawable.c_74,R.drawable.c_75,R.drawable.c_76,R.drawable.c_77,R.drawable.c_78,R.drawable.c_79,R.drawable.c_80};
//	private Integer[] mThumbs_4 = {R.drawable.thumb_4_2,R.drawable.thumb_4_3,R.drawable.thumb_4_4,R.drawable.thumb_4_5,R.drawable.thumb_4_6,R.drawable.thumb_4_7,R.drawable.thumb_4_8,R.drawable.thumb_4_9,R.drawable.thumb_4_10,R.drawable.thumb_4_11};
//	private Integer[] mLarges_4 = {R.drawable.c_4_2,R.drawable.c_4_3,R.drawable.c_4_4,R.drawable.c_4_5,R.drawable.c_4_6,R.drawable.c_4_7,R.drawable.c_4_8,R.drawable.c_4_9,R.drawable.c_4_10,R.drawable.c_4_11};
	
	private Integer[] mThumbs_5 = {R.drawable.thumb_5_1,R.drawable.thumb_5_2,R.drawable.thumb_5_3,R.drawable.thumb_5_4,R.drawable.thumb_5_5,R.drawable.thumb_5_6,R.drawable.thumb_5_7,R.drawable.thumb_5_8,R.drawable.thumb_5_9,R.drawable.thumb_5_10,R.drawable.thumb_5_11,R.drawable.thumb_5_12,R.drawable.thumb_5_13,R.drawable.thumb_5_14,R.drawable.thumb_5_20,R.drawable.thumb_5_19,R.drawable.thumb_5_18,R.drawable.thumb_5_17,R.drawable.thumb_5_16,R.drawable.thumb_5_15};
	private Integer[] mLarges_5 = {R.drawable.c_5_1,R.drawable.c_5_2,R.drawable.c_5_3,R.drawable.c_5_4,R.drawable.c_5_5,R.drawable.c_5_6,R.drawable.c_5_7,R.drawable.c_5_8,R.drawable.c_5_9,R.drawable.c_5_10,R.drawable.c_5_11,R.drawable.c_5_12,R.drawable.c_5_13,R.drawable.c_5_14,R.drawable.c_5_20,R.drawable.c_5_19,R.drawable.c_5_18,R.drawable.c_5_17,R.drawable.c_5_16,R.drawable.c_5_15};
	private Integer[] mThumbs_6 = {R.drawable.thumb_6_39,R.drawable.thumb_6_40,R.drawable.thumb_6_41,R.drawable.thumb_6_42,R.drawable.thumb_6_43,R.drawable.thumb_6_44,R.drawable.thumb_6_38,R.drawable.thumb_6_45,R.drawable.thumb_6_37,R.drawable.thumb_6_35,R.drawable.thumb_6_34,R.drawable.thumb_6_33,R.drawable.thumb_6_32,R.drawable.thumb_6_31,R.drawable.thumb_6_36};
	private Integer[] mLarges_6 = {R.drawable.c_6_39,R.drawable.c_6_40,R.drawable.c_6_41,R.drawable.c_6_42,R.drawable.c_6_43,R.drawable.c_6_44,R.drawable.c_6_38,R.drawable.c_6_45,R.drawable.c_6_37,R.drawable.c_6_35,R.drawable.c_6_34,R.drawable.c_6_33,R.drawable.c_6_32,R.drawable.c_6_31,R.drawable.c_6_36};
	private Integer[] mThumbs;
	private Integer[] mLarges;
	private ImageView bigImage;
	
	private Gallery g;
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.galleryact);
        
//        general title
        int title = R.string.title_gallery;
        
        Bundle extras = getIntent().getExtras();
        int collection_id = 0;
        int type = 0;
        try {
        	collection_id = extras.getInt("collection_id");
            type = extras.getInt("type");
            
            Log.i(TAG, "Collection Id: " + collection_id);
            Log.i(TAG, "Type: " + type);
		} catch (Exception e) {
			Log.e(TAG, "intent doesn't have id info, using default value");
		}
		
//		determine images
		if (type == 2) {
			//new arrivals
//			mThumbs = mThumbsNewArrival;
//			mLarges = mLargesNewArrival;
//			title = R.string.title_newarrivals;
			mThumbs = mThumbs_6;
			mLarges = mLarges_6;
			title = R.string.label_collection4;
		} else if (type == 1) {
			switch (collection_id) {
//			YANZI - 2010FW
//			case 1:
//				mThumbs = mThumbs_1;
//				mLarges = mLarges_1;
//				title = R.string.label_collection1;
//				break;
//
////			theCanraby - PUNK
//			case 2:
//				mThumbs = mThumbs_2;
//				mLarges = mLarges_2;
//				title = R.string.label_collection2;
//				break;
//				
////			theCarnaby - VICTORIA
//			case 3:
//				mThumbs = mThumbs_3;
//				mLarges = mLarges_3;
//				title = R.string.label_collection4;
//				break;
			
			case 4:
				mThumbs = mThumbs_6;
				mLarges = mLarges_6;
				title = R.string.label_collection4;
				break;
			
			case 5:
				mThumbs = mThumbs_5;
				mLarges = mLarges_5;
				title = R.string.label_collection5;
				break;
			default:
				mThumbs = mThumbs_6;
				mLarges = mLarges_6;
				title = R.string.label_collection4;
				break;
			}
		} else {
			Log.e(TAG,"invalid collection type");
			mThumbs = mThumbs_6;
			mLarges = mLarges_6;
		}
		
		setupTitle(title);
		
        
		// Reference the Gallery view
        g = (Gallery) findViewById(R.id.gallery);
        bigImage = (ImageView) findViewById(R.id.galleryLargeImage);
        bigImage.setImageResource(mLarges[0]);
//        TODO click on imageview to slide down and hide gallery thumbnails
//        bigImage.setOnClickListener(new View.OnClickListener(){
//        	public void onClick(View view){
//        		Animation animation = AnimationUtils.loadAnimation(GalleryAct.this, R.anim.slide_down);
//        		g.startAnimation(animation);
//        	}
//        });
        
        // Set the adapter to our custom adapter (below)
        g.setAdapter(new ImageAdapter(this));
        g.setSelection(2); 
        
        // Set a item click listener, and just Toast the clicked position
        g.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
                bigImage.setImageResource(mLarges[position]);
            }
        });
        
        // We also want to show context menu for long pressed items in the gallery
        registerForContextMenu(g);
    }
    
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenuInfo menuInfo) {
//        menu.add(R.string.gallery_2_text);
    }
    
    @Override
    public boolean onContextItemSelected(MenuItem item) {
        AdapterContextMenuInfo info = (AdapterContextMenuInfo) item.getMenuInfo();
        Toast.makeText(this, "Longpress: " + info.position, Toast.LENGTH_SHORT).show();
        return true;
    }

    public class ImageAdapter extends BaseAdapter {
        int mGalleryItemBackground;
        private Context mContext;
        
        public ImageAdapter(Context c) {
            mContext = c;
            // See res/values/attrs.xml for the <declare-styleable> that defines
            // GalleryAct.
            TypedArray a = obtainStyledAttributes(R.styleable.GalleryAct);
            mGalleryItemBackground = a.getResourceId(
                    R.styleable.GalleryAct_android_galleryItemBackground, 0);
            a.recycle();
        }

        public int getCount() {
            return mThumbs.length;
        }

        public Object getItem(int position) {
            return position;
        }

        public long getItemId(int position) {
            return position;
        }

        public View getView(int position, View convertView, ViewGroup parent) {
        	if (convertView == null) {
        		convertView = new ImageView(mContext);
        	}
            ImageView i = new ImageView(mContext);
            
//            BitmapFactory.Options options=new BitmapFactory.Options();
//            options.inSampleSize = 8;
	        //貌似这个options的功能是返回缩略图，10即表示长和宽为原来的1／10，即面积为原来的1／100
	        //缩略图可以减少内存占用
//            Bitmap bm = BitmapFactory.decodeResource(mContext.getResources(), mThumbImageIds[position], options);
//	  	    i.setImageBitmap(bm);
//	  	    bm.recycle();
	  	    
        	((ImageView) convertView).setImageResource(mThumbs[position]);
//        	((ImageView) convertView).setImageResource(mLarges[position]);
        	((ImageView)convertView).setScaleType(ImageView.ScaleType.FIT_XY);
//            i.setLayoutParams(new Gallery.LayoutParams(80, 120));
        	i.setLayoutParams(new Gallery.LayoutParams(64, 96));
            
            // The preferred Gallery item background
        	convertView.setBackgroundResource(mGalleryItemBackground);
            
            return convertView;
        }


        
    }
    
    
}
