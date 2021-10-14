import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/features/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAlerts {
  CustomAlerts({required this.context});

  BuildContext context;

  Future<void> showMyDialog(Products _products) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalles del Producto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  _products.id!.toString(),
                  style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                ),
                Text(
                  _products.name!,
                  style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                ),
                Text(
                  _products.reference!,
                  style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                ),
                Text(
                  _products.inventory!.unit!,
                  style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                ),
                Text(
                  _products.inventory!.warehouse!.first.name!,
                  style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showAddDialog() async {
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar un Producto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(hintText: 'Id'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Nombre'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Description'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Agregar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showTextDialog(String msj) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar un Producto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  msj,
                  style: const TextStyle(color: ColorsApp.blue, fontSize: 16),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Agregar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
