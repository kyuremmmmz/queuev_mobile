import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/firebase_options.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/change_account_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/provider/FormProviders/qeue_provider.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/provider/QueueProvider/queue_provider.dart';
import 'package:queingapp/presentation/screens/auth/account/account_screen.dart';
import 'package:queingapp/presentation/screens/auth/account/change_password_screen.dart';
import 'package:queingapp/presentation/screens/auth/account/terms_and_conditions_screen.dart';
import 'package:queingapp/presentation/screens/auth/auth_wrapper.dart';
import 'package:queingapp/presentation/screens/auth/settings/settings_screen.dart';
import 'package:queingapp/presentation/screens/auth_checker.dart';
import 'package:queingapp/presentation/screens/home/home_screen.dart';
import 'package:queingapp/presentation/screens/home/qeue_reservation_screen.dart';
import 'package:queingapp/presentation/screens/home/qeue_status_screen.dart';
import 'package:queingapp/presentation/screens/home/qeueing_history_screen.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  di.init();
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.sl<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<ValidatorsProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<StorageProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<QrViewProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<QeueProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<QueueProvider>()),
        ChangeNotifierProvider(create: (_) => di.sl<ChangeAccountProvider>()),
      ],
      child: MaterialApp(
        routes: {
          '/home': (context) => const HomeScreen(),
          '/qeue': (context) => const QeueReservationScreen(),
          '/status': (context) => const QueueStatusScreen(),
          '/queing': (context) => const QeueingHistoryScreen(),
          '/account': (context) => const AccountScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/changePassword': (context) => const ChangePasswordScreen(),
          '/terms': (context) => const TermsAndConditionsScreen(),
          '/login': (context) => const AuthWrapper(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          useMaterial3: true,
        ),
        home: const AuthChecker(),
      ),
    );
  }
}
