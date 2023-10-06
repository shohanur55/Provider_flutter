import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Opacitychangingwithslider.dart';
import 'package:provider_flutter/basic_provider.dart';
import 'package:provider_flutter/favourite_selection_pages/Favouriteselecting.dart';

import 'Count_number_and_time.dart';
import 'favourite_selection_pages/ProviderInStateless.dart';
import 'list_provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Numberprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountNumber(),
        ),
        ChangeNotifierProvider(
          create: (context) => Watchingtime(),
        ),
        ChangeNotifierProvider(
          create: (context) => Sliderchanging(),
        ),
        ChangeNotifierProvider(
          create: (context) => Favouriteselection(),
        ),
        ChangeNotifierProvider(
          create: (context) => Themechanger(),
        ),
      ],
      builder: (context, child) {

        return Consumer <Themechanger>(
          builder: (context, value, child) {
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode:
              value.mytheme == "light" ? ThemeMode.light : ThemeMode.dark,

              theme: ThemeData(
                brightness: Brightness.light,
              ),

              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              home: Myhomepage(),
            );
          }

        );
      },
    );
    //it is used for single provider:------
    // return ChangeNotifierProvider(create: (context) => CountNumber(),
    //     child:  MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       home: Myhomepage(),
    //
    // ));
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => basic_provider()));
                },
                child: Text(
                  "basic provider",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Count_number_and_time()));
                },
                child: Text(
                  "count number and time",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Opacitychangingwithslider()));
                },
                child: Text(
                  "Opacity changing by slider",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Favouriteselecting()));
                },
                child: Text(
                  "Favourite selection",
                  style: TextStyle(fontSize: 30),
                )),   SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => providerstateless()));
                },
                child: Text(
                  "Provider in stateless",
                  style: TextStyle(fontSize: 30),
                )),



            Consumer<Themechanger>(builder: (context, values, child) {
              return RadioListTile(
                  title: const Text('light mode'),
                  value: "light",
                  groupValue: values.mytheme,
                  onChanged: (value) {
                    values.themechanger(value);
                  });
            }),



            Consumer<Themechanger>(builder: (context, values, child) {
              return RadioListTile(
                  title: const Text('dark mode'),
                  value: "dark",
                  groupValue: values.mytheme,
                  onChanged: (value) {
                    values.themechanger(value);
                  });
            }),
          ]),
        ),
      ),
    );
  }
}
