import 'package:beacons_school/src/global/widgets_utils/my_input.dart';
import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';

import '../../global/widgets_utils/my_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String route = '/register_page';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: Colors.blueGrey,
                child: const Column(
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: SafeArea(
                    child: Container(
                      height: size.height - 200,
                      width: size.width,
                      decoration: boxDecoration(),
                      padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                      child: Column(
                        children: [
                          const Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  MyInput(
                                    hintext: "Escribe tu nombre completo...",
                                    label: 'Nombre',
                                  ),
                                  SizedBox(height: 15),
                                  MyInput(
                                    hintext: "Escribe tu email...",
                                    label: 'E-mail',
                                  ),
                                  SizedBox(height: 15),
                                  MyInput(
                                    hintext: "Escribe tu número telefónico...",
                                    label: 'Teléfono',
                                  ),
                                  SizedBox(height: 15),
                                  MyInput(
                                    hintext: "Escribe tu contraseña...",
                                    label: 'Contraseña',
                                  ),
                                  SizedBox(height: 15),
                                  // TextButton(
                                  //     onPressed: () {},
                                  //     child:
                                  //         const Text('¿Olvidaste tu contraseña?')),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                            onPressed: () {},
                            text: "Registrase",
                          ),
                          const SizedBox(height: 10),
                          // _Divider(),
                          // const SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     IconButton(
                          //         onPressed: () {}, icon: Logo(Logos.google)),
                          //     IconButton(
                          //         onPressed: () {},
                          //         icon: Logo(Logos.facebook_f)),
                          //     IconButton(
                          //         onPressed: () {}, icon: Logo(Logos.twitter))
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("¿Ya tienes una cuenta? "),
                              TextButton(
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Navigator.pop(context);
                                  },
                                  child: const Text("CLICK AQUÍ"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
          )
        ],
        color: Colors.white);
  }
}
/*
class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 1.5,
        )),
        SizedBox(width: 15),
        Text(
          "O",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 15),
        Expanded(
            child: Divider(
          thickness: 1.5,
        )),
      ],
    );
  }
}*/
