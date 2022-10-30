import 'package:flutter/material.dart';

void main() {
  runApp(Client_Model());
}

class Client_Model extends StatelessWidget {
  // No dynamic data. Just a dumb widget, that just paints some pixels to the screen
  const Client_Model({super.key});

  @override
  Widget build(BuildContext context) {
    // called whenever the app needs to re-build the UI, like when data changes.
    return MaterialApp(
      // used as root of app; allows us to configure themes and routes
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text('NETRUNNER CLIENT TEST'),
        ),

        // body: const Center(
        //   child: SizedBox(
        //     child: const Text('konichiwa, tomodachi'),
        //     height: 50,
        //     width: 50,
        //   ),
        // ),

        // body: Row(  // have row flow across the `main` axis
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: const [
        //     // Icon(Icons.backpack),
        //     Expanded( // Takes up space in relation to its neighbors (?)
        //       flex: 1,
        //       child: Icon(Icons.backpack),
        //     ),
        //     Icon(Icons.leaderboard),
        //     Icon(Icons.person),
        //   ],

        // body: Stack(
        //   children: [
        //     Container(
        //       color: Colors.blueGrey,
        //       width: 100,
        //       height: 100,
        //     ),
        //     const Align(
        //       child: Icon(Icons.verified),
        //       alignment: Alignment.topLeft,
        //     ),
        //   ],
        // ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("button pressed!");
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),

        drawer: const Drawer(
          child: Text('AYO??'),
        ),
      ),
    );
  }
}
