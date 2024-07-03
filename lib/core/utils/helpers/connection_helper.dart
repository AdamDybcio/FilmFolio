import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

List<ConnectivityResult> connectionStatus = [ConnectivityResult.none];
final Connectivity connectivity = Connectivity();
late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

Future initConnectivity() async {
  start();
  connectivitySubscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
}

void dispose() {
  connectivitySubscription.cancel();
}

Future<void> start() async {
  late List<ConnectivityResult> result;
  try {
    result = await connectivity.checkConnectivity();
  } on PlatformException catch (e) {
    if (kDebugMode) print('Connectivity PlatformException: $e');
    return;
  }

  return updateConnectionStatus(result);
}

Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
  connectionStatus = result;
  if (kDebugMode) print('Connectivity changed: $connectionStatus');
}
