import 'dart:io';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneCallService {
  FlutterSoundRecorder? _recorder;

  PhoneCallService(FlutterSoundRecorder? recorder) {
    _recorder = recorder;
  }

  Future<void> requestPermissions() async {
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.phone.request();
  }

  Future<void> _startRecording() async {
    Directory? externalDir = await getExternalStorageDirectory();
    String recordingPath = '${externalDir?.path}/call_recording.aac';
    /*final directory = await getApplicationDocumentsDirectory();
    _recordingPath = '${directory.path}/call_recording.aac';*/

    await _recorder?.openRecorder();
    await _recorder?.startRecorder(
      toFile: recordingPath,
      codec: Codec.aacADTS,
    );
  }

  Future<void> stopRecording() async {
    await _recorder?.stopRecorder();
    await _recorder?.closeRecorder();
  }

  Future<void> makeCall(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    if (res != null && res) {
      _startRecording();
    }
  }
}
