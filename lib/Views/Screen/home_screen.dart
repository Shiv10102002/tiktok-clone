import 'package:flutter/material.dart';
import 'package:tictok/Views/Widgets/custom_addicon.dart';
import 'package:tictok/constraint.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageidx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundcolor,
        items: const [
          //for homepage
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
//for search
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
//for
          BottomNavigationBarItem(label: "", icon: CustomAddIcon()),
//for message
          BottomNavigationBarItem(
            label: "Message",
            icon: Icon(Icons.message),
          ),
//for user profile
          BottomNavigationBarItem(
            label: "profile",
            icon: Icon(Icons.person),
          ),
        ],
        onTap: (index) {
          setState(() {
            pageidx = index;
          });
        },
        currentIndex: pageidx,
      ),
      body: Center(child: pageIndex[pageidx]),
    );
  }
}
