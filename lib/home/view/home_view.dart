import 'package:flutter/material.dart';
import 'widgets/products.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcoming Auctions',
      home: Scaffold(
          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: const Color(0XFFFFD1D1D1),
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings),
          //       label: '',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: '',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.chat),
          //       label: '',
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: Colors.amber[800],
          //   onTap: _onItemTapped,
          // ),
          backgroundColor: const Color(0xFFF3F3F3),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            backgroundColor: const Color(0xFF1A3B68),
            elevation: 0,
            title: const Text('Upcoming Auctions'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
            ],
            centerTitle: true,
          ),
          body: const SingleChildScrollView(child: ProductListing())),
    );
  }
}
