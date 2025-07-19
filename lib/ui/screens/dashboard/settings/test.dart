import 'dart:async';
import 'dart:io';

import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  EdScreenRecorder? screenRecorder;
  RecordOutput? _response;
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    screenRecorder = EdScreenRecorder();
  }

  Future<void> startRecord({
    required String fileName,
    required int width,
    required int height,
  }) async {
    // ✅ Request microphone permission
    var micStatus = await Permission.microphone.status;
    if (!micStatus.isGranted) {
      micStatus = await Permission.microphone.request();
      if (!micStatus.isGranted) {
        debugPrint("Microphone permission not granted");
        return;
      }
    }

    // ✅ Request storage permission (optional but recommended)
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      storageStatus = await Permission.storage.request();
      if (!storageStatus.isGranted) {
        debugPrint("Storage permission not granted");
        return;
      }
    }

    Directory? tempDir = await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;

    try {
      var startResponse = await screenRecorder?.startRecordScreen(
        fileName: fileName,
        dirPathToSave: tempPath,
        audioEnable: true,
        width: width,
        height: height,
      );
      setState(() {
        _response = startResponse;
      });
    } on PlatformException {
      debugPrint("Error: An error occurred while starting the recording!");
    }
  }

  Future<void> stopRecord() async {
    try {
      var stopResponse = await screenRecorder?.stopRecord();
      setState(() {
        _response = stopResponse;
      });
    } on PlatformException {
      debugPrint("Error: An error occurred while stopping recording.");
    }
  }

  Future<void> pauseRecord() async {
    try {
      await screenRecorder?.pauseRecord();
    } on PlatformException {
      debugPrint("Error: An error occurred while pausing recording.");
    }
  }

  Future<void> resumeRecord() async {
    try {
      await screenRecorder?.resumeRecord();
    } on PlatformException {
      debugPrint("Error: An error occurred while resuming recording.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.toInt();
    final screenHeight = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      appBar: AppBar(title: const Text("Screen Recording Debug")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("File: ${_response?.file.path ?? '-'}"),
              Text("Status: ${_response?.success ?? '-'}"),
              Text("Event: ${_response?.eventName ?? '-'}"),
              Text("Progress: ${_response?.isProgress ?? '-'}"),
              Text("Message: ${_response?.message ?? '-'}"),
              Text("Video Hash: ${_response?.videoHash ?? '-'}"),
              Text("Start Date: ${_response?.startDate ?? '-'}"),
              Text("End Date: ${_response?.endDate ?? '-'}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    () => startRecord(
                      fileName: "eren",
                      width: screenWidth,
                      height: screenHeight,
                    ),
                child: const Text('START RECORD'),
              ),
              ElevatedButton(
                onPressed: resumeRecord,
                child: const Text('RESUME RECORD'),
              ),
              ElevatedButton(
                onPressed: pauseRecord,
                child: const Text('PAUSE RECORD'),
              ),
              ElevatedButton(
                onPressed: stopRecord,
                child: const Text('STOP RECORD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
