/**
 * 
 */
package com.koocaa.thecarnaby;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import com.koocaa.thecarnaby.model.Coupon;

/**
 * @author AChien
 *
 */
public class Coupons extends Nav {
	public static Coupon[] coupons = {
		new Coupon(1, 3, "99元促销 基本款圆领短袖羊绒衫，全场促销，全色系全码", "99 for all pieces","活动规则：\n本促销活动适用全国各大商场专卖店，折扣券不可折现，购买产品不享受7日无理由退货服务。","Rules: \nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","2010-3-1","2010-6-1"),
		new Coupon(2, 5, "129元促销 基本款圆领短袖羊绒衫，全场促销，全色系全码", "129 for all pieces", "活动规则：\n本促销活动适用全国各大商场专卖店，折扣券不可折现，购买产品不享受7日无理由退货服务。","Rules: \nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","2010-3-1","2010-6-1"),
		new Coupon(3, 8, "40元促销 基本款圆领短袖羊绒衫，全场促销，全色系全码", "40 for all pieces", "活动规则：\n本促销活动适用全国各大商场专卖店，折扣券不可折现，购买产品不享受7日无理由退货服务。","Rules: \nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","2010-3-1","2010-6-1")
	};
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.coupons);
        
        setupTitle(R.string.title_coupons);
        
        CouponAdapter ca = new CouponAdapter(this);
        ListView lv = (ListView) findViewById(R.id.coupon_lv);
        lv.setAdapter(ca);
    }
    
    private class CouponAdapter extends BaseAdapter {

        /**
         * Remember our context so we can use it when constructing views.
         */
        private Context mContext;
        
        public CouponAdapter(Context context) {
            mContext = context;
        }

        public int getCount() {
            return coupons.length;
        }

        public Object getItem(int position) {
            return position;
        }

        public long getItemId(int position) {
            return position;
        }

        public View getView(int position, View convertView, ViewGroup parent) {
        	ViewWrapper wrapper;
            Coupon coupon = coupons[position];
            
            if (convertView == null) {
            	LayoutInflater inflater = getLayoutInflater();
            	convertView = inflater.inflate(R.layout.coupon_list_item, parent, false);
            	wrapper = new ViewWrapper(convertView);
            	convertView.setTag(wrapper);
            	
            	wrapper.getGotoShop().setTag(coupon.shop_id);
            	wrapper.getGotoShop().setOnClickListener(new View.OnClickListener(){

    				public void onClick(View v) {
    					Intent act = new Intent(Coupons.this, ShopDetail.class);
    					act.putExtra("shop_id", Integer.parseInt(v.getTag().toString()));
    					startActivity(act);
    				}
        			
        		});
        		
            	wrapper.getShareCoupon().setTag(coupon);
        		wrapper.getShareCoupon().setOnClickListener(new View.OnClickListener(){

    				public void onClick(View v) {
    					Coupon coupon = (Coupon) v.getTag();
    					Intent intent = new Intent(Intent.ACTION_SEND);
    					intent.putExtra(Intent.EXTRA_SUBJECT, R.string.label_share_subject_coupon);
    					intent.putExtra(Intent.EXTRA_TEXT, coupon.description);
    					startActivity(Intent.createChooser(intent, getResources().getString(R.string.title_share)));
    				}
        			
        		});
            } else {
            	wrapper = (ViewWrapper) convertView.getTag();
            }
            
            wrapper.getTitle().setText(FieldHelper.getLocalFieldValue(mContext, Coupon.class, "name", coupon));
            wrapper.getDesc().setText(FieldHelper.getLocalFieldValue(mContext, Coupon.class, "description", coupon));

            return convertView;
        } 
    }
    
    private class ViewWrapper{
    	private View base;
    	private TextView cp_title,cp_desc;
    	private Button cp_gotoshop, cp_sharecoupon;
    	
    	public ViewWrapper(View base){
    		this.base = base;
    	}
    	
    	public TextView getTitle(){
    		if (cp_title == null)
    			cp_title = (TextView) base.findViewById(R.id.cp_title);
    		return cp_title;
    	}
    	
    	public TextView getDesc(){
    		if (cp_desc == null)
    			cp_desc = (TextView) base.findViewById(R.id.cp_description);
    		return cp_desc;
    	}
    	
    	public Button getGotoShop(){
    		if (cp_gotoshop == null)
    			cp_gotoshop = (Button) base.findViewById(R.id.cp_gotomap_btn);
    		return cp_gotoshop;
    	}
    	
    	public Button getShareCoupon(){
    		if (cp_sharecoupon == null)
    			cp_sharecoupon = (Button) base.findViewById(R.id.cp_share_btn);
    		return cp_sharecoupon;
    	}
    	
    }
}
