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
	            "����",
	            "�����йش���ֻ��",
	            "",
	            "����","",
	            "�����к������йش���15���йش幺������D�����ֻ���¶���",
	            "Beijing Zhongguancun La Vita",
	            "",
	            "Beijing","",
	            "B2 La Vita, D Area Zhonguancun Shopping Center, No.15 Zhongguancun Street, Haidian District, Beijing",
	            "39.97987","116.316429",
	            R.drawable.shop_1),
	    new Shop(2,
	            "����",
	            "����ͨ����������㳡",
	            "",
	            "����","",
	            "������ͨ�����ſ����𶼾�԰����A1��¥����������㳡һ��G35",
	            "Life Square",
	            "",
	            "Beijing","",
	            "G35, 1F Life Square, Building A1, North Area of Ruidu Garden, Jiukeshu Street, Tongzhou District, Beijing",
	            "39.889867","116.656201",
	            R.drawable.shop_1),
	    new Shop(3,
	            "����",
	            "���������ǹ㳡",
	            "",
	            "����","",
	            "�����г�������������·�����㳡��������207������",
	            "Viva Plaza",
	            "",
	            "Beijing","",
	            "No.207. 2F South Area of Viva Plaza, East 3rd-Ring Road, Chaoyang District, Beijing",
	            "39.896008","116.460743",
	            R.drawable.shop_1),
	    new Shop(4,
	            "����",
	            "�������ᾩ��������",
	            "",
	            "����","",
	            "�����л�������ǰ��14�Ż��ᾩ�����������",
	            "Huairou Jingbei",
	            "",
	            "Beijing","",
	            "2F Huairou Jingbei Shopping Mall, No.14 Fuqian Street, Huairou District, Beijing",
	            "40.33732","116.633949",
	            R.drawable.shop_1),
	    new Shop(5,
	            "����",
	            "�����������ó�",
	            "",
	            "����","",
	            "�����г�����������·���ó�4F-25 theCarnabyר��",
	            "Beijing Chaoyang Joycity",
	            "",
	            "Beijing","",
	            "4F Chaoyang Joy city, No.101 North Chaoyang Road, Chaoyang District, Beijing",
	            "39.924811","116.518335",
	            R.drawable.shop_1),
	    new Shop(6,
	            "����",
	            "����8�Ź���㳡",
	            "",
	            "����","",
	            "�����к�����ѧ��·��8��ʥ��8�Ź�����������",
	            "No. 8 Plaza",
	            "",
	            "Beijing","",
	            "3F No.8 Plaza�� No.A-8 Xueqing Road, Haidian District, Beijing",
	            "40.016178","116.353648",
	            R.drawable.shop_1),
	    new Shop(7,
	            "����",
	            "������������",
	            "",
	            "����","",
	            "�����ж�������ֱ������48�������̳�L1��14&15����λ",
	            "Oriental Kenzo Plaza",
	            "",
	            "Beijing","",
	            "Shop 14-15, Level 1 , Oriental Kenzo Plaza , 48 Dongzhimenwai Street, Dongcheng District, Beijing, China.",
	            "39.943436","116.435509",
	            R.drawable.shop_1),
	    new Shop(8,
	            "����",
	            "���ݴ���һ��",
	            "",
	            "����","",
	            "�����й�¥����һ�߱�·133�Ŵ���ٻ���¥",
	            "Grand Ocean I",
	            "",
	            "Fujian","",
	            "3F Grand Ocean, No.133 North Bayiqi Road,Gulou District, Fuzhou",
	            "26.084365","119.300022",
	            R.drawable.shop_1),
	    new Shop(9,
	            "����",
	            "���ݴ�������",
	            "",
	            "����","",
	            "����ʡ�����й�¥����һ��·18�Ŵ��������¥������ר��",
	            "Grand Ocean III",
	            "",
	            "Fujian","",
	            "2F Grand Ocean, No.18 Middle of Wuyi Road,Gulou District, Fuzhou",
	            "26.076482","119.31073",
	            R.drawable.shop_1),
	    new Shop(10,
	            "����",
	            "���ݴ���",
	            "",
	            "�㽭","",
	            "�������³�������·һ�ź��ݴ���A��5¥the Carnabyר��",
	            "Hangzhou Tower",
	            "",
	            "Zhejiang","",
	            "5F Building A Hangzhou Tower, No.1 Wulin Road,xiacheng District Hangzhou",
	            "30.27306","120.161526",
	            R.drawable.shop_1),
	    new Shop(11,
	            "����",
	            "���ݾù�",
	            "",
	            "����","",
	            "�����й�ҵ԰������·268�����ݾù�ٻ���¥the Carnabyר�� ",
	            "Suzhou Jiu-Guang",
	            "",
	            "Jiangsu","",
	            "3F, Suzhou Jiu-Guang Department Store, Suzhou Industrial Park,268 Wang Dun Road, Suzhou ",
	            "31.32578","120.71537",
	            R.drawable.shop_1),
	    new Shop(12,
	            "����",
	            "�Ϻ����¹�JUMBO",
	            "",
	            "�Ϻ�","",
	            "�Ϻ����������һ�·618�����¹��̳�1¥thecarnabyר��",
	            "SM Center",
	            "",
	            "Shanghai","",
	            "1F,SM Center,No.618 Xujiahui Road,Xuhui District, Shanghai",
	            "31.210159","121.468449",
	            R.drawable.shop_1),
	    new Shop(13,
	            "����",
	            "�Ϻ�����",
	            "",
	            "�Ϻ�","",
	            "�Ϻ����ֶ���������·796�ž����㳡129��",
	            "96 Plaza",
	            "",
	            "Shanghai","",
	            "Room 129, 96 Plaza, No.796 Dongfang Road, Pudong New District, Shanghai",
	            "31.228032","121.525097",
	            R.drawable.shop_1),
	    new Shop(14,
	            "����",
	            "�Ϻ��ۻ�",
	            "",
	            "�Ϻ�","",
	            "�Ϻ������������·1��3¥338Bthecarnabyר��",
	            "Shanghai Grand Gateway Plaza",
	            "",
	            "Shanghai","",
	            "338B, 3F Grand Gateway Plaza, No.1 Hongqiao Road, Xuhui District, Shanghai",
	            "31.197385","121.437378",
	            R.drawable.shop_1),
	    new Shop(15,
	            "����",
	            "�Ϻ���������",
	            "",
	            "�Ϻ�","",
	            "�Ϻ���բ����������·1988��204 205 206��Ԫ",
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
    	private String[] groups = {"����","�Ϻ�","����","�㽭","����","����"};
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
