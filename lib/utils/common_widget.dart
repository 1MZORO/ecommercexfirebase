import 'package:cached_network_image/cached_network_image.dart';
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

CachedNetworkImage cachedNetworkImage({required String imageUrl,double? width,double? height}){
   return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => const Center(
         child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.broken_image, size: 50)),
   );
}

DropdownButtonFormField customDropDownField({
   required List<String> list,
   required String value,
   required void Function(String value) onChanges,
   required BuildContext context,
   Widget? prefixIconWidget

}) {
   return DropdownButtonFormField<String>(
     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: size(context).width*numD04),
       decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(size(context).width*numD03)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorGrey.shade400),
              borderRadius: BorderRadius.circular(size(context).width*numD03)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorGrey.shade300),
              borderRadius: BorderRadius.circular(size(context).width*numD03)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorRed),
              borderRadius: BorderRadius.circular(size(context).width*numD02)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorRed),
              borderRadius: BorderRadius.circular(size(context).width*numD02)
          ),
          // suffixIcon: suffixIconWidget,
          prefixIcon: prefixIconWidget,
          filled: true,
          fillColor: colorWhite,
       ),
       value: list.contains(value) ? value : null,
      items: list.map((item) {
         return DropdownMenuItem<String>(
            value: item, //
            child: CommonText(text: item),
         );
      }).toList(),
     onChanged: (value) {
       if (value != null) {
         onChanges(value);
       }
     },
     hint: CommonText(
       text: txSelectProductType,
       color: colorGrey,
       fontWeight: FontWeight.w400,
     ),
   );
}
