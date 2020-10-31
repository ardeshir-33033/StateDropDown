import 'package:flutter/material.dart';
import 'package:json_test/jsonData.dart';
import 'dart:convert';

import 'classes/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StateModel> all = List<StateModel>();
  String _selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String json = jsonEncode(jsonString);
    dynamic sts = jsonDecode(json);
    all = StateModel().listFromJson(sts);
    print(all[0].cities[0].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Expanded(
            child:  DropdownButtonHideUnderline(
              child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isDense: true,
                    hint: new Text('Select State'),
                    value: _selected,
                    onChanged: (String newValue) {
                      setState(() {
                        _selected = newValue;
                      });
                    },
                    items:  jsonString.map((Map map) {
                      return  DropdownMenuItem<String>(
                        value: map['id'].toString(),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(map['name']),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
