/**
 * 
 */
package com.koocaa.thecarnaby;

import java.io.IOException;

import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.WindowManager;

/**
 * @author AChien
 *
 */
public class Videos extends Nav {
	final String TAG = "Videos";
	private SurfaceView mPreview;
	private SurfaceHolder holder;
	private MediaPlayer mp;
	
	private int ResId = R.raw.demo;
	
	/** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

//        requestWindowFeature(Window.FEATURE_CUSTOM_TITLE);
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, 
                WindowManager.LayoutParams.FLAG_FULLSCREEN );

        setContentView(R.layout.videos);
        
//        setupTitle(R.string.title_videos); 
        
        mPreview = (SurfaceView) findViewById(R.id.surface);
        holder = mPreview.getHolder();
        holder.addCallback(new SurfaceHolder.Callback(){
        	public void surfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k) {
                Log.d(TAG, "surfaceChanged called");
            }

            public void surfaceDestroyed(SurfaceHolder surfaceholder) {
                Log.d(TAG, "surfaceDestroyed called");
            }

            public void surfaceCreated(SurfaceHolder holder) {
                Log.d(TAG, "surfaceCreated called");
                playVideo();
            }
        });
        holder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
        
        
	    
//        VideoView vid = (VideoView) findViewById(R.id.video_view);
//        vid.setVideoURI(Uri.parse("android.resource://com.koocaa.theCarnaby/raw/demo.mp4"));
//        vid.setMediaController(new MediaController(this));
//        vid.requestFocus();
    }
    
    private void playVideo(){
    	AssetFileDescriptor afd = getResources().openRawResourceFd(this.ResId);
        mp = new MediaPlayer();
        try {
        	mp.setOnCompletionListener(new OnCompletionListener(){
        		public void onCompletion(MediaPlayer m){
        			Log.i(TAG, "Video.onCompletion");
        			finish();
        		}
        	});
			mp.setDataSource(afd.getFileDescriptor(),afd.getStartOffset(),afd.getDeclaredLength());
			mp.setDisplay(holder);
			mp.prepare();
		    mp.start();
	        afd.close();
		} catch (IllegalArgumentException e){
	        Log.e(TAG, "Unable to play audio queue do to exception: " + e.getMessage(), e);
	    } catch (IllegalStateException e){
	        Log.e(TAG, "Unable to play audio queue do to exception: " + e.getMessage(), e);
	    }catch (IOException e){
	        Log.e(TAG, "Unable to play audio queue do to exception: " + e.getMessage(), e);
	    }
    }
    
    @Override
    protected void onPause() {
        super.onPause();
        releaseMediaPlayer();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        releaseMediaPlayer();
        finish();
    }

    private void releaseMediaPlayer() {
        if (mp != null) {
        	mp.release();
        	mp = null;
        }
    }
}
