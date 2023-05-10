import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult _connectivityResult;
  late StreamSubscription < ConnectivityResult> _streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    _initConnectivity();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _initConnectivity() async {
    _connectivityResult = await _connectivity.checkConnectivity();

  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (kDebugMode) print("STATUS : " + connectivityResult.toString());

    if (connectivityResult == ConnectivityResult.none) {
      if (!Get.isSnackbarOpen) {
        Get.rawSnackbar(
          messageText: const Text(
            'PLEASE CONNECT TO THE INTERNET',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED,
        );
        _startTimer();
      }
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        _stopTimer();
      }
    }
  }

  late Timer _timer;

  void _startTimer() {
    _timer = Timer(const Duration(minutes: 8), () {
      Get.close(1);
      exit(0);
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

}