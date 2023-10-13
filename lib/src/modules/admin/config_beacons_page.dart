import 'package:beacons_school/initial_page.dart';
// import 'package:beacons_school/src/global/config/school_colors.dart';
import 'package:beacons_school/src/global/config/school_style.dart';
// import 'package:beacons_school/src/global/widgets_utils/button_general.dart';
import 'package:beacons_school/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:beacons_school/src/global/widgets_utils/my_button.dart';
import 'package:beacons_school/src/global/widgets_utils/textfield_general.dart';
import 'package:beacons_school/src/global/provider/config_beacons_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigBeaconsPage extends StatefulWidget {
  const ConfigBeaconsPage({Key? key, this.isConfig = false}) : super(key: key);
  final bool isConfig;

  static const String route = '/confg_beacons_page';

  @override
  State<ConfigBeaconsPage> createState() => _ConfigBeaconsPageState();
}

class _ConfigBeaconsPageState extends State<ConfigBeaconsPage> {
  late ConfigBeaconsProvider configBeaconsProvider;

  @override
  Widget build(BuildContext context) {
    configBeaconsProvider = Provider.of<ConfigBeaconsProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: configBeaconsProvider.loadData
          ? Center(
              child: circularProgressColors(),
            )
          : body(),
      /*Column(
              children: [
                if (widget.isConfig) ...[
                  Container(
                    width: sizeW,
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.only(top: sizeH * 0.08, left: sizeW * 0.05),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
                Expanded(
                  child: body(),
                )
              ],
            ),*/
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.03),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: sizeH * 0.1,
            // ),
            title(text: 'NIVEL 1'),
            textField(type: 1),
            SizedBox(
              height: sizeH * 0.02,
            ),
            title(text: 'NIVEL 2'),
            textField(type: 2),
            SizedBox(
              height: sizeH * 0.02,
            ),
            title(text: 'NIVEL 3'),
            textField(type: 3),
            SizedBox(
              height: sizeH * 0.02,
            ),
            title(text: 'NIVEL 4'),
            textField(type: 4),
            SizedBox(
              height: sizeH * 0.02,
            ),
            title(text: 'NIVEL 5'),
            textField(type: 5),
            SizedBox(
              height: sizeH * 0.02,
            ),
            buttonContinue()
          ],
        ),
      ),
    );
  }

  Widget title({required String text}) {
    return SizedBox(
      width: sizeW,
      child: Text(text,
          style: SchoolStyles().stylePrimary(
            size: sizeH * 0.02,
          )),
    );
  }

  Widget textField({required int type}) {
    TextEditingController controller = configBeaconsProvider.controller1;
    if (type == 2) {
      controller = configBeaconsProvider.controller2;
    }
    if (type == 3) {
      controller = configBeaconsProvider.controller3;
    }
    if (type == 4) {
      controller = configBeaconsProvider.controller4;
    }
    if (type == 5) {
      controller = configBeaconsProvider.controller5;
    }

    return SizedBox(
      width: sizeW,
      child: TextFieldGeneral(
        textEditingController: controller,
      ),
    );
  }

  Widget buttonContinue() {
    return configBeaconsProvider.loadSave
        ? Center(
            child: circularProgressColors(),
          )
        : MyButton(
            text: 'Continuar',
            onPressed: () => configBeaconsProvider.saveData(
                context: context, isConfig: widget.isConfig),
            /*backgroundColor: SchoolColors.primary,
            height: sizeH * 0.05,
            textStyle: SchoolStyles()
                .stylePrimary(size: sizeH * 0.025, fontWeight: FontWeight.bold),
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.2),*/
          );
  }
}
