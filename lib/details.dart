// ignore_for_file: no_logic_in_create_state

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:project/form.dart';
import 'package:project/update.dart';



class Details extends StatefulWidget {
  Details({Key? key, required this.list}) :super(key: key);
  
  List list;

  @override
  State<Details> createState() => _DetailsState(list);
}

class _DetailsState extends State<Details> {

    _DetailsState(this.list);
    List list;
    var lst =[];
    
  @override
  void initState() {
    super.initState();
    lst = list;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalis Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          ),
      ),
      body:
            ListView(
              children: List.generate(lst.length, 
              (index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Name:",style: TextStyle(
                        fontSize: 20
                      )),
                      Text(lst[index].name.toString(),style: const TextStyle(
                        fontSize: 20
                      )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Age:",style: TextStyle(
                        fontSize: 20
                      )),
                      
                      Text(lst[index].age.toString(),style: const TextStyle(
                        fontSize: 20
                      ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Address:",style: TextStyle(
                        fontSize: 20
                      )),
                      Text(lst[index].address.toString(),style: const TextStyle(
                        fontSize: 20
                      )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      IconButton(onPressed: () {
                        showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Delete'),
                                content: const Text('Are you sure?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, 'OK');
                                      lst.remove(lst[index]);
                                      Navigator.pushReplacement(
                                          context, 
                                          MaterialPageRoute(builder: (context){
                                            return Details(list:lst);
                                          }
                                          ),
                                        );
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                        
                      },
                        icon: const Icon(Icons.delete)),
                      const SizedBox(height: 20),
                      IconButton(onPressed: () {
                        
                          Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context){
                            return Update(lst,index);
                              }
                            ),
                          ).then((value) => lst = value);
                      },
                        icon: const Icon(Icons.edit))
                    ],
                  )
                );
              }
              ),
            )
            
          
    );
  }
}