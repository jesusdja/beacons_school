import 'package:beacons_school/src/global/services/shared_preferences_local.dart';
import 'package:beacons_school/src/global/widgets_utils/my_button.dart';
import 'package:beacons_school/src/global/widgets_utils/my_input.dart';
import 'package:beacons_school/src/modules/admin/config_beacons_page.dart';
import 'package:beacons_school/src/modules/auth/register_page.dart';
import 'package:beacons_school/src/modules/parents/config_parents_page.dart';
import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final splashStatus = SharedPrefsLocal.statusSplash;

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
                      'Iniciar Sesión',
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
                          Expanded(
                            child: Column(
                              children: [
                                const MyInput(
                                  hintext: "Escribe tu email...",
                                  label: 'E-mail',
                                ),
                                const SizedBox(height: 25),
                                const MyInput(
                                  hintext: "Escribe tu contraseña...",
                                  label: 'Contraseña',
                                ),
                                const SizedBox(height: 25),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                        '¿Olvidaste tu contraseña?')),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                            onPressed: () {
                              SharedPrefsLocal.isLogged = true;
                              if (SharedPrefsLocal.statusSplash == 2) {
                                Navigator.pushReplacementNamed(
                                    context, ConfigBeaconsPage.route);
                              }
                              if (SharedPrefsLocal.statusSplash == 4) {
                                Navigator.pushReplacementNamed(
                                    context, ConfigParentsPage.route);
                              }
                            },
                            text: "Iniciar sesión",
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
                              const Text("¿No tienes una cuenta? "),
                              TextButton(
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const RegisterPage();
                                    }));
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
}
