import 'package:flutter/material.dart';

class AboutFootballPage extends StatefulWidget {
  const AboutFootballPage({Key? key}) : super(key: key);

  @override
  State<AboutFootballPage> createState() => _AboutFootballPageState();
}

class _AboutFootballPageState extends State<AboutFootballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Football XT"),
        centerTitle: true,
      ),
      body: const Text(
        "hcvbjshcvjzxvzjxvcjzhxvxbcnzbv hzxgcvjhxcvjuzxhcvjzvcsjhdgcvzjhvczhjxg",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
