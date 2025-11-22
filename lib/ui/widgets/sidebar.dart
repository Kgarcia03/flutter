import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class Sidebar extends StatefulWidget{
  @override
  State<Sidebar> createState()=>_SidebarState();
}

class _SidebarState extends State<Sidebar>{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(AuthService.userName ?? ""),
            accountEmail: Text(AuthService.userEmail ?? "")
          ),
          ListTile(
            title: Text("Cerrar sesión"),
            onTap: () async {
              await AuthService.logout();
              Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
            }
          )
        ]
      )
    );
  }
}
