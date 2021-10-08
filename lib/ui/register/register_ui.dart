import 'package:carvajal/core/constants/colors_app.dart';
import 'package:carvajal/core/constants/document_constans.dart';
import 'package:carvajal/ui/register/widgets/drop_down_register.dart';
import 'package:flutter/material.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({Key? key}) : super(key: key);

  @override
  _RegisterUIState createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? personGener;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: ColorsApp.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
                    labelText: 'Nombre',
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
                maxLines: 1,
                enabled: true,
                decoration: const InputDecoration(
                    labelText: 'Apellido',
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
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                enabled: true,
                decoration: const InputDecoration(
                    labelText: 'Correo',
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
                maxLines: 1,
                enabled: true,
                decoration: const InputDecoration(
                    labelText: 'Dirección',
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
              const SizedBox(height: 10),
              CustomDropDownButton(
                  options: DocumentConstants.personGener
                      .map((e) => e.label)
                      .toList(),
                  onChange: (val) => setState(() => personGener = val),
                  value: personGener,
                  label: 'Género'),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                maxLines: 1,
                enabled: true,
                decoration: const InputDecoration(
                    labelText: 'Contraseña',
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
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Registrarme'),
                style: ElevatedButton.styleFrom(
                    primary: ColorsApp.blue,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
