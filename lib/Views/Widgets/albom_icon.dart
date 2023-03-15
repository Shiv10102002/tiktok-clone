import 'package:flutter/material.dart';

class AlbomIcon extends StatefulWidget {
  String albumUrl;
  AlbomIcon({super.key, required this.albumUrl});

  @override
  State<AlbomIcon> createState() => _AlbomIconState();
}

class _AlbomIconState extends State<AlbomIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [Colors.grey, Colors.white]),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(widget.albumUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
