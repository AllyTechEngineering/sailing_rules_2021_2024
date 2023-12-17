// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../models/race_flag_model.dart';
// import '../utilities/responsive_adaptive_class.dart';
//
// class PreparatorySignalsScreen extends StatefulWidget {
//   const PreparatorySignalsScreen({super.key});
//
//   @override
//   State<PreparatorySignalsScreen> createState() => _PreparatorySignalsScreenState();
// }
//
// class _PreparatorySignalsScreenState extends State<PreparatorySignalsScreen> {
//   final ResponsiveAdaptiveClass responsiveAdaptiveClass = ResponsiveAdaptiveClass();
//   final RaceFlagModelClass raceFlagModelClass = RaceFlagModelClass();
//
//   var orientation, size, height, width;
//   double fontSizeValue = 0.0;
//   double classFontSize = 0.0;
//   double appBarTitleFontSize = 0.0;
//   double elevatedButtonWidth = 0.0;
//   double elevatedButtonHeight = 0.0;
//   double classImageHeight = 0.0;
//   double classImageWidth = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     String flagTest = raceFlagModelClass.raceFlagImagePreparatorySignals[0];
//
//     responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
//     responsiveAdaptiveClass.size = MediaQuery.of(context).size;
//     responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
//     responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
//     debugPrint(
//         'HomeScreen orientation: ${MediaQuery.of(context).orientation}\nHeight: ${responsiveAdaptiveClass.size.height}\nWidth: ${responsiveAdaptiveClass.size.width}');
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.description_outlined,
//             // color: Colors.white,
//           ),
//           // iconSize: 40.0,
//           onPressed: () => context.go('/definition_screen'),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               // color: Colors.white,
//             ),
//             onPressed: () => context.go('/settings_screen'),
//           ),
//         ],
//         centerTitle: true,
//         title: Text(
//           'Racing Signals - Postponement',
//           style: TextStyle(
//               fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
//                   responsiveAdaptiveClass.selectAppBarTitleFontSize()),
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('lib/assets/images/ocean_background.png'),
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 opacity: 1.0,
//                 image: AssetImage('lib/assets/images/ocean_background.png'),
//                 fit: BoxFit.cover)),
//         child: ListView.builder(
//           itemCount: raceFlagModelClass.raceFlagImagePostponementSignals.length,
//           itemBuilder: (context, index) => Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     final snackBar = SnackBar(
//                       duration: Duration(seconds: 4),
//                       content: Text(
//                         raceFlagModelClass.raceFlagExplanationTextPostponementSignals[index],
//                         style: TextStyle(fontSize: 30.0),
//                       ),
//                     );
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     elevation: 10.0,
//                     padding: EdgeInsets.zero,
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 3.0, style: BorderStyle.solid),
//                       borderRadius: BorderRadius.circular(35.0),
//                     ),
//                   ),
//                   child: Container(
//                     height: 150.0, // Adjust the height as needed
//                     width: double.infinity,
//                     child: Row(
//                       children: [
//                         // White half with local image
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.horizontal(
//                                 left: Radius.circular(35.0),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset(
//                                 raceFlagModelClass.raceFlagImagePostponementSignals[
//                                     index], // Replace with your actual image path
//                                 fit: BoxFit.scaleDown,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         // Dark blue gradient with white text
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                                 colors: [
//                                   Colors.blue.shade300,
//                                   Colors.blue.shade900,
//                                 ],
//                                 stops: [0.0, 1.0],
//                               ),
//                               borderRadius: BorderRadius.horizontal(
//                                 right: Radius.circular(35.0),
//                               ),
//                             ),
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   raceFlagModelClass.raceFlagTextPostponementSignals[index],
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
