import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_drawer/auth/auth_viewmodel.dart';
import 'package:responsive_drawer/base/injection.dart';
import 'package:responsive_drawer/common/constant.dart';
import 'package:responsive_drawer/graph/temp.dart';
import 'package:responsive_drawer/homePage/home_viewmodel.dart';
import 'package:responsive_drawer/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init(baseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // builder: BotToastInit(),
        // navigatorObservers: [BotToastNavigatorObserver()],
        // initialRoute: "/homeScreen",
        home: HomePage(),
        onGenerateRoute: Routes.generateRoute,
        navigatorKey: Injection.navigatorKey,
      ),
    );
  }
}
