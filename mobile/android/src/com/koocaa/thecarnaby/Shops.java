/**
 * 
 */
package com.koocaa.thecarnaby;

import java.util.ArrayList;
import java.util.Locale;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.TextView;
import android.widget.ExpandableListView.OnChildClickListener;

import com.koocaa.thecarnaby.model.Shop;

/**
 * @author AChien
 *
 */
public class Shops extends Nav {
	private static String TAG = "Shops";
	public static Shop[] shops = {
	    new Shop(1,
	            "零售",
	            "北京中关村津乐汇店",
	            "",
	            "北京","",
	            "北京市海淀区中关村大街15号中关村购物中心D区津乐汇地下二层",
	            "Beijing Zhongguancun La Vita",
	            "",
	            "Beijing","",
	            "B2 La Vita, D Area Zhonguancun Shopping Center, No.15 Zhongguancun Street, Haidian District, Beijing",
	            "39.97987","116.316429",
	            R.drawable.shop_1),
	    new Shop(2,
	            "零售",
	            "北京通县阳光生活广场",
	            "",
	            "北京","",
	            "北京市通州区九棵树瑞都景园北区A1号楼新阳光生活广场一层G35",
	            "Life Square",
	            "",
	            "Beijing","",
	            "G35, 1F Life Square, Building A1, North Area of Ruidu Garden, Jiukeshu Street, Tongzhou District, Beijing",
	            "39.889867","116.656201",
	            R.drawable.shop_1),
	    new Shop(3,
	            "零售",
	            "北京富力城广场",
	            "",
	            "北京","",
	            "北京市朝阳区东三环中路富力广场南区二层207号商铺",
	            "Viva Plaza",
	            "",
	            "Beijing","",
	            "No.207. 2F South Area of Viva Plaza, East 3rd-Ring Road, Chaoyang District, Beijing",
	            "39.896008","116.460743",
	            R.drawable.shop_1),
	    new Shop(4,
	            "零售",
	            "北京怀柔京北大世界",
	            "",
	            "北京","",
	            "北京市怀柔区府前街14号怀柔京北大世界二层",
	            "Huairou Jingbei",
	            "",
	            "Beijing","",
	            "2F Huairou Jingbei Shopping Mall, No.14 Fuqian Street, Huairou District, Beijing",
	            "40.33732","116.633949",
	            R.drawable.shop_1),
	    new Shop(5,
	            "零售",
	            "北京朝阳大悦城",
	            "",
	            "北京","",
	            "北京市朝阳区朝阳北路大悦城4F-25 theCarnaby专柜",
	            "Beijing Chaoyang Joycity",
	            "",
	            "Beijing","",
	            "4F Chaoyang Joy city, No.101 North Chaoyang Road, Chaoyang District, Beijing",
	            "39.924811","116.518335",
	            R.drawable.shop_1),
	    new Shop(6,
	            "零售",
	            "北京8号购物广场",
	            "",
	            "北京","",
	            "北京市海淀区学清路甲8号圣熙8号购物中心三层",
	            "No. 8 Plaza",
	            "",
	            "Beijing","",
	            "3F No.8 Plaza， No.A-8 Xueqing Road, Haidian District, Beijing",
	            "40.016178","116.353648",
	            R.drawable.shop_1),
	    new Shop(7,
	            "零售",
	            "北京东方银座",
	            "",
	            "北京","",
	            "北京市东城区东直门外大街48号银座商场L1层14&15号铺位",
	            "Oriental Kenzo Plaza",
	            "",
	            "Beijing","",
	            "Shop 14-15, Level 1 , Oriental Kenzo Plaza , 48 Dongzhimenwai Street, Dongcheng District, Beijing, China.",
	            "39.943436","116.435509",
	            R.drawable.shop_1),
	    new Shop(8,
	            "零售",
	            "福州大洋一店",
	            "",
	            "福建","",
	            "福州市鼓楼区八一七北路133号大洋百货三楼",
	            "Grand Ocean I",
	            "",
	            "Fujian","",
	            "3F Grand Ocean, No.133 North Bayiqi Road,Gulou District, Fuzhou",
	            "26.084365","119.300022",
	            R.drawable.shop_1),
	    new Shop(9,
	            "零售",
	            "福州大洋三店",
	            "",
	            "福建","",
	            "福建省福州市鼓楼区五一中路18号大洋三店二楼嘉耐芘专柜",
	            "Grand Ocean III",
	            "",
	            "Fujian","",
	            "2F Grand Ocean, No.18 Middle of Wuyi Road,Gulou District, Fuzhou",
	            "26.076482","119.31073",
	            R.drawable.shop_1),
	    new Shop(10,
	            "零售",
	            "杭州大厦",
	            "",
	            "浙江","",
	            "杭州市下城区武林路一号杭州大厦A座5楼the Carnaby专柜",
	            "Hangzhou Tower",
	            "",
	            "Zhejiang","",
	            "5F Building A Hangzhou Tower, No.1 Wulin Road,xiacheng District Hangzhou",
	            "30.27306","120.161526",
	            R.drawable.shop_1),
	    new Shop(11,
	            "零售",
	            "苏州久光",
	            "",
	            "江苏","",
	            "苏州市工业园区旺墩路268号苏州久光百货三楼the Carnaby专柜 ",
	            "Suzhou Jiu-Guang",
	            "",
	            "Jiangsu","",
	            "3F, Suzhou Jiu-Guang Department Store, Suzhou Industrial Park,268 Wang Dun Road, Suzhou ",
	            "31.32578","120.71537",
	            R.drawable.shop_1),
	    new Shop(12,
	            "零售",
	            "上海日月光JUMBO",
	            "",
	            "上海","",
	            "上海市徐汇区徐家汇路618号日月光商场1楼thecarnaby专柜",
	            "SM Center",
	            "",
	            "Shanghai","",
	            "1F,SM Center,No.618 Xujiahui Road,Xuhui District, Shanghai",
	            "31.210159","121.468449",
	            R.drawable.shop_1),
	    new Shop(13,
	            "零售",
	            "上海九六",
	            "",
	            "上海","",
	            "上海市浦东新区东方路796号九六广场129室",
	            "96 Plaza",
	            "",
	            "Shanghai","",
	            "Room 129, 96 Plaza, No.796 Dongfang Road, Pudong New District, Shanghai",
	            "31.228032","121.525097",
	            R.drawable.shop_1),
	    new Shop(14,
	            "零售",
	            "上海港汇",
	            "",
	            "上海","",
	            "上海市徐汇区虹桥路1号3楼338Bthecarnaby专柜",
	            "Shanghai Grand Gateway Plaza",
	            "",
	            "Shanghai","",
	            "338B, 3F Grand Gateway Plaza, No.1 Hongqiao Road, Xuhui District, Shanghai",
	            "31.197385","121.437378",
	            R.drawable.shop_1),
	    new Shop(15,
	            "零售",
	            "上海大宁国际",
	            "",
	            "上海","",
	            "上海市闸北区共和新路1988号204 205 206单元",
	            "Daning International Commercial",
	            "",
	            "Shanghai","",
	            "204-206,Block 10,No 1988, GongHeXin Road,zhabei District,shanghai",
	            "31.281485","121.454201",
	            R.drawable.shop_1),
	};

	private ExpandableShopsAdapter esa;
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        setContentView(R.layout.shops);
        
        setupTitle(R.string.title_shops);
        
        ExpandableListView shops_elv = (ExpandableListView) findViewById(R.id.shops_lt);
        esa = new ExpandableShopsAdapter(this);
        shops_elv.setAdapter(esa);
        
        shops_elv.setOnChildClickListener(new OnChildClickListener(){

			public boolean onChildClick(ExpandableListView parent, View v,
					int groupPosition, int childPosition, long id) {
					
					Intent act = new Intent(Shops.this, ShopDetail.class);
					int shop_id = Integer.parseInt(v.getTag().toString());
					act.putExtra("shop_id", shop_id);
					startActivity(act);
					
					Log.i(TAG, "shop_id: " + shop_id);
					
					return true;
			}
        	
        });
    }
    
    public static Shop find(int id){
    	int l = shops.length;
    	for (int i = 0; i < l; i++) 
			if (shops[i].id == id) 
				return shops[i];
    	
    	return null;
    }
    
    public class ExpandableShopsAdapter extends BaseExpandableListAdapter {
    	// Sample data set.  children[i] contains the children (String[]) for groups[i].
    	private String[] groups = {"北京","上海","福建","浙江","江苏","重庆"};
    	private String[] groups_en = {"Beijing", "Shanghai", "Liaoning", "Fujian", "Zhejiang", "Jiangsu", "Heilongjiang", "Shandong", "Chonqin"};
    	
    	private Context mContext;
    	
        private ArrayList <ArrayList <Shop>> children = new ArrayList <ArrayList <Shop>>();
        
        public ExpandableShopsAdapter(Context context){
        	this.mContext = context;
        	
        	int l = groups.length;
        	int m = shops.length;
        	for (int i = 0; i < l; i++) {
        		String province = groups[i];
        		children.add(new ArrayList<Shop>());
        		for(int j = 0; j < m; j++) {
        			if (province == shops[j].province)
        				children.get(i).add(shops[j]);
        		}
			}
        }
        
        
        public Object getChild(int groupPosition, int childPosition) {
        	return children.get(groupPosition).get(childPosition);
        }

        public long getChildId(int groupPosition, int childPosition) {
            return ((Shop) getChild(groupPosition, childPosition)).id;
        }

        public int getChildrenCount(int groupPosition) {
//            return children[groupPosition].length;
        	return children.get(groupPosition).size();
        }

        public TextView getGenericView(ViewGroup parent) {
            // Layout parameters for the ExpandableListView
//            AbsListView.LayoutParams lp = new AbsListView.LayoutParams(
//                    ViewGroup.LayoutParams.FILL_PARENT, viewHeight);

//            TextView textView = new TextView(Shops.this);
            TextView textView = (TextView) LayoutInflater.from(getApplicationContext()).inflate(R.layout.shops_list_item, parent, false);
//            textView.setLayoutParams(lp);
            // Center the text vertically
//            textView.setGravity(Gravity.CENTER_VERTICAL | Gravity.LEFT);
            // Set the text starting position
//            textView.setPadding(36dp, 0, 0, 0);
            return textView;
        }
        
        public View getChildView(int groupPosition, int childPosition, boolean isLastChild,
                View convertView, ViewGroup parent) {
        	if (convertView == null){
        		convertView = getGenericView(parent);
        	}

            Shop child = (Shop) getChild(groupPosition, childPosition);
            ((TextView) convertView).setText(FieldHelper.getLocalFieldValue(mContext, Shop.class, "name", child));
            ((TextView) convertView).setTag(child.id);
            return convertView;
        }

        public Object getGroup(int groupPosition) {
        	if (mContext.getResources().getConfiguration().locale.getLanguage().equals(Locale.CHINESE.toString())) {
                return groups[groupPosition];
        	} else {
        		return groups_en[groupPosition];
        	}
        }

        public int getGroupCount() {
            return groups.length;
        }

        public long getGroupId(int groupPosition) {
            return groupPosition;
        }

        public View getGroupView(int groupPosition, boolean isExpanded, View convertView,
                ViewGroup parent) {
        	if (convertView == null){
        		convertView = getGenericView(parent);
        	}

            ((TextView) convertView).setText(getGroup(groupPosition).toString() + " ("+esa.getChildrenCount(groupPosition)+")");
            return convertView;
        }

        public boolean isChildSelectable(int groupPosition, int childPosition) {
            return true;
        }

        public boolean hasStableIds() {
            return true;
        }
    }
}
