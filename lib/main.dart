import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double topContainerHeight = 0;
  double bottomContainerheight = 0;
  Color? topContainerColor;
  Color? bottomContainerColor;
  topContainerHit() {
    if (bottomContainerheight > 1) {
      setState(() {
        bottomContainerheight =
            bottomContainerheight - MediaQuery.sizeOf(context).height * 0.005;
      });
    }
  }

  bottomContainerHit() {
    if (bottomContainerheight <= MediaQuery.sizeOf(context).height) {
      setState(() {
        bottomContainerheight =
            bottomContainerheight + MediaQuery.sizeOf(context).height * 0.005;
      });
    }

    print(MediaQuery.sizeOf(context).height);
    print(bottomContainerheight);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      topContainerHeight = MediaQuery.sizeOf(context).height / 2;
      bottomContainerheight = MediaQuery.sizeOf(context).height / 2;
      topContainerColor = const Color(0xff003285);
      bottomContainerColor = const Color(0xffFF7F3E);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            InkWell(
              onTap: topContainerHit,
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(color: topContainerColor),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: bottomContainerHit,
                child: AnimatedContainer(
                  width: double.infinity,
                  height: bottomContainerheight,
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(color: bottomContainerColor),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
            bottomContainerheight >= MediaQuery.sizeOf(context).height
                ? const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Orange Wins",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 36),
                      ),
                    ))
                : const SizedBox.shrink(),
            bottomContainerheight <= 1
                ? const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Blue Wins",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 36),
                      ),
                    ))
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
