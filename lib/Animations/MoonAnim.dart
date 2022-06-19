import 'package:flutter/material.dart';

class moonAnimUp extends StatefulWidget {
  const moonAnimUp({ Key? key }) : super(key: key);

  @override
  State<moonAnimUp> createState() => _moonAnimUpState();
}

class _moonAnimUpState extends State<moonAnimUp> with SingleTickerProviderStateMixin{
 Animation<double>? animation;
  AnimationController? animationController;

void mylistener(status){
  if(status==AnimationStatus.completed){
          animation!.removeStatusListener(mylistener);

        animationController!.reset();

        animation=Tween(begin: 0.0,end: 0.0).
    animate(CurvedAnimation
    (parent: animationController!, curve: Curves.fastOutSlowIn));

    animationController!.forward();
      }
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController=
                AnimationController(vsync: this,duration: Duration(milliseconds: 2500));
    
    animation=Tween(begin: 1.0,end: 0.0).
    animate(CurvedAnimation
    (parent: animationController!, curve: Curves.fastOutSlowIn))..
    addStatusListener(mylistener);

    animationController!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) =>  
        Transform(
          transform: Matrix4.translationValues(0.0, animation!.value*height,0.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
          image: AssetImage('lib/Images/moon.png'),
                           ),
              ),
            ),
          ),
        ),
        );
        
      
  }
}
