
import 'dart:developer';

import 'package:local_auth/local_auth.dart';

class LocalAuthFingerprint {
  static final _auth = LocalAuthentication();

  static Future<List<BiometricType>> biometricType() async {
    try {
      final List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();
      return availableBiometrics;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> displayBiometricIcon() async {
    final List<BiometricType> availableBiometrics = await biometricType();
    return availableBiometrics.isNotEmpty;
  }

  static Future<bool> hasBiometrics() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      return canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    bool isBiometricAvailable = await hasBiometrics();
    if (!isBiometricAvailable) {
      return false;
    }
    try {
      bool authenticated = await _auth.authenticate(
        localizedReason: "Scan Fingerprint to Login",
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      return authenticated;
    } catch (e) {
      log('e.toString()');
      log(e.toString());
      return false;
    }
  }
}
