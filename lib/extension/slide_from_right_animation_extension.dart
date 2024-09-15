import 'package:flutter/material.dart';

extension SlideFromRightAnimationExtension on Widget {
  Widget sildeFromRight({Duration duration = const Duration(seconds: 1)}) {
    return _SlideFromRight(
      duration: duration,
      child: this,
    );
  }
}

class _SlideFromRight extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const _SlideFromRight(
      {super.key, required this.child, required this.duration});

  @override
  State<_SlideFromRight> createState() => _SlideFromRightState();
}

class _SlideFromRightState extends State<_SlideFromRight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<Offset>(
            begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
