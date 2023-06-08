import 'package:flutter/material.dart';
import 'package:project/details.dart';
import 'dart:collection';

import 'package:project/person.dart';


class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final _adderssController = TextEditingController();
  final _ageController = TextEditingController();

    var lst = [];
    
  @override
  void dispose(){
    
    _nameController.dispose();
    _ageController.dispose();
    _adderssController.dispose();
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Simple app"),
          centerTitle: true,
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
              const SizedBox(height: 30),
              SaveButton(),
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
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context){
              return Details(lst : lst);
                }
              ),
            );
        },
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        child: const Text("Detalis"),
      );
  }

  OutlinedButton SaveButton() {
    return OutlinedButton(
        onPressed: (){
          lst.add(Person(_nameController.text , int.parse(_ageController.text) ,_adderssController.text));
        },
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        child: const Text("Save"),
      );
  }
}