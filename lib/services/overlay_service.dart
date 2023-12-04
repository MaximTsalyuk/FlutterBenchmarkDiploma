import 'package:flutter/material.dart';

class OverlayService {
  OverlayService._privateConstructor();
  static final OverlayService _instance = OverlayService._privateConstructor();
  static OverlayService get instance => _instance;

  OverlayEntry? _busyOverlay;

  void _initBusyOverlay({
    required Size size,
  }) {
    _busyOverlay = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(.5),
          width: size.width,
          height: size.height,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              color: Colors.green,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.green,
              ),
              value: null,
            ),
          ),
        );
      },
    );
  }

  // Busy Overlay
  void showBusyOverlay({
    required BuildContext context,
    required Size size,
  }) {
    OverlayState? overlayState = Overlay.of(context);

    if (_busyOverlay == null) {
      _initBusyOverlay(size: size);

      overlayState.insert(_busyOverlay!);
    } else {
      closeBusyOverlay(context);

      showBusyOverlay(
        context: context,
        size: size,
      );
    }
  }

  void closeBusyOverlay(BuildContext context) {
    if (_busyOverlay != null) {
      _busyOverlay!.remove();
      _busyOverlay = null;
    }
  }
}
