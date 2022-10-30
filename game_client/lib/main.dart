import 'package:flutter/material.dart';
import 'package:game_client/screens/game_screen.dart';

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
        debugShowCheckedModeBanner: false,
        title: "Netrunner Cardgame",
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: GameScreen()

        // home: Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.black12,
        //     title: const Text('NETRUNNER CLIENT TEST'),
        //   ),

        //   floatingActionButton: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     onPressed: () {
        //       print("button pressed!");
        //     },
        //   ),
        //   bottomNavigationBar: BottomNavigationBar(
        //     items: const [
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.business),
        //         label: 'Business',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.school),
        //         label: 'School',
        //       ),
        //     ],
        //   ),

        //   drawer: const Drawer(
        //     child: Text('AYO??'),
        //   ),
        // ),
        );
  }
}
