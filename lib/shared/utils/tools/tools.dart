import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constant/exptions.dart';

AppTools appTools = AppTools();

class AppTools {
  String? passwordValidate(TextEditingController controller) {
    String pattern = RegExption.passwordPattern;
    RegExp regExp = RegExp(pattern);
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (controller.text.length < 8) {
      return 'passwordMustContainNumber'.tr;
    } else if (regExp.hasMatch(controller.text) == false) {
      return 'passwordMustContainNumber'.tr;
    }
    log(true.toString());
    return null;
  }

  String? passwordSetValidate(TextEditingController controller) {
    String pattern = RegExption.passwordPattern;
    RegExp regExp = RegExp(pattern);
    if (controller.text.isEmpty) {
      return '';
    } else if (controller.text.length < 8) {
      return '';
    } else if (regExp.hasMatch(controller.text) == false) {
      return '';
    }
    return null;
  }

  String? confirmPasswordValidate(
    TextEditingController password,
    TextEditingController confirmPass,
  ) {
    if (password.text.isNotEmpty) {
      if (!passwordChecker(
        password.text,
        password,
        confirmPass,
      )) {
        return 'passwordNotMatch';
      }
    }
    return null;
  }

  bool passwordChecker(
    String value,
    TextEditingController password,
    TextEditingController confirmPassword,
  ) {
    bool samePassword = false;
    bool passRole = passwordRole(password);
    samePassword = samePass(password, confirmPassword);
    if (passRole && samePassword) {
      return true;
    } else {
      return false;
    }
  }

  bool samePass(
    TextEditingController password,
    TextEditingController confirmPassword,
  ) {
    if ((password.text == confirmPassword.value.text) &&
        (password.text.isNotEmpty && confirmPassword.text.isNotEmpty)) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordRole(TextEditingController password) {
    bool eightCharacter = false;
    bool characterCase = false;
    bool numberOfDigit = false;
    String number = r'^(?=.*?[0-9])';
    RegExp numberregExp = RegExp(number);
    String letter = r'^(?=.*?[A-Z])(?=.*?[a-z])';
    String sympol = r'(?=.*?[!@#\$&*~%])';
    RegExp regExp = RegExp(sympol);
    RegExp letterregExp = RegExp(letter);
    if (password.text.length >= 8) {
      eightCharacter = true;
    } else {
      eightCharacter = false;
    }
    if (letterregExp.hasMatch(password.text)) {
      characterCase = true;
    } else {
      characterCase = false;
    }

    if ((numberregExp.hasMatch(password.text) &&
        regExp.hasMatch(password.text))) {
      numberOfDigit = true;
    } else {
      numberOfDigit = false;
    }
    if (eightCharacter && characterCase && numberOfDigit) {
      return true;
    } else {
      return false;
    }
  }

  String? emailValidate(TextEditingController controller) {
    RegExp regExp = RegExp(RegExption.email);
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (!regExp.hasMatch(controller.text)) {
      return 'pleaseEnterValidEmail';
    }
    return null;
  }

  bool emailValidateHelp(String text) {
    RegExp regExp = RegExp(RegExption.emailVal);
    if (regExp.hasMatch(text)) {
      return true;
    }
    return false;
  }

  String? emailOrPhoneValidate(TextEditingController controller) {
    RegExp regExp = RegExp(RegExption.email);
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (!regExp.hasMatch(controller.text)) {
      return 'pleaseEnterValidEmail';
    }
    return null;
  }

  String? nameValidate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (controller.text.length < 3) {
      return 'pleaseEnterVaildName';
    }
    return null;
  }

  String? phoneNumberValidate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    if (controller.text.contains(RegExp(RegExption.noNumber))) {
      return 'shouldBeContainsNumbersOnly';
    } else if (controller.text.length < 4) {
      return 'phoneNumberMustatLeast';
    }

    return null;
  }

  bool phoneNumberValidateHelp(String phone) {
    if (phone.contains(RegExp(RegExption.noNumber))) {
      return false;
    } else if (phone.length < 4) {
      return false;
    }

    return true;
  }

  String? expiryDateValidate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (controller.text.length < 3) {
      return 'pleaseEnterVaildName';
    } else if (controller.text
        .contains(RegExp('[a-zA-Zا-ي?=.*!@#\$%^&*(),.?:{}|<>]'))) {
      return 'shouldBeContainsNumbersOnly';
    } else {
      return null;
    }
  }

  String? requiredFieldValidate(TextEditingController controller) {
    if (controller.value.text.isEmpty || controller.value.text == '') {
      return 'this_field_is_required'.tr;
    }
    return null;
  }

  String? phoneOrEmailFieldValidate(TextEditingController controller) {
    if (controller.value.text.isEmpty || controller.value.text == '') {
      return 'this_field_is_required'.tr;
    }
    return null;
  }

  void unFocusKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  int createRandom() {
    int randomID;
    math.Random random = math.Random();
    int randomFirst = random.nextInt(1000000000) + 1000000;
    int randomSecond = random.nextInt(100000) + randomFirst;
    randomID = randomFirst + randomSecond;
    return randomID;
  }

  Future<void> showCustomBottomSheet(
    BuildContext context,
    Widget child,
    bool isDismissible,
  ) async {
    await showModalBottomSheet(
      enableDrag: false,
      elevation: 5,
      isScrollControlled: true,
      backgroundColor: Colors.white.withOpacity(0.3),
      context: context,
      isDismissible: isDismissible,
      builder: (BuildContext newContext) => SingleChildScrollView(
        child: child,
      ),
    );
  }

  double calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371.0; // Radius of the Earth in kilometers

    // Convert coordinates to radians
    final double lat1 = start.latitude * (math.pi / 180.0);
    final double lon1 = start.longitude * (math.pi / 180.0);
    final double lat2 = end.latitude * (math.pi / 180.0);
    final double lon2 = end.longitude * (math.pi / 180.0);

    // Calculate the differences between the coordinates
    final double dLat = lat2 - lat1;
    final double dLon = lon2 - lon1;

    // Apply the Haversine formula
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    final double distance = earthRadius * c;

    return distance * 1000; // Distance in kilometers, add "*1000" to get meters
  }

  Future<LatLng> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;
    LatLng location = LatLng(lat, long);
    return location;
  }
}
