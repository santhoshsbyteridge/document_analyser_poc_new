import 'dart:async';
import 'dart:io';
import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
import 'package:document_analyser_poc_new/blocs/policy/policy_bloc.dart'
    as ranked_policy;
import 'package:document_analyser_poc_new/models/leads.dart';
import 'package:document_analyser_poc_new/screens/call_customers/widgets/generate_policies.dart';
import 'package:document_analyser_poc_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:just_audio/just_audio.dart';
import 'package:flutter_sound/flutter_sound.dart' as Recorder;

import '../../utils/app_network_constants.dart';

class CallCustomerPage extends StatefulWidget {
  final Leads lead;
  const CallCustomerPage({super.key, required this.lead});

  @override
  State<CallCustomerPage> createState() => _CallCustomerPageState();
}

class _CallCustomerPageState extends State<CallCustomerPage> {
  bool _isCalling = false;
  Timer? _callTimer;
  int _elapsedTime = 0;
  late TextEditingController _callSummaryController;

  bool isBtnEnabled = true;

  late IO.Socket socket;

  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription<PlayerState>? _playerStateSubscription;
  final Recorder.FlutterSoundRecorder _recorder =
      Recorder.FlutterSoundRecorder();
  StreamSubscription? _recordingSubscription;
  Timer? _timer;
  final String _outputPath =
      'assets/audio/audio_record.aac'; // File path for audio

  void _getRankedPolicies(String summary) {
    context
        .read<ranked_policy.PolicyBloc>()
        .add(ranked_policy.FetchRankedPolicies(summary: summary));
  }

  @override
  void initState() {
    super.initState();
    _callSummaryController = TextEditingController();

    socket = IO.io(AppNetworkConstants.BASE_URL, <String, dynamic>{
      'transports': ['websocket'], // Specify the transport method
      'autoConnect': false, // Disable auto connection
    });

    socket.on('summary_data', (data) {
      print('websocket listener data - $data');
    });

    // Connect to the socket
    socket.connect();

    _initializeAudioPlayer();
  }

  void _initializeAudioPlayer() async {
    // await _audioPlayer.setUrl('https://www.example.com/audio.mp3');

    // Listen to player state changes
    _playerStateSubscription =
        _audioPlayer.playerStateStream.listen((state) async {
      if (state.playing) {
        print('Audio is playing');
        _startRecordingAndConvertToBase64InChunks();
      } else {
        print('Audio is paused/stopped');
        _stopRecording();
      }
    });
  }

  Future<void> _playAudio() async {
    try {
      // Load and play the audio file
      await _audioPlayer
          .setAudioSource(AudioSource.asset('assets/audio/sample_audio.mp3'));
      _audioPlayer.play();
    } catch (e) {
      print('Error: $e');
    }
  }

  void _stopAudio() {
    _audioPlayer.stop();
  }

  void _startRecordingAndConvertToBase64InChunks() async {
    await _recorder.startRecorder(toFile: _outputPath);

    // Periodically read file in chunks and convert to base64
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      try {
        File audioFile = File(_outputPath);
        if (await audioFile.exists()) {
          final bytes = await audioFile.readAsBytes();
          String base64Data = base64Encode(bytes);
          print('Real-time audio data in base64: $base64Data');
        }
      } catch (e) {
        print('Error reading file: $e');
      }
    });
  }

  void _stopRecording() async {
    await _recorder.stopRecorder();
    _recordingSubscription?.cancel();
    print('Recording stopped');
  }

  void _getcallsummary() {
    context.read<CustomerPhoneCallBloc>().add(const GetCallSummary());
  }

  @override
  void dispose() {
    _callTimer?.cancel();
    _callSummaryController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _toggleCall() async {
    // try {
    //   print('websocket i am here');
    //   // Listen for the 'transcribe_audio' event
    Map<String, dynamic> dataToSend = {
      'audio_data':
          'test data, working....' // Replace 'audio_data' with whatever key you want
    };

    print('websocket data -- $dataToSend');

    socket.emit('transcribe_audio', [dataToSend]);

    //   // socket.on('transcribe_audio', (data) {
    //   //   print('websocket data on -- $dataToSend');
    //   // });
    // } catch (error) {
    //   print('websocket error ------ $error');
    // }
    setState(() {
      _isCalling = !_isCalling;

      if (_isCalling) {
        _playAudio();
        _callTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _elapsedTime++;
          });
        });
      } else {
        _stopAudio();
        _callTimer?.cancel();

        setState(() {
          _elapsedTime = 0;
        });
      }
    });
  }

  String _formatElapsedTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: SingleChildScrollView(child: _buildUI()
                    // deviceType == Devices.webpage
                    //     ? _buildUIForDesktop()
                    //     : _buildUIForMobile()

                    ))
          ])),
    );
  }

  Column _buildUI() {
    final deviceType = AppHelpers.getDevice(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerCard(),
        const SizedBox(height: 16.0),
        deviceType == Devices.webpage
            ? _customerDetailsDesktop()
            : _customerDetailsMobile(),
        const SizedBox(height: 16.0),
        _buildMainContent(),
        const SizedBox(height: 16.0)
      ],
    );
  }

  Card _headerCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.lead.leadName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            ElevatedButton.icon(
              onPressed: _toggleCall,
              icon: Icon(_isCalling ? Icons.call_end : Icons.phone),
              label: Text(_isCalling
                  ? "End Call (${_formatElapsedTime(_elapsedTime)})"
                  : "Call Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isCalling ? Colors.red : Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _customerDetailsDesktop() {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Optional: for rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Customer Name:  ${widget.lead.leadName}"),
                  const SizedBox(height: 8.0),
                  Text("Email: ${widget.lead.contactInfo}"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone: ${widget.lead.contactInfo}"),
                  const SizedBox(height: 8.0),
                  const Text("Address: 123 Main St, City, State"),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lead Source: XYZ"),
                  SizedBox(height: 8.0),
                  Text("Call History Updated: Yes"),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Edit
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _customerDetailsMobile() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5), // Optional: for rounded corners
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Customer Name: ${widget.lead.leadName}"),
              const SizedBox(height: 10),
              Text("Email: ${widget.lead.contactInfo}"),
              const SizedBox(height: 10),
              const Text("Phone: 123-456-7890"),
              const SizedBox(height: 10),
              const Text("Address: 123 Main St, City, State"),
              const SizedBox(height: 10),
              const Text("Lead Source: XYZ"),
              const SizedBox(height: 10),
              const Text("Call History Updated: Yes"),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bloc to conditionally show the button if callSummary is empty
        _summarizeUsingAIButton(),
        BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>(
          builder: (context, state) {
            if (state is LoadingState && state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0), // Add space for error message
                child: Text(
                  'Error: ${state.error.errorMessage}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              if (state is CallSummaryState) {
                _callSummaryController.text = state.callSummary;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Call Summary",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: _callSummaryController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: (state is CallSummaryState)
                          ? 'Call summary generated.'
                          : 'No summary available...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // if (state is CallSummaryState && state.callSummary.isNotEmpty)
                  // _generatePoliciesButton(),
                  // const SizedBox(height: 16.0), // Space below the button
                ],
              );
            }
          },
        ),
        _generatePoliciesButton(),
        const GeneratePolicies(),
      ],
    );
  }

  BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>
      _summarizeUsingAIButton() {
    return BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>(
      builder: (context, state) {
        bool isCallSummaryEmpty =
            state is! CallSummaryState || state.callSummary.isEmpty;

        return Visibility(
          visible: true,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton.icon(
              onPressed: isCallSummaryEmpty ? _getcallsummary : () {},
              icon: const Icon(
                Icons.auto_mode,
                color: Colors.white,
              ),
              label: const Text(
                "Summarize Call using AI",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isCallSummaryEmpty ? const Color(0xFF0f548c) : Colors.grey,
                padding: const EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>
      _generatePoliciesButton() {
    return BlocBuilder<CustomerPhoneCallBloc, CustomerPhoneCallState>(
      builder: (context, state) {
        if (state is CallSummaryState && state.callSummary.isNotEmpty) {
          String callSummary = state.callSummary;
          // if (callSummary.isNotEmpty) {
          //   callSummary = state.callSummary;
          //   print('callSummary');
          //   print(state.callSummary);
          // }
          bool isCallSummaryNotEmpty = state.callSummary.isNotEmpty;
          return Visibility(
            visible: isCallSummaryNotEmpty,
            child: BlocBuilder<ranked_policy.PolicyBloc,
                ranked_policy.PolicyState>(
              builder: (context, policyState) {
                bool isBtnEnabled =
                    !(policyState is ranked_policy.RankedPoliciesState &&
                        policyState.rankedPolicies.isNotEmpty);
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton.icon(
                    onPressed: isBtnEnabled
                        ? () => _getRankedPolicies(callSummary)
                        : () {},
                    label: const Text(
                      "Generate Policies",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isBtnEnabled ? const Color(0xFF0f548c) : Colors.grey,
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
