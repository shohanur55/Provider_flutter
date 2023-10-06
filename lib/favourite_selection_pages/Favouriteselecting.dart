import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/favourite_selection_pages/Selectedpage.dart';
import 'package:provider_flutter/list_provider.dart';

class Favouriteselecting extends StatefulWidget {
  const Favouriteselecting({Key? key}) : super(key: key);

  @override
  State<Favouriteselecting> createState() => _FavouriteselectionState();
}

class _FavouriteselectionState extends State<Favouriteselecting> {
  @override
  Widget build(BuildContext context) {
   final favourite = Provider.of<Favouriteselection>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Favourite page"),
        toolbarHeight: 80,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Selectedpage(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.favorite,
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {

          return ListTile(
            onTap: () {

           favourite.itemselection(index);

            },
            title: Text(
              "Text No ${index}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            trailing:

           Consumer<Favouriteselection>(
             builder: (context, value, child) {
               return  Icon(

                   value.selecteditem.contains(index)? Icons.favorite : Icons.favorite_border_outlined, size: 40,
                   color: value.selecteditem.contains(index)? Colors.red : Colors.black);
             }

           ),


            );
        },
      ),
    ));
  }
}
