import 'package:flutter/material.dart';
import 'package:obesity_dashboard/screens/obesity_dashboard/controller/obesity_dashboard_controller.dart';
import 'package:obesity_dashboard/screens/obesity_dashboard/screen/obesity_dashboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ObesityDashboardController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: ObesityDashboard());
  }
}
