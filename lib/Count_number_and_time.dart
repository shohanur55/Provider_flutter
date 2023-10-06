import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/list_provider.dart';
class Count_number_and_time extends StatefulWidget {
  const Count_number_and_time({Key? key}) : super(key: key);

  @override
  State<Count_number_and_time> createState() => _Count_number_and_timeState();
}

class _Count_number_and_timeState extends State<Count_number_and_time> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      final times=Provider.of<Watchingtime>(context,listen: false);
      times.timing();
      final counting=Provider.of<CountNumber>(context,listen: false);
      counting.counting();


    });
  }
  @override
  Widget build(BuildContext context) {
print("build 1"); //listen false use korle ata print hobe nah
//listen true korle sob print hobe

    final times=Provider.of<Watchingtime>(context,listen: false);
    final counting=Provider.of<CountNumber>(context,listen: false);

print("build 2");//listen false use korle ata print hobe nah
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Count number and time"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountNumber>(builder: (context, CountNumbe, child){
              print("build in consumer part");
              //listen false use korle ata print hobe.karon only consumer part print hoy
     return Text(CountNumbe.value.toString(),style: TextStyle(fontSize: 40),);
      }

       ),

      Consumer<Watchingtime>(
          builder: (context, Watchingtime, child) {
          return Text(DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString(),

            style: TextStyle(fontSize: 50),);
          }
      ),


          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
              times.timing();
             counting.counting();
        },child: Icon(Icons.add),
      ),
    ));

  }
}
