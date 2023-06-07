import 'package:flutter/material.dart';
import 'package:project/details.dart';


class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Simple app"),
          centerTitle: true,
        ),
        body: Center(
          child: OutlinedButton(
            child: Text("Sumbit"),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context){
                  return Details();
                }
                ),
                
                );
            },
            style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
            )
          ),
        )
      ;
  }
}