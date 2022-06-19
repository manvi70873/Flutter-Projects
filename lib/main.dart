import 'package:flutter/material.dart';
import 'package:light_dark_mode_app/Animations/MoonAnim.dart';
import 'package:light_dark_mode_app/Animations/SunAnim.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool ispressed=false;

  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(colors: [const Color(0xFFE91E63),const Color(0xFFFFEB3B)],
             begin: FractionalOffset.topLeft,
             end: FractionalOffset.bottomRight,
             stops: [0.0,1.0],
             tileMode: TileMode.clamp
      );
    var linearGradient2 = new LinearGradient(colors: [const Color(0xFF0D47A1),const Color(0xFF1565C0)],
             begin: FractionalOffset.topLeft,
             end: FractionalOffset.bottomRight,
             stops: [0.0,1.0],
             tileMode: TileMode.clamp
      );
  
    return Container(
      decoration: BoxDecoration(
        gradient: ispressed?linearGradient:linearGradient2
      ),
      child: Center(
          child:  Stack(
          children: [

             ispressed?sunAnimUp():moonAnimUp(),

           Positioned(
             top: MediaQuery.of(context).size.height/8,
             right: MediaQuery.of(context).size.width/2.9,
             child: ElevatedButton(
               onPressed: (){  
            ispressed=!ispressed;
            setState(() {
              ispressed=ispressed;
            });
                 
               }, 
                        style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )
          ),

                       ),
                       child: Text(ispressed?'Dark Mode':"Light Mode",
                        style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                        ) ),
           )
            
          ],
        ),
        )
        
    );
  }
}




