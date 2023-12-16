// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sailing_rules/blocs/signals_data/signals_data_cubit.dart';
// import 'package:sailing_rules/blocs/signals_selection/signals_selection_cubit.dart';
// import '../models/race_flag_model.dart';
// import '../utilities/responsive_adaptive_class.dart';
//
// class DataListScreen extends StatefulWidget {
//   const DataListScreen({super.key});
//
//   @override
//   State<DataListScreen> createState() => _DataListScreenState();
// }
//
// class _DataListScreenState extends State<DataListScreen> {
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
//     responsiveAdaptiveClass.orientation = MediaQuery.of(context).orientation;
//     responsiveAdaptiveClass.size = MediaQuery.of(context).size;
//     responsiveAdaptiveClass.height = responsiveAdaptiveClass.size.height;
//     responsiveAdaptiveClass.width = responsiveAdaptiveClass.size.width;
//     debugPrint(
//         'HomeScreen orientation: ${MediaQuery.of(context).orientation}\nHeight: ${responsiveAdaptiveClass.size.height}\nWidth: ${responsiveAdaptiveClass.size.width}');
//     return BlocBuilder<SignalsSelectionCubit, SignalsSelectionState>(
//       builder: (context, state) {
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             leading: IconButton(
//               icon: const Icon(
//                 Icons.description_outlined,
//                 // color: Colors.white,
//               ),
//               // iconSize: 40.0,
//               onPressed: () => context.go('/definition_screen'),
//             ),
//             actions: <Widget>[
//               IconButton(
//                 icon: const Icon(
//                   Icons.settings,
//                   // color: Colors.white,
//                 ),
//                 onPressed: () => context.go('/settings_screen'),
//               ),
//             ],
//             centerTitle: true,
//             title: Text(
//               'Race Signals',
//               style: TextStyle(
//                   fontSize: responsiveAdaptiveClass.appBarTitleFontSize =
//                       responsiveAdaptiveClass.selectAppBarTitleFontSize()),
//             ),
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('lib/assets/images/ocean_background.png'),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           body: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 opacity: 1.0,
//                 image: AssetImage('lib/assets/images/ocean_background.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               children: [
//                 BlocBuilder<SignalsDataCubit, SignalsDataState>(
//                   builder: (context, state) {
//                     if (state is LoadingSignalsDataState) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else if (state is ErrorSignalsDataState) {
//                       return Center(
//                         child: Text(
//                           'File Error',
//                           style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
//                         ),
//                       );
//                     } else if (state is LoadedSignalsDataState) {
//                       final signalsResultsListValue = state.signalsData;
//                       debugPrint('in data_list_screen showing results: $signalsResultsListValue');
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Title: ${signalsResultsListValue[0].title}'),
//                           Text('Description: ${signalsResultsListValue[0].description}'),
//                           Text('Image: ${signalsResultsListValue[0].image}'),
//                         ],
//                       );
//                     } else {
//                       return Container();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
