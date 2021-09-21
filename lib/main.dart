import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/providers/report_provider.dart';
import 'package:my_app/screens/report.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then(
        (_) {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ReportProvider>(
                create: (context) => ReportProvider())
          ],
          child: InitialApp(),
        ),
      );
    },
  );
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
        //textTheme: GoogleFonts.robotoTextTheme()

      //theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      //theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: Report(),
      //home: AddSalesExpenseScreen(),

    );
  }
}