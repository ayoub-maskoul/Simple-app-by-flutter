import 'package:flutter/material.dart';
import 'package:project/details.dart';
import 'dart:collection';


class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final _adderssController = TextEditingController();

  final Map<String, String> listPer = HashMap();
  @override
  void dispose(){
    
    _nameController.dispose();
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
                controller: _adderssController,
                decoration: const InputDecoration(
                  labelText: "Address",
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30),
              MyButtonSave(context),
              const SizedBox(height: 20),
              MyButton(context),
            ],
          ),
        ),
        )
      ;
  }
  // ignore: non_constant_identifier_names
  OutlinedButton MyButton(BuildContext context) {
    return  OutlinedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context){
                return Details(list: listPer,);
                  }
                ),
              );
          },
          style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
          child: const Text("Detalis"),
        );
  }
  // ignore: non_constant_identifier_names
  OutlinedButton MyButtonSave(BuildContext context) {
    return OutlinedButton(
          onPressed: (){
            listPer.addAll({_nameController.text : _adderssController.text});
          },
          style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
          child: const Text("Save"),
        );
  }

}
