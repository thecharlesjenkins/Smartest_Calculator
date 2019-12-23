import 'package:flutter/material.dart';
import 'package:smartest_calculator/ui/function_display.dart';
import 'package:smartest_calculator/ui/function_list.dart';
import 'package:smartest_calculator/utils/injector_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InjectorWidget(
        child: MaterialApp(
      title: 'Smart Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          buttonTheme:
              ButtonThemeData(padding: EdgeInsets.symmetric(vertical: 10.0)),
          bottomAppBarTheme:
              BottomAppBarTheme(color: Colors.cyanAccent, elevation: 1.0),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.red)))),
      home: Scaffold(body: SafeArea(child: MainDisplay())),
    ));
  }
}

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: FunctionDisplay(
            InjectorWidget.of(context).algorithmBloc,
          ),
        ),
        FunctionList()
      ],
    ));
  }
}

//class CustomTextStyle {
//  static TextStyle numberDisplay(BuildContext context) {
//    return Theme.of(context).textTheme.display4.copyWith(fontSize: 192.0);
//  }
//}
