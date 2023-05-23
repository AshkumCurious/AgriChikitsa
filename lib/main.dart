import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobchecklist/screens/auth.screen/signin.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';
import './screens/auth.screen/signin_view_model.dart';
import './services/socket_io.dart';
import './screens/tab.screens/hometab.screen/hometab_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInViewModel>(
          create: (_) => SignInViewModel(),
        ),
        ChangeNotifierProvider<SocketService>(
          create: (_) => SocketService(),
        ),
         ChangeNotifierProvider<HomeTabScreenViewModel>(
          create: (_) => HomeTabScreenViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Aluma',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       // routes: Routes().routes,
        home: SignInScreen(),
      ),
    );
  }
}
