import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared/end points/end_points2.dart';
import '../../shared/locale/locale.controller.dart';
import '../../shared/network/local/shared_prefrenses_helper.dart';
import '../../shared/network/remot/dio_helper.dart';
import '../../shared/services/PushNotificationsManager.dart';
import '../../shared/utils/helper/InternetUtils.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterCubit() : super(RegisterInitial());

  String countryCode = "962";
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  bool showPassword = true;
  LocaleController controller = Get.put(LocaleController());
  var errorMessage = "";
  var connectedMessage = "";
  //SignUp
  TextEditingController mobileSignUpController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController referrerLinkSignUpController = TextEditingController();
  String selectedType = "individual".tr;
  var errorList = [];

  changeTypeUser(String type) {
    selectedType = type;
    emit(ChangeTypeUserState());
  }

  changeCountryCode(Country country) {
    countryCode = country.phoneCode;
    emit(ChangePhoneCodeState());
  }

  changeShowPassword() {
    print(showPassword);
    showPassword = !showPassword;
    emit(ChangeShowPasswordState());
  }

  signIn({required String mobile, required String password}) async {
    errorMessage = '';
    connectedMessage = '';
    emit(SignInLoadingState());
    PushNotificationsManager pushNotificationsManager =
        PushNotificationsManager();
    await pushNotificationsManager.init();
    String? fcmToken = await pushNotificationsManager.getToken();

    bool isConnected = await InternetUtils.checkConnection();
    if (isConnected) {
      DioHelper.postData(
        url: signInURL,
        data: {"mobile": mobile, "password": password},
        query: {"lang": controller.language.toString()},
      ).then((value) {
        Map<String, dynamic> user = value.data['data']['user'];
        String token = value.data['data']['token'];
        CachHelper.saveData(key: "token", value: token);
        CachHelper.saveData(key: "user", value: user['name']);
        CachHelper.saveData(key: "email", value: user['email']);
        CachHelper.saveData(key: "referrer", value: user['referrer']);
        CachHelper.saveData(key: "mobile", value: user['mobile']);
        CachHelper.saveData(
            key: "mobile_verified", value: user['mobile_verified']);
        emit(SignInSuccessState());
      }).catchError((error) {
        // Handle the error
        if (error is DioException) {
          // Handle DioError
          if (error.response != null) {
            errorMessage = error.response!.data['error'];
            print(error.response!.data['error']);
            emit(SignInErrorState());
          }
        } else {
          print(error);
          emit(SignInServerErrorState());
          errorMessage = "Server Problem! Please try again later";
        }
      });
    } else {
      connectedMessage = 'No internet,Please turn on internet';
      emit(NoInternetState());
    }
  }

  signUp({
    required String name,
    required String mobile,
    required String password,
    required String email,
    required int account_type,
    required String referrer_link,
  }) async {
    errorMessage = '';
    connectedMessage = '';
    errorList = [];
    emit(SignUpLoadingState());
    PushNotificationsManager pushNotificationsManager =
        PushNotificationsManager();
    await pushNotificationsManager.init();
    String? fcmToken = await pushNotificationsManager.getToken();
    print("fcmToken$fcmToken");
    bool isConnected = await InternetUtils.checkConnection();
    if (isConnected) {
      DioHelper.postData(
        url: signUpURL,
        data: {
          "name": name,
          "mobile": countryCode + mobile,
          "password": password,
          "fcm_token": fcmToken,
          "email": email,
          "account_type": account_type,
          // "referrer_link": referrer_link,  In the future we will use that
        },
        query: {"lang": controller.language.toString()},
      ).then((value) {
        Map<String, dynamic> user = value.data['data']['user'];
        String token = value.data['data']['token'];
        CachHelper.saveData(key: "token", value: token);
        CachHelper.saveData(key: "user", value: user['name']);
        CachHelper.saveData(key: "email", value: user['email']);
        CachHelper.saveData(key: "referrer", value: user['referrer']);
        CachHelper.saveData(key: "mobile", value: user['mobile']);
        emit(SignUpSuccessState());
      }).catchError((error) {
        // Handle the error
        if (error is DioException) {
          // Handle DioError
          if (error.response != null) {
            errorList = error.response!.data['error'];
            print(error.response!.data['error']);
            emit(SignUpErrorState());
          }
        } else {
          print(error);
          emit(SignUpServerErrorState());
          errorMessage = "Server Problem! Please try again later";
        }
      });
    } else {
      connectedMessage = 'No internet,Please turn on internet';
      emit(NoInternetState());
    }
  }
}
