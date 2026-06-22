import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback onNext;
  const TemperatureScreen({super.key, required this.onNext});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  //----------------//
  String degree = "";
  void onTextChange(String value) {
    setState(() {
      degree = value;
    });
  }

  String get getFahrenheit {
    double? fah;
    double? deg = double.tryParse(degree);
    if (deg == null) {
      return "No value";
    } else {
      fah = deg * 1.8 + 32;
      return "$fah F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Icon(
                Icons.thermostat_outlined,
                size: 120,
                color: Colors.white,
              ),
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              onChanged: onTextChange,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text(getFahrenheit),
            ),

            const SizedBox(height: 25),
            Center(
              child: OutlinedButton(
                onPressed: widget.onNext,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.white),
                ),
                child: const Text(
                  'Bye Bye',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


