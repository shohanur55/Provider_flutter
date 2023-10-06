import 'package:flutter/material.dart';

class providerstateless extends StatelessWidget {
  const providerstateless({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    ValueNotifier<int> _add=ValueNotifier<int>(0);

    ValueNotifier<bool> toggle=ValueNotifier<bool>(true);
    return  SafeArea(child: Scaffold(
      body: Center(

        child: Column(
          children: [

            ValueListenableBuilder(
              valueListenable: _add,
              builder: (context, values, child) {
                return   Text(_add.value.toString(),//_add oi use korte hobe
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),);
              },
            ),

           ValueListenableBuilder(
             valueListenable: toggle,
             builder: (context, value, child) {
             return  Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: TextField(
                   style: TextStyle(fontSize: 25,),
                   obscureText: toggle.value,
                   obscuringCharacter: '*',
                   decoration: InputDecoration(
                     labelStyle: TextStyle(color: Colors.green,fontSize: 30),
                     hintText: "Password",
                     labelText: "Give your password",

                     suffix: GestureDetector(
                         onTap: (){
                           if(toggle==true){
                             toggle.value=!toggle.value;
                           }else{
                             toggle.value=!toggle.value;
                           }
                           print(toggle);
                         },
                         child: Icon(toggle.value?Icons.visibility_off:Icons.visibility,size: 30,)),

                     border: OutlineInputBorder(
                       gapPadding:2,
                       borderRadius: BorderRadius.all(Radius.circular(15)),
                     ),
                   ),
                 ),
               );
             }

           ),

          ],
        )



      ),

floatingActionButton: FloatingActionButton(
  onPressed: (){
    _add.value++;

  },
  child: Icon(Icons.add,size: 40,),
),


    ));
  }
}
