import 'package:flutter/material.dart';
import 'package:project/details.dart';
import 'dart:collection';

import 'package:project/person.dart';


class Update extends StatefulWidget {
    Update( this.lst, this.index, {super.key});

  List lst;
  int index;
  @override
  // ignore: no_logic_in_create_state
  State<Update> createState() => _UpdateState(lst, index);
}


class _UpdateState extends State<Update> {
  
    _UpdateState(this.lst,  this.index);
  
  TextEditingController _nameController = TextEditingController();
  TextEditingController _adderssController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  
  

    List lst;
    int index;
    
    @override
void initState() {
  super.initState();
    _nameController.text = lst[index].name;
    _adderssController.text = lst[index].address;
    _ageController.text = lst[index].age.toString();
}
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Update"),
          
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const  InputDecoration(
                  labelText: "Age",
                  errorStyle: TextStyle(color: Colors.red),
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _adderssController,
                decoration: const InputDecoration(
                  labelText: "Address",
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 20),
              DetailsButton(context),
            ],
          ),
        ),
        )
      ;
  }

  OutlinedButton DetailsButton(BuildContext context) {
    return OutlinedButton(
        onPressed: (){
          lst[index] = Person(_nameController.text, int.parse(_ageController.text), _adderssController.text);
          Navigator.pop( context, MaterialPageRoute( builder: (context) => Details(list : lst)));
          
        },
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        child: const Text("Update"),
      );
  }


}