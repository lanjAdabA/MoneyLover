import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moneylover/firebase_options.dart';
import 'package:moneylover/provider/mulltiprovider.wrapper.dart';
import 'package:moneylover/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiproviderWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
            primaryColor: Colors.grey[200],
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              foregroundColor: Color.fromARGB(255, 48, 48, 50),
            )),
      ),
    );
  }
}
