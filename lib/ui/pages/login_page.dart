import 'package:flutter/material.dart';
import 'register_page.dart';
import '../../services/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email=TextEditingController();
  final pass=TextEditingController();
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: pass, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            ElevatedButton(
              onPressed: () async {
                bool ok=await AuthService.login(email.text, pass.text);
                if(ok){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                } else {
                  setState(()=>error="Credenciales inválidas");
                }
              }, child: Text("Login")
            ),
            Text(error, style: TextStyle(color: Colors.red)),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterPage()));
            }, child: Text("Registrar"))
          ]
        )
      )
    );
  }
}
