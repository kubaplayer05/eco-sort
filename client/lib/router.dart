import 'package:client/screens/home.dart';
import 'package:client/screens/recycling_assistant.dart';
import 'package:client/screens/recycling_categories/bio_details.dart';
import 'package:client/screens/recycling_categories/glass_details.dart';
import 'package:client/screens/recycling_categories/mixed_detailes.dart';
import 'package:client/screens/recycling_categories/paper_details.dart';
import 'package:client/screens/recycling_categories/plastic_details.dart';
import 'package:client/screens/search.dart';
import 'package:client/screens/semantic_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute getTransitionGoRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: pageBuilder(context, state),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    ),
  );
}

final router = GoRouter(routes: [
  getTransitionGoRoute(
      path: "/", pageBuilder: (context, state) => const HomeScreen()),
  getTransitionGoRoute(
      path: "/recycling-categories/paper",
      pageBuilder: (context, state) => const PaperDetails()),
  getTransitionGoRoute(
      path: "/recycling-categories/plastic",
      pageBuilder: (context, state) => const PlasticDetails()),
  getTransitionGoRoute(
      path: "/recycling-categories/glass",
      pageBuilder: (context, state) => const GlassDetails()),
  getTransitionGoRoute(
      path: "/recycling-categories/bio",
      pageBuilder: (context, state) => const BioDetails()),
  getTransitionGoRoute(
      path: "/recycling-categories/mixed",
      pageBuilder: (context, state) => const MixedDetails()),
  getTransitionGoRoute(
      path: "/recycling-categories",
      pageBuilder: (context, state) => const Placeholder()),
  getTransitionGoRoute(
      path: "/search", pageBuilder: (context, state) => const SearchScreen()),
  getTransitionGoRoute(
      path: "/search/:value",
      pageBuilder: (context, state) {
        final productName = state.pathParameters['value']!;
        return SemanticSearchScreen(productName: productName);
      }),
  getTransitionGoRoute(
      path: "/recycling-assistant",
      pageBuilder: (context, state) => const RecyclingAssistantScreen())
]);
