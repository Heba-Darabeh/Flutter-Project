// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class BinEntryScreen extends StatefulWidget {
  @override
  _BinEntryScreenState createState() => _BinEntryScreenState();
}

class _BinEntryScreenState extends State<BinEntryScreen> {
  List<Color> dots = [];
  int currentIndex = 0;
  String inputValue = "";

  // Function to handle key press
  void onKeyPressed(String value) {
    if (currentIndex < 6) {
      setState(() {
        inputValue += value;
        dots[currentIndex] = Color.fromRGBO(76, 40, 116, 1);
        currentIndex++;
      });
    }
    if (currentIndex == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DashboardScreen()), // NextPage is the next screen
      );
    }
  }

  // Function to handle backspace
  void onDeletePressed() {
    if (currentIndex > 0) {
      setState(() {
        inputValue = inputValue.substring(0, inputValue.length - 1);
        currentIndex--;
        dots[currentIndex] = Colors.grey;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(actions: [
          GestureDetector(
              onTap: () {
                //
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    'تسجيل خروج',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: const Color.fromRGBO(46, 2, 54, 1),
                        color: Colors.grey.shade800),
                  ),
                ),
              ))
        ]),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromRGBO(235, 228, 253, 1),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Color.fromRGBO(76, 40, 116, 1),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text(
                  "مرحبًا بك مرة أخرى، Mohammad Ali الرجاء إدخال رمز المرور الخاص بك في ثرايف لتسجيل الدخول.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dots[index],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 32),
              Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 80,
                  runSpacing: 40,
                  direction: Axis.horizontal,
                  children: [
                    // First row: 1, 2, 3
                    KeyButton(
                      label: "١",
                      onPressed: () => onKeyPressed("1"),
                    ),
                    KeyButton(
                      label: "٢",
                      onPressed: () => onKeyPressed("2"),
                    ),
                    KeyButton(
                      label: "٣",
                      onPressed: () => onKeyPressed("3"),
                    ),
                    // Second row: 4, 5, 6
                    KeyButton(
                      label: "٤",
                      onPressed: () => onKeyPressed("4"),
                    ),
                    KeyButton(
                      label: "٥",
                      onPressed: () => onKeyPressed("5"),
                    ),
                    KeyButton(
                      label: "٦",
                      onPressed: () => onKeyPressed("6"),
                    ),
                    // Third row: 7, 8, 9
                    KeyButton(
                      label: "٧",
                      onPressed: () => onKeyPressed("7"),
                    ),
                    KeyButton(
                      label: "٨",
                      onPressed: () => onKeyPressed("8"),
                    ),
                    KeyButton(
                      label: "٩",
                      onPressed: () => onKeyPressed("9"),
                    ),
                    // Fourth row: Empty space for alignment, 0, and backspace
                    SizedBox(width: 50), // Empty space
                    KeyButton(
                      label: "٠",
                      onPressed: () => onKeyPressed("0"),
                    ),
                    KeyButton(
                      label: "⌫", // Backspace
                      onPressed: () => onDeletePressed(),
                    ),
                  ]),
              GestureDetector(
                onTap: () => {
                  //
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "نسيت رمز المرور الخاص بي",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  KeyButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
