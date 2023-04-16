import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  bool isRunning = false;
  int milliseconds = 0;
  Stopwatch stopwatch = Stopwatch();

  @override
  void dispose() {
    stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatMilliseconds(milliseconds),
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(isRunning ? 'Stop' : 'Start'),
                  onPressed: () {
                    setState(() {
                      isRunning = !isRunning;
                      if (isRunning) {
                        stopwatch.start();
                        _startTimer();
                      } else {
                        stopwatch.stop();
                      }
                    });
                  },
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Text('Reset'),
                  onPressed: () {
                    setState(() {
                      isRunning = false;
                      stopwatch.reset();
                      milliseconds = 0;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    Timer(Duration(milliseconds: 10), () {
      if (isRunning) {
        setState(() {
          milliseconds = stopwatch.elapsedMilliseconds;
        });
        _startTimer();
      }
    });
  }

  String _formatMilliseconds(int milliseconds) {
    int minutes = (milliseconds / 60000).truncate();
    int seconds = ((milliseconds / 1000) % 60).truncate();
    int millis = (milliseconds % 1000) ~/ 10;
    return '$minutes:${_twoDigits(seconds)}:${_twoDigits(millis)}';
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}
