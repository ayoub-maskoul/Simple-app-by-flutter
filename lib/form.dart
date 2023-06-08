import 'package:flutter/material.dart';
import 'package:project/details.dart';


class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final _adderssController = TextEditingController();

  
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
              MyButton(context)
            ],
          ),
        ),
        )
      ;
  }

  OutlinedButton MyButton(BuildContext context) {
    return OutlinedButton(
          child: Text("Sumbit"),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context){
                return Details(name: _nameController.text,address: _adderssController.text);
              }
              ),
              
              );
          },
          style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
          );
  }
}