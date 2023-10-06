import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/list_provider.dart';
class Selectedpage extends StatefulWidget {
  const Selectedpage({Key? key}) : super(key: key);

  @override
  State<Selectedpage> createState() => _SelectedpageState();
}

class _SelectedpageState extends State<Selectedpage> {
  @override
  Widget build(BuildContext context) {
    final selected=Provider.of<Favouriteselection>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("selected page"),
        toolbarHeight: 70,
      ),
      body: ListView.builder(
        itemCount: selected.selecteditem.length,
        itemBuilder: (context, index) {
          return Consumer<Favouriteselection>(
              builder: (context, value, child) {
                return ListTile(


                    title: Text("Text No ${value.selecteditem[index]}",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),),

                    onTap: () {
                      value.selectionpageremove(
                          value.selecteditem[index]);
                    },
                    trailing: Icon(Icons.favorite,
                      color: Colors.red, size: 40,)


                );
              }
          );
        }

      ),
    ));
  }
}
