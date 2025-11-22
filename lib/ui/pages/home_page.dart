import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: Sidebar(),
      body: Center(child: Text("Bienvenido"))
    );
  }
}
