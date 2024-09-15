import 'package:fieldfight/extension/slide_from_left_animation_extension.dart';
import 'package:fieldfight/extension/slide_from_right_animation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky); // Hides status bar and navigation bar

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xffFF7F3E)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
            ),
            //Text Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Field",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RussoOne",
                      fontSize: MediaQuery.sizeOf(context).width * 0.1,
                      fontWeight: FontWeight.w600),
                ).slideFromLeft(),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Fight",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RussoOne",
                      fontSize: MediaQuery.sizeOf(context).width * 0.1,
                      fontWeight: FontWeight.w600),
                ).sildeFromRight()
              ],
            ),

            Spacer(),

            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 5),
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(122, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ]),
                child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    "Start",
                    style: TextStyle(
                        fontFamily: "RussoOne",
                        color: Color(0xffFF7F3E),
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
