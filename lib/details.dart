import 'dart:collection';

import 'package:flutter/material.dart';



class Details extends StatelessWidget {
    Details({Key? key, required this.name ,required this.address, required this.list}) :super(key: key);

  String name;
  String address;
  Map list;
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
      body:
            ListView(
              children: List.generate(list.length, 
              (index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Name:",style: TextStyle(
                        fontSize: 20
                      )),
                      Text(list.values.toList(growable: false)[index].toString(),style: const TextStyle(
                        fontSize: 20
                      )),
                      const Text("Address:",style: TextStyle(
                        fontSize: 20
                      )),
                      Text(list.keys.toList(growable: false)[index].toString(),style: const TextStyle(
                        fontSize: 20
                      )),
                    ],
                  )
          );
              }
              ),
            )
            
          
    );
  }
  

}
