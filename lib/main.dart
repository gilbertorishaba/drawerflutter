import 'package:app/my_drawer_header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BBCApp());
}

class BBCApp extends StatelessWidget {
  const BBCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('BBC App'),
      ),
      body: Container(
        child: const Center(
          child: Text('Home Page'),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [const MyHeaderDrawer(), MyDrawerList()],
          ),
        ),
      ),
    );
  }
}

Widget MyDrawerList() {
  var currentPage;
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      // Each menu item should be a separate child of Column
      children: [
        menuItem(1, "Dashboard", Icons.dashboard_outlined,
            currentPage == DrawerSections.dashboard),
        menuItem(2, "Course Units", Icons.people_alt_outlined,
            currentPage == DrawerSections.courseunits),
        menuItem(
            3, "Events", Icons.event, currentPage == DrawerSections.events),
        const Divider(),
        menuItem(4, "Settings", Icons.settings_outlined,
            currentPage == DrawerSections.settings),
        menuItem(5, "Notifications", Icons.notification_add_outlined,
            currentPage == DrawerSections.notifications),
        const Divider(),
        menuItem(6, "Privacy Policy", Icons.privacy_tip_outlined,
            currentPage == DrawerSections.privacyPolicy),
        menuItem(7, "Send Feedback", Icons.feedback_outlined,
            currentPage == DrawerSections.sendFeedback),
      ],
    ),
  );
}

Widget menuItem(int id, String title, IconData icon, bool selected) {
  return Material(
    color: selected ? Colors.grey[300] : Colors.transparent,
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
                child: Icon(
              icon,
              size: 20,
              color: Colors.black,
            )),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  courseunits,
  events,
  settings,
  notifications,
  privacyPolicy,
  sendFeedback
}
