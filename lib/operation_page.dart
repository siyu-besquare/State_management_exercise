import 'package:flutter/material.dart';

class Multiply extends StatelessWidget {
  final int input;
  final int state;
  Multiply({required this.input, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$input',
              textScaleFactor: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  child: Text(
                    'X',
                    textScaleFactor: 5,
                  ),
                ),
              ],
            ),
            Text(
              '$state',
              textScaleFactor: 10,
            ),
            Divider(
              thickness: 5, // thickness of the line
              indent: 20, // empty space to the leading edge of divider.
              endIndent: 20, // empty space to the trailing edge of the divider.
              color: Colors.black, // The color to use when painting the line.
              height: 20, // The divider's height extent.
            ),
            Text(
              '${input * state}',
              textScaleFactor: 10,
            )
          ],
        ),
      ),
    );
  }
}

class Divide extends StatelessWidget {
  final int input;
  final int state;
  Divide({required this.input, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$input',
              textScaleFactor: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45,
                  child: Text(
                    '/',
                    textScaleFactor: 5,
                  ),
                ),
              ],
            ),
            Text(
              '$state',
              textScaleFactor: 10,
            ),
            Divider(
              thickness: 5, // thickness of the line
              indent: 20, // empty space to the leading edge of divider.
              endIndent: 20, // empty space to the trailing edge of the divider.
              color: Colors.black, // The color to use when painting the line.
              height: 20, // The divider's height extent.
            ),
            Text(
              '${input / state}',
              textScaleFactor: 10,
            )
          ],
        ),
      ),
    );
  }
}
