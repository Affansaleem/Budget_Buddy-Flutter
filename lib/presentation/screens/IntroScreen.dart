import 'package:budgetbuddy/presentation/screens/HomePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../app/constants.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<Introscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      height: 600,
                      width: 600,
                      "assets/lottie/lottie-intro-2.json",
                    ),
                    Text(
                      'Welcome to Your Finance Manager',
                      style: modernLightTextStyle(
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      height: 600,
                      width: 600,
                      "assets/lottie/lottie-intro-3.json",
                    ),
                    Text(
                      'Smart Saving, Simplified Spending',
                      style: modernLightTextStyle(
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      height: 600,
                      width: 600,
                      "assets/lottie/lottie-intro-5.json",
                    ),
                    Text(
                      'Start Managing!',
                      style: modernLightTextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                          padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF800020),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PageIndicator(
            tabController: _tabController,
            currentPageIndex: _currentPageIndex,
            onUpdateCurrentPageIndex: _updateCurrentPageIndex,
            isOnDesktopAndWeb: _isOnDesktopAndWeb,
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          tabController.length,
          (index) {
            return GestureDetector(
              onTap: () => onUpdateCurrentPageIndex(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                width: 50.0,
                height: 30.0,
                decoration: index == currentPageIndex
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == currentPageIndex
                            ? const Color(0XFFD22B2B)
                            : Colors.transparent,
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
              ),
            );
          },
        ),
      ),
    );
  }
}
