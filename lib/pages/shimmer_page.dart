import 'package:flutter/material.dart';
import 'package:animations/widgets/shimmer_loading.dart';

class ShimmerPage extends StatefulWidget {
  const ShimmerPage({super.key});

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}

class _ShimmerPageState extends State<ShimmerPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return makeShimmer(
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Switch(
              value: !isLoading,
              onChanged: (value) {
                setState(
                  () {
                    isLoading = !value;
                  },
                );
              },
            ),
            Center(
              child: ShimmerLoading(
                isLoading: isLoading,
                child: const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ShimmerLoading(
              isLoading: isLoading,
              child: isLoading
                  ? const PlaceholderText(large: true)
                  : const Text(
                      "Section title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            ShimmerLoading(
              isLoading: isLoading,
              child: isLoading
                  ? const PlaceholderText(multiline: true)
                  : const Text(
                      "Lorem ipsum dolor sit amet consectetur. Etiam nibh viverra viverra lectus neque ut donec."),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderText extends StatelessWidget {
  final bool multiline;
  final bool large;
  const PlaceholderText({
    this.multiline = false,
    this.large = false,
    super.key,
  });

  Widget buildContainer(double width) => Container(
        height: large ? 30 : 20,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return multiline
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <double>[250, 250, 100]
                .map((width) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: buildContainer(width),
                    ))
                .toList(),
          )
        : buildContainer(130);
  }
}
