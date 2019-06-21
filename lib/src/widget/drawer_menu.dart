import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //la imagen empieza desde arriba
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //se dejara el Container() vacio ya que no se desea poner informacion ahi
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bear.png'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: Text('pages2'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blue,
            ),
            title: Text('pages3'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text('Settings'),
            onTap: () {
              //en la pagina de settings ya no esta el item de regresar, no permite volver a la pagina anterior
              //ej, cuando uno tiene un login y ya no quiere que la persona pueda volver a esa pagina
              Navigator.pushReplacementNamed(context, 'settings');
            },
          ),
        ],
      ),
    );
    ;
  }
}
