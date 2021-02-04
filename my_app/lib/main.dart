import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

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
            MyCustomForm(),
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

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //

  TextEditingController cityController = new TextEditingController();
  TextEditingController minCustomersController = new TextEditingController();
  TextEditingController maxCustomersController = new TextEditingController();
  TextEditingController averageCookiesController = new TextEditingController();

  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: cityController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Add new store location'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: minCustomersController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Minimum customers per hour (digits only)'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: maxCustomersController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Maximum customers per hour (digits only)'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: averageCookiesController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Average cookies per customer (digits only)'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(minCustomersController.text),
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                    );
                  },
                );
              },
              // Validate returns true if the form is valid, or false
              // otherwise.
              // if (_formKey.currentState.validate()) {
              //   // If the form is valid, display a Snackbar.
              //   Scaffold.of(context)
              //       .showSnackBar(SnackBar(content: Text('Processing Data')));
              // }
              // },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
