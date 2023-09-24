import 'package:prayer_time_app/prayer_time_app_library.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Namoz vaqtlari",
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig().theme,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Namoz vaqtlari"),
        ),
        body: const SafeArea(
          child: HomePage(),
        ),
      ),
    ),
  );
}
