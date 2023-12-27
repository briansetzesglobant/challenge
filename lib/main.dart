import 'package:challenge/src/data/data_source/local/challenge_data_base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/config/route/app_routes.dart';
import 'src/core/resource/map_notification_service.dart';
import 'src/di.dart';

void main() async {
  final Di di = Di();
  di.injectDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  ChallengeDataBase challengeDataBase = Get.find<ChallengeDataBase>();
  await challengeDataBase.init();
  Firebase.initializeApp().then((value) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
