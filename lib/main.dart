import 'package:flutter/material.dart';

import 'cardnew.dart';

void main() {
  runApp(const MyApp());
}

final List<String> listpathp = [
  "assets/img1.jpg",
  "assets/img2.jpg",
  "assets/img3.jpg",
  "assets/img4.jpg",
  "assets/img5.jpg",
  //"assets/img6.jpg",
];

final List<String> listpathend = [
  "assets/img1.jpg",
  "assets/img2.jpg",
  "assets/img3.jpg",
  //"assets/img4.jpg",
  //"assets/img5.jpg",
  //"assets/img6.jpg",
];

final List<String> listpathtwo = [
  "assets/img1.jpg",
  "assets/img2.jpg",
  //"assets/img3.jpg",
  //"assets/img4.jpg",
  //"assets/img5.jpg",
  //"assets/img6.jpg",
];




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Instagram Page"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CardNoticia(listpath: listpathp,),
                
                CardNoticia(listpath: listpathend,),
                
                CardNoticia(listpath: listpathtwo,),

              ],
            );
          },
        ),
      ),
    );
  }
}
