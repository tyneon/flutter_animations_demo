import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool toggle = false;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildItem(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 60,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: toggle,
          onChanged: (value) {
            setState(
              () {
                toggle = value;
                if (value) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
            );
          },
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildItem("First"),
              AnimatedContainer(
                constraints: BoxConstraints(
                  maxHeight: toggle ? 120 : 0,
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: buildItem("Second"),
                  ),
                ),
              ),
              buildItem("Third"),
            ],
          ),
        ),
      ],
    );
  }
}
