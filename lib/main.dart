import 'package:audio_bible_dramarized/logics/providers.dart';
import 'package:audio_bible_dramarized/presentation/screens/drawer.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'presentation/screens/audio_details.dart';
import 'presentation/widgets/custom_appbar_widget.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(context, watch) {
    final theme = watch(themeStateProvider);
    return MaterialApp(
      title: 'Audio Bible',
      themeMode: theme.getThemeMode(),
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: theme.swatchColor,
        scaffoldBackgroundColor: Colors.grey[100]
      ),
      home: AudioServiceWidget(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppbar()),
      body: AudioDetails(),
      // body: FeedCategory(),
    );
  }
}
