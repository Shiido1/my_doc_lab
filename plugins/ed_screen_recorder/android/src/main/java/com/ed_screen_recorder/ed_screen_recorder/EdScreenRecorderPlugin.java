package com.ed_screen_recorder.ed_screen_recorder;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.media.projection.MediaProjectionManager;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.hbisoft.hbrecorder.HBRecorder;
import com.hbisoft.hbrecorder.HBRecorderCodecInfo;
import com.hbisoft.hbrecorder.HBRecorderListener;

import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

public class EdScreenRecorderPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler,
        HBRecorderListener, PluginRegistry.ActivityResultListener, PluginRegistry.RequestPermissionsResultListener {

    private FlutterPluginBinding flutterPluginBinding;
    private ActivityPluginBinding activityPluginBinding;
    private Activity activity;
    private HBRecorder hbRecorder;

    private static final int SCREEN_RECORD_REQUEST_CODE = 777;
    private static final int PERMISSION_AUDIO_REQUEST_CODE = 333;
    private static final int PERMISSION_STORAGE_REQUEST_CODE = 444;

    private Result startRecordingResult;
    private Result stopRecordingResult;
    private Result pauseRecordingResult;
    private Result resumeRecordingResult;

    private boolean micPermission = false;
    private boolean mediaPermission = false;

    private boolean isAudioEnabled;
    private String fileName;
    private String dirPathToSave;
    private boolean addTimeCode;
    private String filePath;
    private int videoFrame;
    private int videoBitrate;
    private String fileOutputFormat;
    private String fileExtension;
    private String videoHash;
    private long startDate;
    private long endDate;
    private int width;
    private int height;

    private boolean success;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        this.flutterPluginBinding = binding;
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        this.flutterPluginBinding = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activityPluginBinding = binding;
        this.activity = binding.getActivity();
        hbRecorder = new HBRecorder(flutterPluginBinding.getApplicationContext(), this);
        binding.addActivityResultListener(this);
        binding.addRequestPermissionsResultListener(this);

        BinaryMessenger messenger = flutterPluginBinding.getBinaryMessenger();
        MethodChannel channel = new MethodChannel(messenger, "ed_screen_recorder");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() { }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        onAttachedToActivity(binding);
    }

    @Override
    public void onDetachedFromActivity() { }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "startRecordScreen":
                handleStart(call, result);
                break;
            case "stopRecordScreen":
                handleStop(call, result);
                break;
            case "pauseRecordScreen":
                pauseRecordingResult = result;
                hbRecorder.pauseScreenRecording();
                break;
            case "resumeRecordScreen":
                resumeRecordingResult = result;
                hbRecorder.resumeScreenRecording();
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void handleStart(MethodCall call, Result result) {
        startRecordingResult = result;
        isAudioEnabled = Boolean.TRUE.equals(call.argument("audioenable"));
        fileName = call.argument("filename");
        dirPathToSave = call.argument("dirpathtosave");
        addTimeCode = Boolean.TRUE.equals(call.argument("addtimecode"));
        videoFrame = call.argument("videoframe") != null ? call.argument("videoframe") : 30;
        videoBitrate = call.argument("videobitrate") != null ? call.argument("videobitrate") : 4500000;
        fileOutputFormat = call.argument("fileoutputformat") != null ? call.argument("fileoutputformat") : "DEFAULT";
        fileExtension = call.argument("fileextension") != null ? call.argument("fileextension") : "mp4";
        videoHash = call.argument("videohash");
        startDate = call.argument("startdate") != null ? call.argument("startdate") : System.currentTimeMillis();
        width = call.argument("width") != null ? call.argument("width") : 720;
        height = call.argument("height") != null ? call.argument("height") : 1280;

        customSettings();
        try {
            if (dirPathToSave != null) {
                setOutputPath();
            }

            checkPermissionsAndStart();
        } catch (Exception e) {
            reportErrorToDart("startRecordScreen", e.getMessage());
        }
    }

    private void handleStop(MethodCall call, Result result) {
        stopRecordingResult = result;
        endDate = call.argument("enddate") != null ? call.argument("enddate") : System.currentTimeMillis();
        hbRecorder.stopScreenRecording();
    }

    private void checkPermissionsAndStart() {
        micPermission = !isAudioEnabled || ContextCompat.checkSelfPermission(activity, Manifest.permission.RECORD_AUDIO) == PackageManager.PERMISSION_GRANTED;
        mediaPermission = ContextCompat.checkSelfPermission(activity, Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;

        if (!micPermission) {
            ActivityCompat.requestPermissions(activity, new String[]{Manifest.permission.RECORD_AUDIO}, PERMISSION_AUDIO_REQUEST_CODE);
        }

        if (!mediaPermission) {
            ActivityCompat.requestPermissions(activity, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, PERMISSION_STORAGE_REQUEST_CODE);
        }

        if (micPermission && mediaPermission) {
            success = startRecordingScreen();
        }
    }

    private boolean startRecordingScreen() {
        try {
            hbRecorder.enableCustomSettings();
            MediaProjectionManager mediaProjectionManager = (MediaProjectionManager) activity.getSystemService(Context.MEDIA_PROJECTION_SERVICE);
            Intent permissionIntent = mediaProjectionManager.createScreenCaptureIntent();
            activity.startActivityForResult(permissionIntent, SCREEN_RECORD_REQUEST_CODE);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private void customSettings() {
        hbRecorder.isAudioEnabled(isAudioEnabled);
        hbRecorder.setAudioSource("DEFAULT");
        hbRecorder.setVideoEncoder("DEFAULT");
        hbRecorder.setVideoFrameRate(videoFrame);
        hbRecorder.setVideoBitrate(videoBitrate);
        hbRecorder.setOutputFormat(fileOutputFormat);
        if (width > 0 && height > 0) {
            hbRecorder.setScreenDimensions(height, width);
        }
        if (dirPathToSave == null) {
            hbRecorder.setFileName(generateFileName());
        }
    }

    private void setOutputPath() throws IOException {
        hbRecorder.setFileName(generateFileName());
        File dirFile = new File(dirPathToSave);
        hbRecorder.setOutputPath(dirFile.getAbsolutePath());
        filePath = dirFile.getAbsolutePath() + "/" + generateFileName();
    }

    private String generateFileName() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss", Locale.getDefault());
        String timeCode = addTimeCode ? "-" + formatter.format(new Date()) : "";
        return fileName + timeCode;
    }

    private void reportErrorToDart(String eventName, String message) {
        Map<Object, Object> dataMap = new HashMap<>();
        dataMap.put("success", false);
        dataMap.put("isProgress", false);
        dataMap.put("file", "");
        dataMap.put("eventname", eventName);
        dataMap.put("message", message);
        JSONObject jsonObj = new JSONObject(dataMap);
        if (startRecordingResult != null) {
            startRecordingResult.success(jsonObj.toString());
            startRecordingResult = null;
        }
    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == SCREEN_RECORD_REQUEST_CODE && resultCode == Activity.RESULT_OK) {
            hbRecorder.startScreenRecording(data, resultCode);
        }
        return true;
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        if (requestCode == PERMISSION_AUDIO_REQUEST_CODE && grantResults.length > 0) {
            micPermission = grantResults[0] == PackageManager.PERMISSION_GRANTED;
        } else if (requestCode == PERMISSION_STORAGE_REQUEST_CODE && grantResults.length > 0) {
            mediaPermission = grantResults[0] == PackageManager.PERMISSION_GRANTED;
        }

        if (micPermission && mediaPermission) {
            success = startRecordingScreen();
        }
        return true;
    }

    @Override
    public void HBRecorderOnStart() {
        Map<Object, Object> dataMap = new HashMap<>();
        dataMap.put("success", true);
        dataMap.put("isProgress", true);
        dataMap.put("file", dirPathToSave != null ? filePath + "." + fileExtension : generateFileName() + "." + fileExtension);
        dataMap.put("eventname", "startRecordScreen");
        dataMap.put("message", "Recording started");
        dataMap.put("videohash", videoHash);
        dataMap.put("startdate", startDate);
        JSONObject jsonObj = new JSONObject(dataMap);
        if (startRecordingResult != null) {
            startRecordingResult.success(jsonObj.toString());
            startRecordingResult = null;
        }
    }

    @Override
    public void HBRecorderOnComplete() {
        Map<Object, Object> dataMap = new HashMap<>();
        dataMap.put("success", true);
        dataMap.put("isProgress", false);
        dataMap.put("file", dirPathToSave != null ? filePath + "." + fileExtension : generateFileName() + "." + fileExtension);
        dataMap.put("eventname", "stopRecordScreen");
        dataMap.put("message", "Recording complete");
        dataMap.put("videohash", videoHash);
        dataMap.put("startdate", startDate);
        dataMap.put("enddate", endDate);
        JSONObject jsonObj = new JSONObject(dataMap);
        if (stopRecordingResult != null) {
            stopRecordingResult.success(jsonObj.toString());
            stopRecordingResult = null;
        }
    }

    @Override
    public void HBRecorderOnError(int errorCode, String reason) {
        if (startRecordingResult != null) {
            startRecordingResult.error("Error", reason, null);
            startRecordingResult = null;
        }
    }

    @Override
    public void HBRecorderOnPause() {
        if (pauseRecordingResult != null) {
            pauseRecordingResult.success(true);
            pauseRecordingResult = null;
        }
    }

    @Override
    public void HBRecorderOnResume() {
        if (resumeRecordingResult != null) {
            resumeRecordingResult.success(true);
            resumeRecordingResult = null;
        }
    }
}
