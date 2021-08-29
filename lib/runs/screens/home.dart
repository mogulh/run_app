import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:run_app/env.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "RunApp",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const InfoCard(
                  title: "Distance Covered",
                  value: 100,
                  units: "m",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    InfoCard(
                      title: "Top Speed",
                      value: 100,
                      units: "m/s",
                    ),
                    InfoCard(
                      title: "Total Elevation",
                      value: 100,
                      units: "m",
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final int value;
  final String units;
  const InfoCard(
      {Key? key, required this.title, required this.value, required this.units})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: Pallete.priAccent,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Pallete.priColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "$value $units",
            style: const TextStyle(
                color: Pallete.secColor,
                fontSize: 18,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
