import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/signals_data/signals_data_cubit.dart';
import '../blocs/signals_selection/signals_selection_cubit.dart';
// import '../models/race_flag_model.dart';
import '../utilities/responsive_adaptive_class.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();

  var orientation, size, height, width;
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
    return BlocBuilder<SignalsSelectionCubit, SignalsSelectionState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
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
              textLabel(),
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
            child: BlocBuilder<SignalsDataCubit, SignalsDataState>(
              builder: (context, state) {
                if (state is LoadingSignalsDataState) {
                  debugPrint('in results if LoadingSignalsDataState and showing state: $state');
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorSignalsDataState) {
                  return Center(
                    child: Text(
                      'File Error',
                      style: TextStyle(
                          fontSize: responsiveAdaptiveClass.classFontSize =
                              responsiveAdaptiveClass.selectFontSize(1.0),
                          color: Colors.redAccent),
                    ),
                  );
                } else if (state is LoadedSignalsDataState) {
                  final signalsResultsListValue = state.loadedSignalsData;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: signalsResultsListValue.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              final snackBar = SnackBar(
                                duration: Duration(seconds: 4),
                                content: Text(
                                  signalsResultsListValue[index].description,
                                  style: const TextStyle(fontSize: 30.0),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 3.0, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                            ),
                            child: Container(
                              height: 150.0, // Adjust the height as needed
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(35.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          signalsResultsListValue[index]
                                              .image, // Replace with your actual image path
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Dark blue gradient with white text
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xFF2D9596),
                                            Color(0xFF265073),
                                          ],
                                          stops: [0.0, 1.0],
                                        ),
                                        borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(35.0),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              signalsResultsListValue[index].title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: responsiveAdaptiveClass.classFontSize =
                                                    responsiveAdaptiveClass.selectFontSize(1.0),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              signalsResultsListValue[index].description,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: responsiveAdaptiveClass.classFontSize =
                                                    responsiveAdaptiveClass.selectFontSize(1.0),
                                                fontWeight: FontWeight.bold,
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
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        );
      },
    );
  }

  ///6448758150
  String textLabel() {
    /*
      postponement,
  abandonment,
  preparatory,
  recall,
  changingNextLeg,
  other,
     */
    String tempValue = context.watch<SignalsSelectionCubit>().state.signalsSelectionChoice.name;
    // debugPrint('This is a test of printing the DataModel toString: $dataModel');
    if (tempValue == 'postponement') {
      tempValue = 'Postponement Signals';
    } else if (tempValue == 'abandonment') {
      tempValue = 'Abandonment Signals';
    } else if (tempValue == 'preparatory') {
      tempValue = 'Preparatory Signals';
    } else if (tempValue == 'recall') {
      tempValue = 'Recall Signals';
    } else if (tempValue == 'changingNextLeg') {
      tempValue = 'Change Next Leg Signals';
    } else if (tempValue == 'other') {
      tempValue = 'Other Signals';
    }
    return tempValue;
  }
}
// child: ListView.builder(
// itemCount: raceFlagModelClass.raceFlagImagePostponementSignals.length,
// itemBuilder: (context, index) => Padding(
// padding: EdgeInsets.all(8.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// ElevatedButton(
// onPressed: () {
// final snackBar = SnackBar(
// duration: Duration(seconds: 4),
// content: Text(
// raceFlagModelClass.raceFlagExplanationTextPostponementSignals[index],
// style: TextStyle(fontSize: 30.0),
// ),
// );
// ScaffoldMessenger.of(context).showSnackBar(snackBar);
// },
// style: ElevatedButton.styleFrom(
// elevation: 10.0,
// padding: EdgeInsets.zero,
// shape: RoundedRectangleBorder(
// side: BorderSide(width: 3.0, style: BorderStyle.solid),
// borderRadius: BorderRadius.circular(35.0),
// ),
// ),
// child: Container(
// height: 150.0, // Adjust the height as needed
// width: double.infinity,
// child: Row(
// children: [
// Expanded(
// child: Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.horizontal(
// left: Radius.circular(35.0),
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Image.asset(
// raceFlagModelClass.raceFlagImagePostponementSignals[
// index], // Replace with your actual image path
// fit: BoxFit.scaleDown,
// ),
// ),
// ),
// ),
//
// // Dark blue gradient with white text
// Expanded(
// child: Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.centerLeft,
// end: Alignment.centerRight,
// colors: [
// Colors.blue.shade300,
// Colors.blue.shade900,
// ],
// stops: [0.0, 1.0],
// ),
// borderRadius: BorderRadius.horizontal(
// right: Radius.circular(35.0),
// ),
// ),
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// raceFlagModelClass.raceFlagTextPostponementSignals[index],
// style: TextStyle(
// color: Colors.white,
// fontSize: responsiveAdaptiveClass.classFontSize =
// responsiveAdaptiveClass.selectFontSize(),
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ),
