

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'basic2.dart';
import 'list_provider.dart';

class basic_provider extends StatefulWidget {
  const basic_provider({Key? key}) : super(key: key);

  @override
  State<basic_provider> createState() => _basic_providerState();
}

class _basic_providerState extends State<basic_provider> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Consumer<Numberprovider>(
        builder: (value,Numberprovider,child)=> Scaffold(
          body: Column(
            children: [

              Center(
                  child: Text(
                    Numberprovider.a.last.toString(),
                    style: TextStyle(fontSize: 30),
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: Numberprovider.a.length,
                  itemBuilder: (context, index) {
                    return Text(
                      Numberprovider.a[index].toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
              ElevatedButton(onPressed: ()
              {Navigator.push(context, MaterialPageRoute(builder: (context)=>basic2()));},
                  child: Text("second page")),
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
