import 'package:flutter/material.dart';
import 'package:mitch_designs_task/core/responsive/dimension.dart';

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (context, anim1, anim2) {
      return Stack(
        children: <Widget>[
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08,
            left: 0.w,
            right: 0.w,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SizedBox(
                height: 250.h,
                width: MediaQuery.of(context).size.width *1.2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      // Slide up animation
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeInOut,
        )),
        child: child,
      );
    },
  );
}