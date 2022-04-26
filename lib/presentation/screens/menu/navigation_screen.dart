import 'package:e_comerce_app/presentation/screens/menu/add_item_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/cart_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/favorite_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/home_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _DashBoardState();
}

class _DashBoardState extends State<NavigationScreen> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Theme.of(context).colorScheme.onSurface, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.decelerate,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_max_outlined),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.preview),
        title: ("Cart"),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_box_rounded),
        title: ("Add"),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border_outlined),
        title: ("Favorite"),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.portrait_outlined),
        title: ("Profile"),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onPrimary,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CartScreen(),
      const AddItem(),
      const FavoriteScreen(),
      const ProfileScreen(),
    ];
  }
}
