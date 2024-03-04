import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Hero(
        tag: "image_${index + 1}",
        child: Material(
          child: InkWell(
            child: Card(
              child: Image.asset("assets/images/${index + 1}.jpg"),
            ),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 1000),
                  reverseTransitionDuration: const Duration(milliseconds: 1000),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return DetailsPage(index);
                  },
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ),
      ),
      itemCount: 10,
    );
  }
}

class DetailsPage extends StatelessWidget {
  final int index;
  const DetailsPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Picture ${index + 1}"),
      ),
      body: Column(
        children: [
          Hero(
            tag: "image_${index + 1}",
            child: Material(
              child: Image.asset("assets/images/${index + 1}.jpg"),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nIn tempor eros non enim facilisis gravida. Aenean sit amet quam ut sapien blandit placerat in ut sem. Ut non vehicula turpis, et tincidunt ligula. Sed leo ex, consequat a libero sit amet, mattis semper diam. Praesent augue lorem, tincidunt ut odio ac, tempus fermentum purus. Nam id turpis ac elit tincidunt dictum vitae et sapien. Morbi ac vulputate dui, id rutrum eros. Duis sem elit, volutpat non quam non, feugiat varius sem. Maecenas luctus placerat fringilla. Nullam a faucibus nisl, vel convallis nunc.\n\nFusce posuere, urna quis lobortis tincidunt, nunc tortor faucibus ante, eget congue elit ipsum quis lorem. Aliquam ac lorem mauris. Suspendisse iaculis commodo nibh, at blandit urna lacinia a.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
