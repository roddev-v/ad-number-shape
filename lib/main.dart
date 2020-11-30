import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showResults(String val) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          final int num = int.tryParse(val);
          String message = '';

          if (isPerfectSquare(num) && isTriangular(num)) {
            message = '$num is both a SQUARE and a TRIANGLE';
          } else if (isPerfectSquare(num)) {
            message = '$num is a SQUARE';
          } else if (isTriangular(num)) {
            message = '$num is a TRIANGLE';
          } else {
            message = '$num is neither a SQUARE or a TRIANGLE';
          }
          return AlertDialog(content: Text(message));
        });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Enter a number and check if is a square or a triangle',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: inputController,
              decoration: const InputDecoration(hintText: 'Enter a number'),
              keyboardType: TextInputType.number,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showResults(inputController.value.text),
        tooltip: 'Check',
        child: const Icon(Icons.check),
      ),
    );
  }
}
