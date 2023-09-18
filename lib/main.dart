

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'weather_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  String _displayText = "";

  void _updateText() {

    setState(() {
      _displayText = _textController.text;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Show_weather(),
          settings: RouteSettings(arguments: _displayText),),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Enter your city...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            const SizedBox(height: 30,),
            Container(
              width: 340,
              child: TextField(
                controller: _textController,
                decoration:  InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear), // Suffix icon
                    onPressed: (){
                      _textController.clear();
                    }, // Clear the text field
                  ),
                  hintText: 'Your location',
                  border: OutlineInputBorder( // Customize the border here
                    borderSide: const BorderSide(
                      color: Colors.pink, // Change the border color
                      width: 2.0,           // Change the border width
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                ),
              ),),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:_updateText,
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
