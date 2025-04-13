import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/material.dart';

void unFocus(BuildContext context){
   FocusScope.of(context).unfocus();
}

void showCustomToast(BuildContext context, String message) {
   final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
         bottom: size(context).width*numD08,
         width: size(context).width,
         child: Material(
            color: Colors.transparent,
            child: Center(
               child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),

                  curve: Curves.easeIn,
                  padding: EdgeInsets.symmetric(horizontal: size(context).width*numD04, vertical: size(context).width*numD02),
                  decoration: BoxDecoration(
                     color: colorBlack54,
                     borderRadius: BorderRadius.circular(size(context).width*numD08),
                     boxShadow: [
                        BoxShadow(
                           color: Colors.black12,
                           blurRadius: 5,
                        ),
                     ],
                  ),
                  child: CommonText(text: message,fontSize: size(context).width*numD04,color: colorWhite,)
               ),
            ),
         ),
      ),
   );

   // Insert overlay
   Overlay.of(context).insert(overlayEntry);

   // Remove after duration
   Future.delayed(Duration(seconds: 1),).then((_) {
      overlayEntry.remove();
   });
}
