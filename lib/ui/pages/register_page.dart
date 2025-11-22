import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState()=>_RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final name=TextEditingController();
  final email=TextEditingController();
  final pass=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children:[
            TextField(controller: name, decoration: InputDecoration(labelText: "Nombre")),
            TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: pass, decoration: InputDecoration(labelText: "Password"), obscureText:true),
            ElevatedButton(
              onPressed: () async {
                await AuthService.register(name.text, email.text, pass.text);
                Navigator.pop(context);
              }, 
              child: Text("Registrar")
            )
          ]
        )
      )
    );
  }
}
