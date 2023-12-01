import 'package:flutter/material.dart';

class Widget090 extends StatefulWidget {
  const Widget090({Key? key}) : super(key: key);

  @override
  State<Widget090> createState() => _Widget090State();
}

class _Widget090State extends State<Widget090> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160,
        height: 28,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
        child: DropdownButton<String>(
          value: dropdownValue,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem<String>(
              value: 'One',
              child: Text('블루아카이브'),
            ),
            DropdownMenuItem<String>(
              value: 'Two',
              child: Text('인디게임'),
            ),
            DropdownMenuItem<String>(
              value: 'Three',
              child: Text('번지점프'),
            ),
          ],
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          underline: const SizedBox.shrink(),
          dropdownColor: Colors.black,
        ),
      ),
    );
  }
}
