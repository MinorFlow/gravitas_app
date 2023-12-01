import 'package:flutter/material.dart';
import 'package:gravitas_app/dashboard/pages/dashboard_page.dart';
import 'package:gravitas_app/calendar/pages/calendar_page.dart';
import 'package:gravitas_app/activity/pages/activity_page.dart';
import 'package:gravitas_app/shop/pages/shop_page.dart';
import 'package:gravitas_app/setting/pages/setting_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const GravitasApp());
}

class GravitasApp extends StatelessWidget {
  const GravitasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gravitas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gravitas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final pageController = PageController();

  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  int currentPageIndex = 0;

  final List<Widget> _children = [
    DashboardPage(),
    CalendarPage(),
    ActivityPage(),
    ShopPage(),
    SettingPage()
  ];

  void onPageChanged(int index) {
    setState(() {
      pageController.jumpToPage(index);
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            pageController.jumpToPage(index);
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_run),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Setting',
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _children,
        physics: NeverScrollableScrollPhysics(),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      */
    );
  }
}
