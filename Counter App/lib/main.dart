import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'It\'s My Counter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('It\'s My  Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mood,
              size: 200,
              color: Colors.orange,
            ),
            SizedBox(height: 16),
            Text(
              'The Count is:',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove, size: 36),
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 32),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add, size: 36),
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 32),
            if (_counter >= 11)
              Text(
                'Whoa, you have crossed 10',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
            if (_counter <= -10)
              Text(
                'Oops, negative vibes!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
