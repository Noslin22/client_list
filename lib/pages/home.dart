import 'package:client_list/consts.dart';
import 'package:client_list/pages/clients.dart';
import 'package:client_list/pages/new_client.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    config();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client List"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 100),
                maximumSize: const Size(100, 100),
                primary: Colors.black,
              ),
              child: const Text('New Client'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewClient(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 100),
                maximumSize: const Size(100, 100),
                primary: Colors.black,
              ),
              child: const Text('Clients'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Clients(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
