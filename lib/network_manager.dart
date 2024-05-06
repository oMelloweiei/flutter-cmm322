import 'dart:async';

import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//manage the network connectivity and provide methods to check and handle connectivity change
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  // final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;
  // List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

  //Initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  //Update the connection status based on changes is connectivity and show a relevant popup for no internet connection
  // void _updateConnectionStatus(ConnectivityResult result) {
  //   _connectionStatus.value = result;
  //   if (_connectionStatus.value == ConnectivityResult.none) {
  //     Loaders.customToast(message: 'No Internet Connection');
  //   }
  // }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      Loaders.warningSnackBar(title: "No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClosed() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
