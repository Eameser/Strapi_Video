import 'package:flutter/material.dart';
import 'package:video_strapi/video_details.dart';
import 'package:video_strapi/video_lib.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List pages = [
    VideoLibrary(),
    VideoDetails(),
  ];
  int currentIndex = 1;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:
        Scaffold(
          body:pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: Colors.transparent,
            backgroundColor: Colors.black54,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'library'),
              BottomNavigationBarItem(icon: Icon(Icons.airplay), label: 'Details'),
            ],
            currentIndex: currentIndex,
            onTap: onTap,
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
        )
    );
  }
}
