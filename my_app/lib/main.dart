import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => TotalCookies(),
        child: MaterialApp(initialRoute: '/', routes: {
          '/': (context) => FirstScreen(),
          '/sales': (context) => SecondScreen(),
        })),
  );
}

class TotalCookies with ChangeNotifier {
  var hourlyTotals = [
    // 'All Stores Hourly Total',
    549,
    339,
    511,
    420,
    487,
    542,
    654,
    430,
    520,
    491,
    435,
    470,
    533,
    498,
    6879,
  ];

  void total() {
    for (var i = 0; i <= hourlyTotals.length - 1; i++) {
      hourlyTotals[i] += 1000;
    }
    notifyListeners();
  }
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

class SecondScreen extends StatelessWidget {
  static const String _title = 'Salmon Cookies Hourly Totals';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: Column(children: [
            new Container(child: Table()),
            new Container(child: MyCustomForm()),
          ]),
        ),
      ),
    );
  }
}

class Table extends StatelessWidget {
  Table({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5000.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                '',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '6am',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '7am',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '8am',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '9am',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '10am',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '11am',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '12pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '1pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '2pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '3pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '4pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '5pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '6pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                '7pm',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Daily Location Total',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Seattle')),
                DataCell(Text('303')),
                DataCell(Text('156')),
                DataCell(Text('293')),
                DataCell(Text('197')),
                DataCell(Text('305')),
                DataCell(Text('342')),
                DataCell(Text('381')),
                DataCell(Text('270')),
                DataCell(Text('269')),
                DataCell(Text('265')),
                DataCell(Text('226')),
                DataCell(Text('197')),
                DataCell(Text('263')),
                DataCell(Text('224')),
                DataCell(Text('3691')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Tokyo')),
                DataCell(Text('12')),
                DataCell(Text('9')),
                DataCell(Text('9')),
                DataCell(Text('18')),
                DataCell(Text('9')),
                DataCell(Text('14')),
                DataCell(Text('22')),
                DataCell(Text('18')),
                DataCell(Text('28')),
                DataCell(Text('25')),
                DataCell(Text('24')),
                DataCell(Text('13')),
                DataCell(Text('9')),
                DataCell(Text('6')),
                DataCell(Text('216')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Dubai')),
                DataCell(Text('133')),
                DataCell(Text('111')),
                DataCell(Text('116')),
                DataCell(Text('104')),
                DataCell(Text('92')),
                DataCell(Text('80')),
                DataCell(Text('131')),
                DataCell(Text('70')),
                DataCell(Text('115')),
                DataCell(Text('94')),
                DataCell(Text('63')),
                DataCell(Text('119')),
                DataCell(Text('133')),
                DataCell(Text('124')),
                DataCell(Text('1485')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Paris')),
                DataCell(Text('66')),
                DataCell(Text('49')),
                DataCell(Text('65')),
                DataCell(Text('49')),
                DataCell(Text('50')),
                DataCell(Text('56')),
                DataCell(Text('84')),
                DataCell(Text('48')),
                DataCell(Text('62')),
                DataCell(Text('60')),
                DataCell(Text('67')),
                DataCell(Text('73')),
                DataCell(Text('74')),
                DataCell(Text('87')),
                DataCell(Text('890')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Lima')),
                DataCell(Text('35')),
                DataCell(Text('14')),
                DataCell(Text('28')),
                DataCell(Text('52')),
                DataCell(Text('31')),
                DataCell(Text('50')),
                DataCell(Text('36')),
                DataCell(Text('24')),
                DataCell(Text('46')),
                DataCell(Text('47')),
                DataCell(Text('55')),
                DataCell(Text('68')),
                DataCell(Text('54')),
                DataCell(Text('57')),
                DataCell(Text('597')),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text('All Stores Hourly Total')),
                DataCell(Text('549')),
                DataCell(Text('339')),
                DataCell(Text('511')),
                DataCell(Text('420')),
                DataCell(Text('487')),
                DataCell(Text('542')),
                DataCell(Text('654')),
                DataCell(Text('430')),
                DataCell(Text('520')),
                DataCell(Text('491')),
                DataCell(Text('435')),
                DataCell(Text('470')),
                DataCell(Text('533')),
                DataCell(Text('498')),
                DataCell(Text('6879')),
              ],
            ),
          ],
        ),
      ),
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
          Container(
            width: 500.0,
            child: TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                  icon: Icon(Icons.send),
                  border: const OutlineInputBorder(),
                  hintText: 'Add new store location'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            width: 500.0,
            child: TextFormField(
              controller: minCustomersController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  icon: Icon(Icons.send),
                  border: const OutlineInputBorder(),
                  hintText: 'Minimum customers per hour (digits only)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            width: 500.0,
            child: TextFormField(
              controller: maxCustomersController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  icon: Icon(Icons.send),
                  border: const OutlineInputBorder(),
                  hintText: 'Maximum customers per hour (digits only)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Container(
            width: 500.0,
            child: TextFormField(
              controller: averageCookiesController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  icon: Icon(Icons.send),
                  border: const OutlineInputBorder(),
                  hintText: 'Average cookies per customer (digits only)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
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

// class DataTableWidget extends StatelessWidget {
//   final List<Map<String, String>> listOfColumns = [
//     { city: cityController.text,
//     6am: '',
//     7am: '',
//     8am: '',
//     9am: '',
//     10am: '',
//     11am: '',
//     12pm: '',
//     1pm: '',
//     2pm: '',
//     3pm: '',
//     4pm: '',
//     5pm: '',
//     6pm: '',
//     7pm: '',
//     dailyTotal: '',

//     }
//   ]
// }
