import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_flutter/list_provider.dart';

class Opacitychangingwithslider extends StatefulWidget {
  const Opacitychangingwithslider({Key? key}) : super(key: key);

  @override
  State<Opacitychangingwithslider> createState() => _OpacitychangingwithsliderState();
}

class _OpacitychangingwithsliderState extends State<Opacitychangingwithslider> {
  @override
  Widget build(BuildContext context) {
    final sliderr = Provider.of<Sliderchanging>(context, listen: false);
print("build");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Opacity change with slider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Sliderchanging>(
              builder: (context, Sliderchanging, child) {
                return Slider(
                    max: 1.0,
                    min: 0.0,
                    value: sliderr.value,
                    onChanged: (val) {
                      sliderr.changing(val);
                      print(val);
                    });
              },
            ),
            SizedBox(
              height: 30,
            ),



            Consumer<Sliderchanging>(
              builder: (context, value, child) {
              return Row(
              children: [



              Expanded(
              child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(sliderr.value),
              ),
              child: Center(child: Text("Container 1",style: TextStyle(fontSize: 30),)),
            ),
        ),


      Expanded(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(sliderr.value),
          ),
          child: Center(child: Text("Container 2",style: TextStyle(fontSize: 30),)),
        ),
      ),
      ],
    );
              }

            )
          ],
        ),
      ),
    ));
  }
}
