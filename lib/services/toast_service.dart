import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static showToast({
    required String message,
    required BuildContext context,
    bool error = false,
  }) {
    Size size = MediaQuery.of(context).size;

    try {
      FToast fToast = FToast();
      fToast.init(context);
      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: error ? Colors.redAccent : Colors.greenAccent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(error ? Icons.error_outline : Icons.check),
            const SizedBox(
              width: 12.0,
            ),
            SizedBox(
              width: size.width * .6,
              child: Text(message),
            ),
          ],
        ),
      );

      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      e.toString();
    }
  }
}
