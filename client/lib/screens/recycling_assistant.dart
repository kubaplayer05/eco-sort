import 'package:client/widgets/shared_app_bar.dart';
import 'package:client/widgets/shared_bottom_navbar.dart';
import 'package:flutter/material.dart';

class RecyclingAssistantScreen extends StatelessWidget {
  const RecyclingAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Wprowadź nazwę produktu, aby dowiedzieć się, jak go segregować",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  IconButton.filled(onPressed: () {}, icon: const Icon(Icons.send))
                ],
              )
            ],
          )),
      bottomNavigationBar: const SharedBottomNavbar(),
    );
  }
}
