import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayotani/domain/entities/user_entity.dart';
import 'package:ayotani/presentation/pages/common_pages/home_page.dart';
import 'package:ayotani/presentation/providers/common_notifiers/bottom_navbar_notifier.dart';

class MainPage extends StatefulWidget {
  final UserEntity user;

  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;
  final List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _pages.addAll([
      HomePage(uid: widget.user.uid, pageController: _pageController),
    ]);
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarNotifier>(
      builder: (context, navbar, child) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _pages,
            onPageChanged: (index) => navbar.selectedIndex = index,
          ),
          // backgroundColor: navbar.backgroundColor,
          // bottomNavigationBar: CustomBottomNavigationBar(
          //   notifier: navbar,
          //   pageController: _pageController,
          // ),
          // floatingActionButton: CustomFloatingActionButton(
          //   onPressed: () => Navigator.pushNamed(
          //     context,
          //     checkRoute,
          //     arguments: widget.user.uid,
          //   ),
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
