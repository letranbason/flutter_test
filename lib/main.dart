import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en' ? const Locale('vi') : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: MyHomePage(onToggleLanguage: _toggleLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback onToggleLanguage;

  const MyHomePage({super.key, required this.onToggleLanguage});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.title)),
      body: Center(
        child: ElevatedButton(
          onPressed: onToggleLanguage,
          child: Text(localizations.languageToggle),
        ),
      ),
    );
  }
}
