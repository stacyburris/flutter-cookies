import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => FirstScreen(),
    '/sales': (context) => SecondScreen(),
  }));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Salmon Cookies', style: TextStyle(fontSize: 38)),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        label: Text('Sales'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Powered for Mobile by Flutter',
                style: TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: RichText(
                text: TextSpan(
                  text:
                      'Visit us in our original Seattle location or at seven international stores! We serve freshly baked salmon cookies each day. Our cookies are prepared in-house by our friendly staff. Enjoy a cup of coffee on our terrace as you savor this delicious salmon-flavored dessert.\n',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 26.0,
                  ),
                ),
              ),
            ),
            new Container(
              child: Image(image: AssetImage('Images/salmon.png'), height: 300),
            ),
            new Container(
              child: RichText(
                text: TextSpan(
                  text:
                      'Our Merch store is opening soon. Don\'t miss the grand opening!\n',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 26.0,
                  ),
                ),
              ),
            ),
            new Container(
              child: Image(image: AssetImage('Images/shirt.jpg'), height: 350),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salmon Cookies', style: TextStyle(fontSize: 38)),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
