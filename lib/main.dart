import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sailing_rules/blocs/signals_data/signals_data_cubit.dart';
import 'package:sailing_rules/blocs/signals_selection/signals_selection_cubit.dart';
import 'package:sailing_rules/repositories/signals_repository.dart';
import 'package:sailing_rules/screens/abandonment_signals_screen.dart';
import 'package:sailing_rules/screens/changing_next_leg_signals_screen.dart';
import 'package:sailing_rules/screens/definition_screen.dart';
import 'package:sailing_rules/screens/home_screen.dart';
import 'package:sailing_rules/screens/other_signals_screen.dart';
import 'package:sailing_rules/screens/postponement_signals_screen.dart';
import 'package:sailing_rules/screens/preparatory_signals_screen.dart';
import 'package:sailing_rules/screens/recall_signals_screen.dart';
import 'package:sailing_rules/screens/results_screen.dart';
import 'package:sailing_rules/screens/settings_screen.dart';
import 'package:sailing_rules/utilities/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'definition_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const DefinitionScreen();
          },
        ),
        GoRoute(
          path: 'results_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const ResultsScreen();
          },
        ),
        GoRoute(
          path: 'postponement_signals_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const PostponementSignalsScreen();
          },
        ),
        GoRoute(
          path: 'abandonment_signals_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const AbandonmentSignalsScreen();
          },
        ),
        GoRoute(
          path: 'preparatory_signals_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const PreparatorySignalsScreen();
          },
        ),
        GoRoute(
          path: 'recall_signals_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const RecallSignalsScreen();
          },
        ),
        GoRoute(
          path: 'changing_next_leg_signals_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const ChangingNextLegSignalsScreen();
          },
        ),
        GoRoute(
          path: 'other_signals_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const OtherSignalsScreen();
          },
        ),
        GoRoute(
          path: 'settings_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SignalsRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignalsSelectionCubit>(
            create: (context) => SignalsSelectionCubit(),
          ),
          BlocProvider<SignalsDataCubit>(
            create: (context) => SignalsDataCubit(
              signalsRepository: SignalsRepository(),
              signalsSelectionCubit: context.read<SignalsSelectionCubit>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          title: 'Sailing Racing Rules',
          theme: appTheme,
        ),
      ),
    );
  }
}
