

 import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
   const CustomIcon({super.key, required this.icon});

   final IconData icon ;
   @override
   Widget build(BuildContext context) {
     return Container(
       height: 46,
       width: 46,
       decoration:  BoxDecoration(
           borderRadius: BorderRadius.circular(16),
           color: const Color.fromRGBO(255, 255, 255, 0.05),
         //color: Colors.white.withOpacity(.05),
         // color: Colors.white.withAlpha((0.05 * 255).round()),
         //✅ استبدل أي withOpacity() بـ fromRGBO
         // لحد ما يستقر شكل استخدام withValues() مع Flutter الجديد.

       ),
       child: Center(
         child: Icon(
           icon,
            size: 28,
         ),
       ),
     );
   }
 }
