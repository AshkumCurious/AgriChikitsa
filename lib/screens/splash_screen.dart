import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../routes/routes_name.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      const duration = Duration(milliseconds: 4000);
      final timmer = Timer(duration, () {
        Navigator.pushNamed(context, RouteName.homeRoute);
      });
      return () => timmer.cancel();
    }, []);
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 90,
          width: 280,
        ),
      ),
    );
  }
}
