/**
 * 
 */
package com.koocaa.thecarnaby;

import java.util.ArrayList;

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
			new Shop(1,"零售", "北京中关村津乐汇","","北京","海淀","北京市海淀区中关村大街15号中关村购物中心D区津乐汇地下二层","Beijing Zhongguancun La Vita","","B2 La Vita, D Area Zhonguancun Shopping Center, No.15 Zhongguancun Street, Haidian District, Beijing","Beijing","Haidian","39.97987","116.316429"),
			new Shop(2,"零售","北京新阳光生活广场","","北京","通州","北京市通州区九棵树瑞都景园北区A1号楼新阳光生活广场一层G35 ","Life Square","","G35, 1F Life Square, Building A1, North Area of Ruidu Garden, Jiukeshu Street, Tongzhou District, Beijing","Beijing","Tongzhou","39.889867","116.656201"),
			new Shop(3,"零售","富力城广场","","北京","朝阳","北京市朝阳区东三环中路富力广场南区二层207号商铺","Viva Plaza","","No.207. 2F South Area of Viva Plaza, East 3rd-Ring Road, Chaoyang District, Beijing","Beijing","Chaoyang","39.896008","116.460743"),
			new Shop(4,"零售","怀柔京北大世界","","北京","怀柔","北京市怀柔区府前街14号怀柔京北大世界二层","Huairou Jingbei","","2F Huairou Jingbei Shopping Mall, No.14 Fuqian Street, Huairou District, Beijing","Beijing","Huairou","40.33732","116.633949"),
			new Shop(5,"零售","北京朝阳大悦城","","北京","朝阳","北京市朝阳区朝阳北路101号朝阳大悦城四层","Beijing Chaoyang Joycity","","4F Chaoyang Joycity, No.101 North Chaoyang Road, Chaoyang District, Beijing","Beijing","Chaoyang","39.924811","116.518335"),
			new Shop(6,"零售","8号广场","","北京","海淀","北京市海淀区学清路甲8号三楼the Carnaby专柜","No. 8 Plaza","","3F No.8 Plaza， No.A-8 Xueqing Road, Haidian District, Beijing","Beijing","Haidian","40.016178","116.353648"),
			new Shop(7,"零售","鞍山新世界","","辽宁","鞍山","辽宁省鞍山市铁东区五一路38号新世界商场四楼","Anshan New World","","4F New World Department Store, No.38 Wuyi Road, Tiedong district, Anshan City, Liaoning Province","Liaoning","Anshan","41.113827","122.993488"),
			new Shop(8,"零售","鞍山新玛特（市府店）","","辽宁","鞍山","辽宁省鞍山市胜利南路42号新玛特二楼 the Carnaby专柜","Anshan New Mart (Shifu Store)","","2F New Mart, No.42 South Shengli Road, Anshan City, Liaoning Province","Liaoning","Anshan","41.108314","122.994862"),
			new Shop(9,"零售","福州大洋一店","","福建","福州","福州市八一七北路133号大洋百货三层","Grand Ocean I","","3F Grand Ocean, No.133 North Bayiqi Road, Fuzhou","Fu Jian","Fu Zhou","26.084365","119.300022"),
			new Shop(10,"零售","福州大洋三店","","福建","福州","福州市五一中路18号大洋三店二层","Grand Ocean III","","2F Grand Ocean, No.18 Middle of Wuyi Road, Fuzhou","Fu Jian","Fu Zhou","26.076482","119.31073"),
			new Shop(11,"零售","久光百货","","上海","黄浦","上海市南京西路1618号","Shanghai Jiu-Guang","","YES Fashion Area, 4F Jiu-Guang Department Store, No.1618 West Nanjing Road, Shanghai","Shanghai","Huangpu","31.223793","121.445875"),
			new Shop(12,"零售","96广场","","上海","黄浦","上海市浦东新区东方路796号129室","96 Plaza","","Room 129, 96 Plaza, No.796 Dongfang Road, Pudong New District, Shanghai","Shanghai","Huangpu","31.228032","121.525097"),
			new Shop(13,"零售","上海港汇广场","","上海","徐汇","上海市徐汇区虹桥路1号3楼338B","Shanghai Grand Gateway Plaza","","338B, 3F Grand Gateway Plaza, No.1 Hongqiao Road, Xuhui District, Shanghai","Shanghai","Xuhui","31.197385","121.437378"),
			new Shop(14,"零售","日月光广场","","上海","徐汇","上海市徐家汇路618号上海日月光商场the Carnaby专柜","SM Center","","No.618 Xujiahui Road, Shanghai","Shanghai","Xuhui","31.210159","121.468449"),
			new Shop(15,"零售","杭州大厦","","浙江","杭州","杭州市武林路一号杭州大厦A座5楼","Hangzhou Tower","","5F Building A Hangzhou Tower, No.1 Wulin Road, Hangzhou","Zhejiang","Hangzhou","30.27306","120.161526"),
			new Shop(16,"零售","宁波酷购","","浙江","宁波","宁波市海曙区天一广场6号门酷购商城B馆一层","Ningbo GUGO","","1F B Area, GUGO Shopping Center, Door 6 Tianyi Square, Haishu District, Ningbo","Zhejiang","Ningbo","29.86908","121.552176"),
			new Shop(17,"零售","温州银泰","","浙江","温州","温州市解放南路荷花路口世贸中心银泰百货四楼the Carnaby专柜","Wenzhou Intime","","4F Intime Department Store, World Trade Center, Crossroad of Sound JIefang Road and Hehua Road, Wenzhou City","Zhejiang","Wenzhou","28.013801","120.665245"),
			new Shop(18,"零售","双鸭山赛丽斯商城","","黑龙江","双鸭山","黑龙江省双鸭山市尖山区新兴大街赛丽斯商城三楼","Shaungyashan","","3F Syssls Shopping Mall, Xinxing Street, Jianshan District, Shuangyashan City, Heilongjiang Province","Heilongjiang","Shuangyashan","46.638388","131.156931"),
			new Shop(19,"零售","潍坊圣荣中百","","山东","维纺","山东维纺市高新区福寿东街与新华路交叉口东北角圣荣中百大厦三层","Weifang Kof Tower","","3F Kof Tower, North-east side crossroad of Xinghua Road and East Fushou Street, Gaoxin District, Weifang City, Shandong Province","Shandong","Weifang","36.720964","119.148746"),
			new Shop(20,"零售","常熟华地百货","","江苏","常熟","江苏省常熟市方塔东街步行街9号楼(近海虞路)华地百货三楼","Changshu","","3F Spring Land Department Store, Building 9, East Fangta Walking Street, Changshu City, Jiangsu Province","Jiangsu","Changshu","31.644394","120.756826"),
			new Shop(21,"零售","苏州久光","","江苏","苏州","苏州市工业园区旺墩路268号（苏州久光百货）","Suzhou Jiu-Guang","","Jiu-Guang Department Store, No.268 Wangdun Road, Suzhou Industrial Park, Suzhou","Jiangsu","Suzhou","31.32578","120.71537"),
			new Shop(22,"零售","煌华国贸中心新纪元购物广场","","重庆","沙坪坝","重庆沙坪坝区三峡广场双巷子步行街6号一层the Carnaby专柜","Huanghua New Era","","1F Huanghua New Era, No.6 Shuangxiangzi Walking Street, Sanxia Square, Shapinba Disstrict, Chongqing City","Chongqin","Shapinba","29.55819","106.464515")
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
        esa = new ExpandableShopsAdapter();
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
    	private String[] groups = {"北京","上海","辽宁","福建","浙江","江苏","黑龙江","山东","重庆"};
    	
        private ArrayList <ArrayList <Shop>> children = new ArrayList <ArrayList <Shop>>();
        
        public ExpandableShopsAdapter(){
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
            ((TextView) convertView).setText(child.name);
            ((TextView) convertView).setTag(child.id);
            return convertView;
        }

        public Object getGroup(int groupPosition) {
            return groups[groupPosition];
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
