import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';


class Utils{


  /// FLASH BAR
  static void flushBarMessage(String message, BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          borderRadius: BorderRadius.circular(10),
          icon: const Icon(Icons.check, color: Colors.green,),
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 4),
        )..show(context));}


}