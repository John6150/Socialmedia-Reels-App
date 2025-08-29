// import 'package:_firstapp/widgets.dart';
// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  // runApp(const MyApp());
  // final staff = Staff();
  Student student_1 = Student(
      name: 'Mohammed',
      stdId: 'SQI1234',
      dpt: 'Soft Engineering',
      sub: ['Flutter', 'NodeJs']);

  final staff_1 = employ(student_1);
  final gradute = terminateEmployment(staff_1,
      stdId: student_1.stdId, dpt: student_1.dpt, sub: student_1.sub);
  print(staff_1.toJson(staff_1));
  print(gradute.toJson(gradute));

  // {
  //   'name': 'Mohammed',
  // }
}

Staff employ(Student data) {
  String genId() {
    // String id = '';
    final buffer = StringBuffer();
    for (var i = 0; i < 5; i++) {
      var random = Random();
      int x = random.nextInt(100);
      // id += x.toString();
      buffer.write(x);
    }
    return buffer.toString();
    // return id;
  }

  return Staff(name: data.name, stfId: genId(), companyDpt: 'IT');
}

Student terminateEmployment(Staff data,
    {required String stdId, required String dpt, required List sub}) {
  return Student(name: data.name, stdId: stdId, dpt: dpt, sub: sub);
}

class Student {
  final String name;
  final String stdId;
  final String dpt;
  final int? age;
  final List sub;
  final String? img;

  Student(
      {required this.name,
      required this.stdId,
      required this.dpt,
      this.age,
      this.img,
      required this.sub});

  Student fromJson(Map<String, dynamic> data) {
    return Student(
        name: data['name'] ?? '',
        stdId: data['stdId'] ?? '',
        dpt: data['dpt'] ?? '',
        img: data['img'] ?? '',
        age: data['age'] ?? 0,
        sub: data['sub'] ?? []);
  }

  Map<String, dynamic> toJson(Student data) {
    return {
      'name': data.name,
      'stdId': data.stdId,
      'dpt': data.dpt,
      'img': data.img,
      'age': data.age,
      'sub': data.sub
    };
  }
}

class Staff {
  final String name;
  final String stfId;
  final String companyDpt;
  final int? age;
  final String? img;

  Staff({
    required this.name,
    required this.stfId,
    required this.companyDpt,
    this.age,
    this.img,
  });

  Staff fromJson(Map<String, dynamic> data) {
    return Staff(
      name: data['name'] ?? '',
      stfId: data['stfId'] ?? '',
      companyDpt: data['companyDpt'] ?? '',
      img: data['img'] ?? '',
      age: data['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson(Staff data) {
    return {
      'name': data.name,
      'stdId': data.stfId,
      'dpt': data.companyDpt,
      'img': data.img,
      'age': data.age,
    };
  }
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
