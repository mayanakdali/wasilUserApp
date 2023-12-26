
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasil/register/register%20screens/signup_screen.dart';
import '../../home management/home screens/home.dart';
import '../../shared/Components/methods.dart';
import '../../shared/Components/progress_hud.dart';
import '../../shared/Components/snakbar_service.dart';
import '../../shared/config/font.dart';
import '../../shared/constant/colors.dart';
import '../../shared/network/local/shared_prefrenses_helper.dart';
import '../../shared/services/AppLocalizations.dart';
import '../../shared/utils/helper/size.dart';
import '../../shared/utils/ui/common_views.dart';
import '../../shared/utils/ui/textfeild.dart';
import '../register bloc/register_cubit.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    cubit.connectedMessage="";
    cubit.errorMessage="";
    cubit.countryCode="962";
    cubit.passwordController.clear();
    cubit.mobileController.clear();
     cubit.showPassword = true;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SignInLoadingState)
          ProgressHud.shared.startLoading(context);
        if (state is SignInSuccessState ||
            state is SignInErrorState ||
            state is  SignInServerErrorState||
            state is NoInternetState) ProgressHud.shared.stopLoading();
        if (state is SignInServerErrorState)
          showSnackBar(context, cubit.errorMessage);
        if (state is NoInternetState)
          showSnackBar(context, cubit.connectedMessage);
        if (state is SignInSuccessState &&
            CachHelper.getData(key: 'token') != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (route) => false);
        }

        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 150, right: 20, left: 20),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 120.0,
                            height: 120.0,
                          ),
                        ),
                        Row(
                          //TODO:"translate lang"
                          children: [
                            Text(
                              Translator.translate("Sign in".tr),
                              style: boldPrimary,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  showCountryPicker(
                                    context: context,
                                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                    exclude: <String>['KN', 'MF'],
                                    favorite: <String>['JO'],
                                    //Optional. Shows phone code before the country name.
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      cubit.changeCountryCode(country);
                                    },
                                    // Optional. Sets the theme for the country list picker.
                                    countryListTheme: CountryListThemeData(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(40.0),
                                        topRight: Radius.circular(40.0),
                                      ),
                                      // Optional. Styles the search field.
                                      inputDecoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Start typing to search',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8)
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                      // Optional. Styles the text in the search field
                                      searchTextStyle: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(cubit.countryCode,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                            ),
                            Spacing.width(8),
                            Expanded(
                                child: CustomTextField(
                              validator: (value) {
                                //TODO:"translate lang"
                                if (value == null || value.isEmpty) {
                                  return Translator.translate(
                                      'Please enter your mobile number'.tr);
                                }
                                //TODO:"translate lang"
                                if (value.length != 9) {
                                  return Translator.translate(
                                      'mobile number not equal 9 '.tr);
                                }
                                return null;
                              },
                              //TODO:"translate lang"
                              hintText:
                                  Translator.translate('mobile Number'.tr),
                              controller: cubit.mobileController,
                              prefixIconData: Icons.phone_android,
                              keyBoard: TextInputType.phone,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          validator: (value) {
                            //TODO:"translate lang"
                            if (value == null || value.isEmpty) {
                              return Translator.translate(
                                  'Please enter your  password'.tr);
                            }
                            //TODO:"translate lang"

                            if (value.length <= 7) {
                              return Translator.translate(
                                  'password length at least 8 character'.tr);
                            }
                            return null;
                          },
                          keyBoard: TextInputType.text,
                          controller: cubit.passwordController,
                          isPassword: cubit.showPassword,
                          //TODO:"translate lang"
                          hintText: Translator.translate("password".tr),
                          prefixIconData: Icons.lock,
                          suffixIconData: cubit.showPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          onSuffixIconPress: () {
                            cubit.changeShowPassword();
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              style: const TextStyle(
                                  color: AppColors.secondaryColor),
                              //TODO:"translate lang"
                              Translator.translate("forget password".tr),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        cubit.errorMessage != ''&&state is SignInErrorState
                            ? Text(cubit.errorMessage,
                                style: TextStyle(color: Colors.red))
                            : SizedBox(),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonViews().createButton(
                          //TODO:"translate lang"
                          title: Translator.translate('SignIn'.tr),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.signIn(
                                  mobile: cubit.countryCode +
                                      cubit.mobileController.text,
                                  password: cubit.passwordController.text);

                              // controllerSignIn.SignInUser(
                              //     mobile: countryCode.toString() +
                              //         _mobileTFController!.text,
                              //     password: passwordTFController!.text);
                            }
                          },
                        ),
                        Center(
                          child: Container(
                            margin: Spacing.top(16),
                            child: InkWell(
                              onTap: () {
                                //  controllerSignIn.errorText.value = '';
                               goTo(context: context, screen: SignUpScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Translator.translate(
                                        "Don't have an Account?".tr),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    Translator.translate("SignUp".tr),
                                    style: basicPrimary,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Center(
                            child: Text(
                                //TODO:"translate lang"
                                Translator.translate('SignIn with visitor'.tr)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
