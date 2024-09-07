import 'dart:async';


import 'package:bloodproject/signpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bldmain(),
    );
  }
}

class Bldmain extends StatefulWidget {
  const Bldmain({super.key});

  @override
  State<Bldmain> createState() => _BldmainState();
}

class _BldmainState extends State<Bldmain> with TickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();


    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
    Timer(Duration(seconds: 8),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Signpage()
            )
        )
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color(0xffffffff),

      body:Container(height: MediaQuery.of(context).size.height,width:  MediaQuery.of(context).size.width,

        child: Stack(
            children: [
              FadeTransition(
                opacity: _animation,
                child: Center(
                  child:
                  Positioned(bottom: -50,
                      left: -10,
                      right: -10,
                      child: Image.network("https://as1.ftcdn.net/v2/jpg/01/20/31/32/1000_F_120313241_30567GPU6i6GkwS73ZS0AQsb3KRiWS9P.jpg",height:  MediaQuery.of(context).size.height,width:  MediaQuery.of(context).size.width,fit: BoxFit.cover,)),

                ),
              // ), FadeTransition(
              //   opacity: _animation,
              //   child: Center(
              //     child:
              //     Positioned(bottom: -50,
              //         left: -10,
              //         right: -10,
              //         child: Image.asset("assets/images/OIP-removebg-preview.png",height:  100,width:  150,fit: BoxFit.cover,)),
              //
              //   ),
              // ),
        ),
            ]
        ),

      ),
    );
  }
}
