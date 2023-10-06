import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';
class basic2 extends StatefulWidget {
  const basic2({Key? key}) : super(key: key);

  @override
  State<basic2> createState() => _basic2State();
}

class _basic2State extends State<basic2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Numberprovider>(
        builder:(context, Numberprovider, child) => Scaffold(
          body: Column(
            children: [
              Center(
                  child: Text(
                    Numberprovider.a.last.toString(),
                    style: TextStyle(fontSize: 30),
                  )),


              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Numberprovider.a.length,
                  itemBuilder: (context, index) {
                    return Text(
                      Numberprovider.a[index].toString()+" ",
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),


            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Numberprovider.add();

            },
            child: Icon(Icons.add),
          ),
        ),

      ),
    );
  }
}
