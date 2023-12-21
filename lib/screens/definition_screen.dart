import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import '../models/race_flag_model.dart';
import '../utilities/responsive_adaptive_class.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({super.key});

  @override
  State<DefinitionScreen> createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();

  dynamic orientation, size, height, width;
  double fontSizeValue = 0.0;
  double classFontSize = 0.0;
  double appBarTitleFontSize = 0.0;
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double classImageHeight = 0.0;
  double classImageWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
    responsiveAdaptiveClass.size = MediaQuery.of(context).size;
    responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
    responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
    debugPrint(
        'HomeScreen orientation: ${MediaQuery.of(context).orientation}\nHeight: ${responsiveAdaptiveClass.size.height}\nWidth: ${responsiveAdaptiveClass.size.width}');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
            ),
            onPressed: () => context.go('/'),
          ),
          centerTitle: true,
          title: Text(
            'FAQ',
            style: TextStyle(
                fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
                    responsiveAdaptiveClass.selectAppBarTitleFontSize(1.0)),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/ocean_background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () => context.go('/settings_screen'),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 1.0,
                  image: AssetImage('lib/assets/images/ocean_background.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Sailboat Racing Signals are explained in the 2021-2024 Racing Rules of Sailing.\nThe signals are derived from International Flags and Pennants.\nThe rules assign various meanings and uses for each of the flags.\nGo back to the home screen to find details about signals used in sailboat racing.',
                          style: TextStyle(
                              fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
                                  responsiveAdaptiveClass.selectAppBarTitleFontSize(1.0),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.horizontal(
                      //     left: Radius.circular(35.0),
                      //   ),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'lib/assets/images/ICS-flags.png', // Replace with your actual image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
