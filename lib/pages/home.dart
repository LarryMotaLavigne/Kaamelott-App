import 'package:K/components/kCard.dart';
import 'package:K/data.dart';
import 'package:K/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  var data = Data.getData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(Variables.appTitle),
              flexibleSpace: Image(
                image: AssetImage(Variables.appBarImage),
                fit: BoxFit.cover,
              ),
              backgroundColor: Variables.appBarColor,
            ),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: double.maxFinite,
                            child: KCard(data, index),
                          );
                        }),
                  ),
                ],
              ),
            )));
  }
}
