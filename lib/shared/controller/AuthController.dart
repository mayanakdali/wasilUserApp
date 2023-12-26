// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:userwasil/config/custom_package.dart';
// import 'package:userwasil/core/locale/locale.controller.dart';
//
// import 'package:userwasil/views/home/category_view/home_screen.dart';
// import '../services/PushNotificationsManager.dart';
//
// import 'package:http/http.dart'as http;
//
// enum AuthType {
//   verified, //
//   notVerified,
//   notFound, }
//
// class AuthController extends GetxController {
// var errorText=''.obs;
//   //--------------------- Log In ---------------------------------------------//
//    Future loginUser(String mobile, String password) async {
//     LocaleController controller=Get.put(LocaleController());
//     //Get FCM
//
//     PushNotificationsManager pushNotificationsManager =
//         PushNotificationsManager.instance;
//
//     pushNotificationsManager = PushNotificationsManager();
//       pushNotificationsManager.init();
//
//     //await pushNotificationsManager.init();
//     String? fcmToken = await pushNotificationsManager.getToken();
//
//     //URL
//     String loginUrl = 'https://admin.wasiljo.com/public/api/v1/user/login?lang=${controller.language}';
//
//     //Body Data
//     Map data = {'mobile': mobile , 'password': password, 'fcm_token': fcmToken};
//
//     log(data.toString());
//
//     //Encode
//     String body = json.encode(data);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError();
//     }
//
//     //Response
//     try {
//       var  response = await http.post(Uri.parse(loginUrl),
//           headers: ApiUtil.getHeader(requestType: RequestType.Post),
//           body: body);
//
//       log(response.body.toString());
//
//
//       if (response.statusCode == 200) {
//
//         log('200');
//         SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//         Map<String, dynamic> data = json.decode(response.body);
//
//         Map<String, dynamic> user = data['data']['user'];
//         // save token in catch
//         String token = data['data']['token'];
//         await sharedPreferences.setString('token', token);
//         // save data user in catch
//       await saveUser(user);
//
//         AuthType authType = await AuthController.userAuthType();
//
//
//         if (authType == AuthType.verified) {
//           log('authType == AuthType.VERIFIED');
//         Get.to(const HomeScreen());
//         } else if (authType == AuthType.notVerified) {//
//         log('authType == AuthType.LOGIN');
//            Get.to(const HomeScreen());
//         }
//
// errorText.value='';
//         print('true');
//       } else {
//         log( 'myResponse.success = false;');
//         Map<String, dynamic> data = json.decode(response.body);
//        String error = data['error'];
//        errorText.value=error;
//         print('error : ${errorText.value}');
//
//       }
//
//
//     } catch (e ) {
//
//
//       log(e.toString());
//       return MyResponse.makeServerProblemError();
//     }
//   }
//
//   //--------------------- Check Mobile Availability ---------------------------------------------//
//   static Future<MyResponse> mobileVerified(String? mobileNumber) async {
//     //Get Token
//     String? token = await AuthController.getApiToken();
//
//     //URL
//     String url = 'https://admin.wasiljo.com/public/api/v1/user/mobile_verified';
//
//     //Body Data
//     Map data = {'mobile': mobileNumber};
//
//     //Encode
//     String body = json.encode(data);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError();
//     }
//
//     //Response
//     try {
//       NetworkResponse response = await Network.post(url,
//           headers: ApiUtil.getHeader(
//               requestType: RequestType.PostWithAuth, token: token),
//           body: body);
//
//       MyResponse myResponse = MyResponse(response.statusCode);
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> data = json.decode(response.body!);
//         Map<String, dynamic> user = data['user'];
//
//         // await saveUser(user);
//
//         myResponse.success = true;
//       } else {
//         Map<String, dynamic> data = json.decode(response.body!);
//         myResponse.success = false;
//         myResponse.setError(data);
//       }
//       return myResponse;
//     } catch (e) {
//       return MyResponse.makeServerProblemError();
//     }
//   }
//
//   //--------------------- Mobile Verified ---------------------------------------------//
//   static Future<MyResponse> verifyMobileNumber(String mobileNumber) async {
//     //Get Token
//     String? token = await AuthController.getApiToken();
//
//     //URL
//     String url = 'https://admin.wasiljo.com/public/api/v1/user/verify_mobile_number';
//
//     //Body Data
//     Map data = {'mobile': mobileNumber};
//
//     //Encode
//     String body = json.encode(data);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError();
//     }
//
//     //Response
//     try {
//       NetworkResponse response = await Network.post(url,
//           headers: ApiUtil.getHeader(
//               requestType: RequestType.PostWithAuth, token: token),
//           body: body);
//
//       MyResponse myResponse = MyResponse(response.statusCode);
//       log(response.body!.toString());
//       if (response.statusCode == 200) {
//
//         myResponse.success = true;
//       } else {
//         Map<String, dynamic> data = json.decode(response.body!);
//         myResponse.success = false;
//         myResponse.setError(data);
//       }
//       return myResponse;
//     } catch (e) {
//       return MyResponse.makeServerProblemError();
//     }
//   }
//
//   //--------------------- Register  ---------------------------------------------//
//   static Future<MyResponse> registerUser(
//       String name, String email,mobile, String password,accountType) async {
//     //Add FCM Token
//     PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
//     await pushNotificationsManager.init();
//     String? fcmToken = await pushNotificationsManager.getToken();
//
//     //URL
//     String registerUrl = 'https://admin.wasiljo.com/public/api/v1/user/register';
//
//     //Body
//     Map data = {
//       'name': name,
//       'email': email,
//       "mobile" : mobile,
//       'password': password,
//     'account_type':accountType,
//       'fcm_token': fcmToken
//     };
//
//     // //Encode
//     String body = json.encode(data);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if(!isConnected){
//       return MyResponse.makeInternetConnectionError();
//     }
//
//     //Response
//     try {
//       var response = await post(Uri.parse(registerUrl),
//           headers: ApiUtil.getHeader(requestType: RequestType.Post),
//           body: body);
//
//       log(response.body.toString());
//
//       MyResponse myResponse = MyResponse(response.statusCode);
//
//       if (response.statusCode == 200) {
//         log("i am is the success method");
//         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//
//         Map<String, dynamic> data = json.decode(response.body);
//         Map<String, dynamic> user = data['data']['user'];
//         String token = data['data']['token'];
//
//         await sharedPreferences.setString('name', user['name']);
//         await sharedPreferences.setString('email', user['email']);
//         await sharedPreferences.setString('token', token);
//         await sharedPreferences.setString('mobile', user['mobile']);
//         await sharedPreferences.setBool('mobile_verified', true);
//
//         myResponse.success = true;
//       } else {
//         log("i am is the not 200 method");
//
//         Map<String, dynamic> data = json.decode(response.body!);
//         log('error${data["error"]}');
//         Map<String, dynamic> errorss = data['error'];
//
//         // showSnackBar(context, data["errors"]==null? data["message"].toString():data["errors"][0].toString() );
//         myResponse.success = false;
//
//         myResponse.setErrorForRegister(data["errors"]);
//
//         log("i am in the error method");
//       }
//
//       return myResponse;
//     }catch(e){
//       //If any server error...
//       log("i am in the catch method");
//       log(e.toString());
//       return MyResponse.makeServerProblemError();
//     }
//   }
//
//
//   //--------------------- Forgot Password ---------------------------------------------//
//   static Future<MyResponse> forgotPassword(String mobile,password) async {
//     String url = ApiUtil.MAIN_API_URL + ApiUtil.FORGOT_PASSWORD;
//
//     //Body date
//     Map data = {
//       'mobile': mobile,
//       'password' : password
//     };
//
//     //Encode
//     String body = json.encode(data);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError();
//     }
//
//     try {
//       NetworkResponse response = await Network.post(url,
//           headers: ApiUtil.getHeader(requestType: RequestType.Post),
//           body: body);
//         log(response.body.toString());
//       MyResponse myResponse = MyResponse(response.statusCode);
//
//       if (response.statusCode==200) {
//         myResponse.success = true;
//       } else {
//         Map<String, dynamic> data = json.decode(response.body!);
//         myResponse.success = false;
//         myResponse.setError(data);
//       }
//
//       return myResponse;
//     }catch(e){
//       log(e.toString());
//       return MyResponse.makeServerProblemError();
//     }
//
//   }
//
//
//   //---------------------- Update user ------------------------------------------//
//   static Future<MyResponse> updateUser( String name,String email,String phone) async {
//     //Get Token
//     String? token = await AuthController.getApiToken();
//     String registerUrl ='https://admin.wasiljo.com/public/api/v1/user/update_profile?lang=ar';
//
//     Map data = {
//       "name":name,
//       "mobile":phone,
//       "email":email,
//
//     };
// print(data['name']);
//     if (name.isNotEmpty) data['name'] = name;
//     if (email.isNotEmpty) data['email'] = email;
//     if (phone.isNotEmpty) data['phone'] = phone;
//     print(data['name']);
//     // if (imageFile != null) {
//     //   final bytes = imageFile.readAsBytesSync();
//     //   String img64 =base64Encode(bytes);
//     //   data['avatar_image'] = img64;
//     // }
//
//     //Encode
//     String body = json.encode(data);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError();
//     }
//
//     try {
//       NetworkResponse response = await Network.post(registerUrl,
//         headers: ApiUtil.getHeader(requestType: RequestType.PostWithAuth,token: token),
//         body: body,);
//
//       MyResponse myResponse = MyResponse(response.statusCode);
//       if (response.statusCode == 200) {
//         Map<String, dynamic> data = json.decode(response.body!);
//         // await saveUser(data['user']);
//         myResponse.success = true;
//       } else {
//         Map<String, dynamic> data = json.decode(response.body!);
//         myResponse.success = false;
//         myResponse.setError(data);
//       }
//
//       return myResponse;
//     }catch(e){
//       return MyResponse.makeServerProblemError();
//     }
//   }
//
//
//   //------------------------ Logout -----------------------------------------//
//    Future<bool> logoutUser() async {
//
//     //Remove FCM Token
//     PushNotificationsManager pushNotificationsManager =
//         PushNotificationsManager();
//     await pushNotificationsManager.removeFCM();
//
//     //Clear all Data
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//     await sharedPreferences.remove('name');
//     await sharedPreferences.remove('email');
//
//     await sharedPreferences.remove('token');
//     await sharedPreferences.remove('mobile');
//     await sharedPreferences.remove('mobile_verified');
//     await sharedPreferences.remove('blocked');
//
//     return true;
//   }
//   //------------------------ deleteAccount -----------------------------------------//
//       Future deleteAccount() async {
//
//          String? token = await AuthController.getApiToken();
// print(token);
//     var response = await http.post(Uri.parse('https://admin.wasiljo.com/public/api/v1/user/delete'),
//         headers: ApiUtil.getHeader(requestType: RequestType.PostWithAuth,token: token!),);
//
//     log("Deleting : ");
//     log(response.body.toString());
//
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//     await sharedPreferences.remove('id');
//     await sharedPreferences.remove('name');
//     await sharedPreferences.remove('email');
//     await sharedPreferences.remove('avatar_url');
//     await sharedPreferences.remove('token');
//     await sharedPreferences.remove('mobile');
//     await sharedPreferences.remove('mobile_verified');
//     await sharedPreferences.remove('blocked');
// Get.to(const SignInScreen());
//     return true;
//   }
//
//  // ------------------------ Save user in cache -----------------------------------------//
//   static saveUser(Map<String,dynamic> user) async {
//     await saveUserFromUser(User.fromJson(user));
//   }
//
//   static saveUserFromUser(User user) async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.setInt('id', user.id);
//     await sharedPreferences.setString('name', user.name!);
//     await sharedPreferences.setString('email', user.email!);
//     await sharedPreferences.setBool('mobile_verified', user.mobileVerified);
//     await sharedPreferences.setString('avatar_url', user.avatarUrl!);
//     await sharedPreferences.setString('mobile', user.mobile!);
//     await sharedPreferences.setBool('blocked', user.blocked);
//
//    print( sharedPreferences.getInt('id'));
//        print( sharedPreferences.getString('name'));
//    print( sharedPreferences.getString('email'));
//        print( sharedPreferences.getBool('mobile_verified'));
//    print( sharedPreferences.getString('avatar_url',));
//      print( sharedPreferences.getString('mobile', ));
//    print( sharedPreferences.getBool('blocked', ));
//     print(sharedPreferences.getString('email'));
//   }
//
//
//   //------------------------ Get user from cache -----------------------------------------//
//   static Future<Account> getAccount() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     int? id = sharedPreferences.getInt('id');
//     String? name = sharedPreferences.getString('name');
//     String? email = sharedPreferences.getString('email');
//     String? mobile = sharedPreferences.getString('mobile');
//     String? token = sharedPreferences.getString('token');
//     String? avatarUrl = sharedPreferences.getString('avatar_url');
//
//     return Account(id,name,mobile, email, token, avatarUrl);
//   }
//
//   //------------------------ Check user logged in or not -----------------------------------------//
//   static Future<AuthType> userAuthType() async {
//     try {
//       SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//
//       String? token = sharedPreferences.getString("token");
//       bool mobileVerified =
//           sharedPreferences.getBool('mobile_verified') ?? false;
//
//       if (token == null) {//not signup
//         return AuthType.notFound;
//       } else if (!mobileVerified) {// not send otp
//         return AuthType.notVerified;
//       }
//       return AuthType.verified;// verification otp
//     } catch (e) {}
//     return AuthType.notFound;
//   }
//
//   //------------------------ Get api token -----------------------------------------//
//   static Future<String?> getApiToken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences.getString("token");
//   }
//
//   //------------------------ Testing notice -------------------------------------//
//
//   static Widget notice(ThemeData themeData){
//     return Container(
//       margin: Spacing.fromLTRB(24, 36, 24, 24),
//       child: RichText(
//         text: TextSpan(
//             children: [
//               TextSpan(
//                   text: "Note: ",
//                   style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,color: themeData.colorScheme.primary,fontWeight: 600)
//               ),
//               TextSpan(
//                   text: "After testing please logout, because there is many user testing with same IDs so it can be possible that you can get unnecessary notifications",
//                   style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,color: themeData.colorScheme.onBackground,fontWeight: 500,letterSpacing: 0)
//               ),
//             ]
//         ),
//       ),
//     );
//   }
//
//
// }
