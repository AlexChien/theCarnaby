package com.koocaa.thecarnaby;

import android.app.Activity;
import android.os.Bundle;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class WebNews extends Nav {

	public void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        
        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
//        getWindow().requestFeature(Window.FEATURE_PROGRESS);

        setContentView(R.layout.news);
        setupTitle(R.string.title_news);
        
//        WebView webview = new WebView(this);
//        setContentView(webview);

        WebView webview = (WebView) findViewById(R.id.wv_news);
        final Activity activity = this;
        webview.setWebChromeClient(new WebChromeClient() {
          public void onProgressChanged(WebView view, int progress) {
            // Activities and WebViews measure progress with different scales.
            // The progress meter will automatically disappear when we reach 100%
            activity.setProgress(progress * 1000);
          }
        });
        webview.setWebViewClient(new WebViewClient() {
          public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            Toast.makeText(activity, R.string.label_connection_error, Toast.LENGTH_LONG).show();
          }
        });
        
        webview.loadUrl("http://thecarnaby.koocaa.com/published_news.iphone?lang="+lang);
	}
}
