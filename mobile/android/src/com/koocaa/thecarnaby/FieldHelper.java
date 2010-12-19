package com.koocaa.thecarnaby;

import java.util.Locale;

import android.content.Context;

public class FieldHelper {
	public static String getLocalFieldValue(Context context, Class<?> klass, String field_name, Object obj){
		String lang = context.getResources().getConfiguration().locale.getLanguage();
        String field = lang.equals(Locale.CHINESE.toString()) ? field_name : field_name+"_en";
        String data = "";
        try {
			data = (String) klass.getField(field).get(obj);
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return data;
	}
}
