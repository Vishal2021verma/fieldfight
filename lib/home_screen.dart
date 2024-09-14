import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              children: [
                Text(
                  "Field Fight",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RussoOne",
                      fontSize: MediaQuery.sizeOf(context).width * 0.1,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
