import 'package:flutter/material.dart';



class Details extends StatelessWidget {
    Details({Key? key, required this.name ,required this.address}) :super(key: key);

  String name;
  String address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalis Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ),
      body:  Center(
        child: Card(
        margin: const EdgeInsets.all(8),
        child:  SizedBox(
          width: 300,
          height: 100,

          child: Center(
            
            child: Column(
            children: [
            const Text("Name"),
            Text(name.toString()),
            const Text("Addresss"),
            Text(address.toString()),
        ]
            ),
        ),

      ),
      ),
      )
    );
  }
}