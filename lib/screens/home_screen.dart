import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sailing_rules/blocs/signals_selection/signals_selection_cubit.dart';
import 'package:sailing_rules/models/race_flag_model.dart';
import 'package:sailing_rules/screens/results_screen.dart';

import '../utilities/responsive_adaptive_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();
  final RaceFlagModelClass raceFlagModelClass = RaceFlagModelClass();

  var orientation, size, height, width;
  double fontSizeValue = 0.0;
  double classFontSize = 0.0;
  double appBarTitleFontSize = 0.0;
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double classImageHeight = 0.0;
  double classImageWidth = 0.0;

  final signalsNames = <String>[
    'postponement',
    'abandonment',
    'preparatory',
    'recall',
    'changingNextLeg',
    'other',
  ];
  final signalsTitles = <String>[
    'Postponement Signals',
    'Abandonment Signals',
    'Preparatory Signals',
    'Recall Signals',
    'Changing the Next Leg',
    'Other Signals',
  ];
  final signalsImage = <String>[
    'lib/assets/images/postponement_signals/ap_with_signals.png',
    'lib/assets/images/abandonment_signals/n_with_signals.png',
    'lib/assets/images/preparatory_signals/p_with_signals.png',
    'lib/assets/images/recall_signals/x_with_signals.png',
    'lib/assets/images/changing_next_leg/c_with_signals.png',
    'lib/assets/images/other_signals/l_with_signals.png',
  ];

  @override
  Widget build(BuildContext context) {
    String flagTest = raceFlagModelClass.raceFlagImagePreparatorySignals[0];

    responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
    responsiveAdaptiveClass.size = MediaQuery.of(context).size;
    responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
    responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
    debugPrint(
        'HomeScreen orientation: ${MediaQuery.of(context).orientation}\nHeight: ${responsiveAdaptiveClass.size.height}\nWidth: ${responsiveAdaptiveClass.size.width}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.description_outlined,
              // color: Colors.white,
            ),
            // iconSize: 40.0,
            onPressed: () {
              // context.read<SignalsSelectionCubit>().setSignalsSelectionChoice('postponement');
              context.go('/definition_screen');
            }),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              // color: Colors.white,
            ),
            onPressed: () => context.go('/settings_screen'),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Sailing Racing Signals',
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
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 1.0,
                image: AssetImage('lib/assets/images/ocean_background.png'),
                fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: signalsTitles.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<SignalsSelectionCubit>()
                        .setSignalsSelectionChoice(signalsNames[index]);
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultsScreen(),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3.0, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                  child: Container(
                    height: 150.0, // Adjust the height as needed
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(35.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                signalsImage[index], // Replace with your actual image path
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),

                        // Dark blue gradient with white text
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF2D9596),
                                  Color(0xFF265073),
                                ],
                                stops: [0.0, 0.9],
                              ),
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(35.0),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  signalsTitles[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: responsiveAdaptiveClass.classFontSize =
                                        responsiveAdaptiveClass.selectFontSize(1.0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      // fixedSize: Size((width * 0.75), (height / 5.5)),
                      fixedSize: Size(
                          responsiveAdaptiveClass.elevatedButtonWidth =
                              responsiveAdaptiveClass.selectElevatedButtonWidth(),
                          responsiveAdaptiveClass.elevatedButtonHeight =
                              responsiveAdaptiveClass.selectElevatedButtonHeight()),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 3.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      backgroundColor: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                        child: Image.asset(
                          signalsImage[index],
                          height: classImageHeight =
                              responsiveAdaptiveClass.selectClassImageHeight(),
                          width: classImageWidth = responsiveAdaptiveClass.selectClassImageWidth(),
                          fit: BoxFit.fill,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        signalsTitles[index],
                        // overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        // softWrap: true,
                        style: TextStyle(
                            fontSize: responsiveAdaptiveClass.classFontSize =
                                responsiveAdaptiveClass.selectFontSize(),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
 */
