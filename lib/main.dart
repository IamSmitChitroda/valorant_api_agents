import 'package:valorant_api_agents/headers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AgentsController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SizeController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
