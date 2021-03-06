import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/core/hive_boxes/boxes.dart';
import 'package:carvajal/features/models/user.dart';
import 'package:carvajal/ui/componets/custom_alerts.dart';
import 'package:carvajal/ui/out_products/out_products.dart';
import 'package:carvajal/ui/register/register_ui.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/carvajal.jpg',
                  fit: BoxFit.fitWidth,
                  width: size.width,
                  height: size.width * 0.3,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  enabled: true,
                  decoration: const InputDecoration(
                      labelText: 'Usuario',
                      focusColor: Color(0xFF005a9a),
                      contentPadding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 65,
                        right: 20,
                      )),
                  controller: userController,
                  // validator: validator,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  maxLines: 1,
                  enabled: true,
                  decoration: const InputDecoration(
                      labelText: 'Contrase??a',
                      focusColor: ColorsApp.blue,
                      contentPadding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 65,
                        right: 20,
                      )),
                  controller: userController,
                  // validator: validator,
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const OurProductsUI()),
                    );
                  },
                  child: const Text('Ingresar'),
                  style: ElevatedButton.styleFrom(
                      primary: ColorsApp.blue,
                      textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                ElevatedButton(
                  onPressed: () async{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterUI()),
                    );
                  },
                  child: const Text('Registrarme'),
                  style: ElevatedButton.styleFrom(
                      primary: ColorsApp.blue,
                      textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addUser(User user) async{
    final box = Boxes.getUsers();
    box.add(user);
    box.put(user.id, user);
  }

  Future searchUser(String name) async{
    final box = Boxes.getUsers();
    if(box.get(name) != null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OurProductsUI()),
      );
    }else{
      CustomAlerts(context: context).showTextDialog('Usuario no encontrado');
    }
  }

}