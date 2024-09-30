// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'tab_new.dart';
import 'tab_list.dart';
import 'laptop_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LaptopDetails> laptopList = [];

  void addLaptop(LaptopDetails laptop) {
    setState(() {
      laptopList.add(laptop);
    });
  }

  void deleteLaptop(int index) {
    setState(() {
      laptopList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Laptops",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.white,
              child: const TabBar(
                tabs: [
                  Tab(text: 'New'),
                  Tab(text: 'List'),
                ],
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.lightGreen,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TabNew(onAdd: addLaptop),
            TabList(
              laptopList: laptopList,
              onDelete: deleteLaptop,
            ),
          ],
        ),
      ),
    );
  }
}
