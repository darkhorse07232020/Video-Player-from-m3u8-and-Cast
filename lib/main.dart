import 'package:flutter/material.dart';
import 'package:flutter_video_cast/flutter_video_cast.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_m3u8_and_casting/components/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cast Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ChromeCastController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ChromeCastButton(
            onButtonCreated: (controller) {
              setState(() => _controller = controller);
              _controller.addSessionListener();
            },
            onSessionStarted: () {
              _controller.loadMedia(
                  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: VideoItem(
              videoPlayerController: VideoPlayerController.network(
                "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
              ),
              looping: true,
              autoplay: true,
            ),
          ),
        ],
      ),
    );
  }
}
