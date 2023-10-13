import 'package:beacons_school/initial_page.dart';
import 'package:beacons_school/src/global/config/school_colors.dart';
import 'package:beacons_school/src/global/config/school_style.dart';
import 'package:beacons_school/src/global/widgets_utils/button_general.dart';
import 'package:beacons_school/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:beacons_school/src/global/widgets_utils/my_button.dart';
import 'package:beacons_school/src/global/widgets_utils/textfield_general.dart';
import 'package:beacons_school/src/global/provider/config_parents_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigParentsPage extends StatefulWidget {
  const ConfigParentsPage({Key? key, this.isConfig = false}) : super(key: key);
  final bool isConfig;

  static const String route = '/config_parents_page';

  @override
  State<ConfigParentsPage> createState() => _ConfigBeaconsPageState();
}

class _ConfigBeaconsPageState extends State<ConfigParentsPage> {
  late ConfigParentsProvider configParentsProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ConfigParentsProvider(),
        child: Consumer<ConfigParentsProvider>(
            builder: (context, provider, child) {
          configParentsProvider = provider;

          return Scaffold(
            appBar: AppBar(),
            body: configParentsProvider.loadData
                ? Center(
                    child: circularProgressColors(),
                  )
                : body(),
            /*Column(
                    children: [
                      // if (widget.isConfig) ...[
                      //   Container(
                      //     width: sizeW,
                      //     alignment: Alignment.centerLeft,
                      //     margin: EdgeInsets.only(
                      //         top: sizeH * 0.08, left: sizeW * 0.05),
                      //     child: IconButton(
                      //       icon: Icon(Icons.arrow_back_ios,
                      //           color: SchoolColors.primary,
                      //           size: sizeH * 0.03),
                      //       onPressed: () {
                      //         Navigator.of(context).pop();
                      //       },
                      //     ),
                      //   ),
                      // ],
                      Expanded(
                        child: body(),
                      )
                    ],
                  ),*/
          );
        }));
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(text: 'NOMBRE DEL PADRE'),
          textField(type: 1),
          SizedBox(
            height: sizeH * 0.02,
          ),
          title(text: 'NOMBRE DEL HIJ@'),
          textField(type: 2),
          SizedBox(
            height: sizeH * 0.05,
          ),
          buttonContinue()
        ],
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
    TextEditingController controller = configParentsProvider.controller1;
    if (type == 2) {
      controller = configParentsProvider.controller2;
    }

    return SizedBox(
      width: sizeW,
      child: TextFieldGeneral(
        textEditingController: controller,
      ),
    );
  }

  Widget buttonContinue() {
    return configParentsProvider.loadSave
        ? Center(
            child: circularProgressColors(),
          )
        : MyButton(
            text: 'Continuar',
            onPressed: () => configParentsProvider.saveData(
                context: context, isConfig: widget.isConfig),
            // backgroundColor: SchoolColors.primary,
            // height: sizeH * 0.05,
            // textStyle: SchoolStyles()
            //     .stylePrimary(size: sizeH * 0.025, fontWeight: FontWeight.bold),
            // margin: EdgeInsets.symmetric(horizontal: sizeW * 0.2),
          );
  }
}
