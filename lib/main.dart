import 'package:flutter/material.dart';

import 'package:animations/pages/home_page.dart';
import 'package:animations/pages/hero_page.dart';
import 'package:animations/pages/shimmer_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  bool showTrailing = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                trailing: showTrailing
                    ? IconButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        icon: const Icon(Icons.more_horiz_rounded),
                      )
                    : const SizedBox(),
                destinations: pages
                    .map(
                      (page) => NavigationRailDestination(
                        icon: page.icon,
                        selectedIcon: page.selectedIcon,
                        label: Text(page.label),
                      ),
                    )
                    .toList(),
              ),
              const VerticalDivider(width: 1),
              Expanded(child: pages[_selectedIndex].page),
            ],
          ),
        ),
      ),
    );
  }
}

class Page {
  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget page;
  const Page(
    this.label,
    this.icon,
    this.selectedIcon,
    this.page,
  );
}

const pages = [
  Page(
    "Home",
    Icon(Icons.home),
    Icon(Icons.home_outlined),
    HomePage(),
  ),
  Page(
    "Hero",
    Icon(Icons.space_dashboard),
    Icon(Icons.space_dashboard_outlined),
    HeroPage(),
  ),
  Page(
    "Shimmer",
    Icon(Icons.star),
    Icon(Icons.star_border),
    ShimmerPage(),
  ),
];
