import 'dart:io';
import 'dart:typed_data';

import 'package:_firstapp/variables.dart';
import 'package:_firstapp/widgets.dart';
// import 'package:_firstapp/widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyFirstApp(title: 'Multimedia'),
    );
  }
}

class MyFirstApp extends StatefulWidget {
  String? title;
  MyFirstApp({
    super.key,
    required this.title,
  });

  @override
  State<MyFirstApp> createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  TextEditingController txtControl = TextEditingController(text: 'Hello');
  late VideoPlayerController videoControl1;
  late VideoPlayerController videoControl2;
  late VideoPlayerController videoControl3;
  late VideoPlayerController videoControl4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoControl1 = VideoPlayerController.networkUrl(Uri.parse(
        'https://videos.pexels.com/video-files/8233057/8233057-uhd_1440_2732_25fps.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    videoControl2 = VideoPlayerController.networkUrl(Uri.parse(
        'https://videos.pexels.com/video-files/5896379/5896379-uhd_1440_2560_24fps.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    videoControl3 = VideoPlayerController.networkUrl(Uri.parse(
        'https://videos.pexels.com/video-files/8859849/8859849-uhd_1440_2560_25fps.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    videoControl4 = VideoPlayerController.networkUrl(Uri.parse(
        'https://videos.pexels.com/video-files/4448895/4448895-hd_1080_1920_30fps.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    videoControl1.setPlaybackSpeed(0.5);
    // videoControl.setLooping(true);
    // videoControl.setPlaybackSpeed(2);
    // videoControl.setVolume(100);
    // videoControl.videoPlayerOptions!.allowBackgroundPlayback;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoControl1.dispose();
    videoControl2.dispose();
    videoControl3.dispose();
    videoControl4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: const Icon(Icons.menu),
        title: Text('${widget.title}'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.camera_alt_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 9 / 16,
              child: videoControl1.value.isInitialized
                  ? VisibilityDetector(
                      key: Key('my_widget_key_1'),
                      onVisibilityChanged: (info) {
                        double visible = info.visibleFraction;
                        visible >= 0.4
                            ? videoControl1.play()
                            : videoControl1.pause();
                        // print(visible)
                      },
                      child: VideoPlayer(videoControl1))
                  : const Text('Sorry, loading the video'),
            ),
            VisibilityDetector(
              key: Key('my_widget_key_2'),
              onVisibilityChanged: (info) {
                double visible = info.visibleFraction;
                visible >= 0.4 ? videoControl2.play() : videoControl2.pause();
                print(visible);
              },
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: videoControl2.value.isInitialized
                    ? VideoPlayer(videoControl2)
                    : const Text('Sorry, loading the video'),
              ),
            ),
            VisibilityDetector(
              key: Key('my_widget_key_3'),
              onVisibilityChanged: (info) {
                double visible = info.visibleFraction;
                visible >= 0.4 ? videoControl3.play() : videoControl3.pause();
                print(visible);
              },
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: videoControl3.value.isInitialized
                    ? VideoPlayer(videoControl3)
                    : const Text('Sorry, loading the video'),
              ),
            ),
            VisibilityDetector(
              key: Key('my_widget_key_4'),
              onVisibilityChanged: (info) {
                double visible = info.visibleFraction;
                visible >= 0.4 ? videoControl4.play() : videoControl4.pause();
                print(visible);
              },
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: videoControl4.value.isInitialized
                    ? VideoPlayer(videoControl4)
                    : const Text('Sorry, loading the video'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
