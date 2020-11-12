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
  String selectedState = '3';
  String selectedCity ;
  var selCity = 1;
  var selState = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String json = jsonEncode(jsonString);
    dynamic sts = jsonDecode(json);
    all = StateModel().listFromJson(sts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      isDense: true,
                      hint: Text('Select State'),
                      value: selectedState,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedState = newValue;
                          selState = int.parse(selectedState);
                        });
                      },
                      items: all.map(
                        (e) {
                          // selectedState = e.id;
                          return DropdownMenuItem(
                            value: e.id,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(e.name),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                      //
                      // items:  jsonString.map((Map map) {
                      //   return  DropdownMenuItem<String>(
                      //     value: map['id'].toString(),
                      //     child: Row(
                      //       children: [
                      //         Container(
                      //           margin: EdgeInsets.only(left: 10),
                      //           child: Text(map['name']),
                      //         )
                      //       ],
                      //     ),
                      //   );
                      // }).toList(),
                    )),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      isDense: true,
                      hint: Text('Select City'),
                      value: selectedCity,
                      onChanged: (String newValue1) {
                        setState(() {
                          selectedCity = newValue1;
                        });
                      },
                      items: all.firstWhere((element) => element.id == selState.toString()).cities.map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
                        );
                      }).toList(),
                      // items: jsonString.map((Map map) {
                      //   return DropdownMenuItem<String>(
                      //     value: map['id'].toString(),
                      //     child: Row(
                      //       children: [
                      //         Container(
                      //           margin: EdgeInsets.only(left: 10),
                      //           child: Text(map['name']),
                      //         )
                      //       ],
                      //     ),
                      //   );
                      // }).toList(),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
