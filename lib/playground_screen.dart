import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayGroundScreen extends StatefulWidget {
  const PlayGroundScreen({
    super.key,
  });

  @override
  State<PlayGroundScreen> createState() => _PlayGroundScreenState();
}

class _PlayGroundScreenState extends State<PlayGroundScreen> {
  //Count Down
  bool showCountDown = true;
  static const maxSeconds = 3;
  int secondsLeft = maxSeconds;
  Timer? _timer;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          showCountDown = false;
          _timer!.cancel();
        }
      });
    });
  }

  double topContainerHeight = 0;
  double bottomContainerheight = 0;
  Color? topContainerColor;
  Color? bottomContainerColor;
  topContainerHit() {
    if (bottomContainerheight > 1) {
      setState(() {
        bottomContainerheight =
            bottomContainerheight - MediaQuery.sizeOf(context).height * 0.003;
      });
    }
  }

  bottomContainerHit() {
    if (bottomContainerheight <= MediaQuery.sizeOf(context).height) {
      setState(() {
        bottomContainerheight =
            bottomContainerheight + MediaQuery.sizeOf(context).height * 0.003;
      });
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      topContainerHeight = MediaQuery.sizeOf(context).height / 2;
      bottomContainerheight = MediaQuery.sizeOf(context).height / 2;
      topContainerColor = const Color(0xff003285);
      bottomContainerColor = const Color(0xffFF7F3E);
      setState(() {});
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 0, 56, 146)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: topContainerHit,
                  splashColor: const Color.fromARGB(255, 0, 34, 88),
                  splashFactory: InkRipple.splashFactory, //
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(color: bottomContainerColor),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 255, 86, 2),
                  splashFactory: InkRipple.splashFactory, // Opti
                  onTap: bottomContainerHit,
                  child: AnimatedContainer(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: bottomContainerheight,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  ),
                ),
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
              : const SizedBox.shrink(),
          countDownWidget()
        ],
      ),
    );
  }

  countDownWidget() {
    return showCountDown
        ? Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(29, 0, 0, 0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                secondsLeft == 0 ? "GO!" : secondsLeft.toString(),
                key: ValueKey<int>(secondsLeft),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 120,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
