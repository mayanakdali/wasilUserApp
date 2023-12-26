import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wasil/register/register%20screens/signin_screen.dart';

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
import '../../shared/utils/ui/logo.dart';
import '../../shared/utils/ui/textfeild.dart';
import '../../shared/utils/ui/user_text.dart';
import '../register bloc/register_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    cubit.passwordSignUpController.clear();
    cubit.referrerLinkSignUpController.clear();
    cubit.nameSignUpController.clear();
    cubit.emailSignUpController.clear();
    cubit.mobileSignUpController.clear();
    cubit.selectedType = "individual".tr;
    cubit.countryCode = "962";
    cubit.connectedMessage = "";
    cubit.errorMessage = "";
    cubit.showPassword = true;
    cubit.errorList = [];

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SignUpLoadingState)
          ProgressHud.shared.startLoading(context);
        if (state is SignUpSuccessState ||
            state is SignUpErrorState ||
            state is SignUpServerErrorState ||
            state is NoInternetState) ProgressHud.shared.stopLoading();
        if (state is SignUpServerErrorState)
          showSnackBar(context, cubit.errorMessage);
        if (state is NoInternetState)
          showSnackBar(context, cubit.connectedMessage);
        if (state is SignUpSuccessState &&
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
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    LogoAsset(),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        Translator.translate("Sign Up".tr),
                        style: boldPrimary,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              textStyle: const TextStyle(color: Colors.white),
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
                                  print(cubit.countryCode);
                                },
                                // Optional. Sets the theme for the country list picker.
                                countryListTheme: CountryListThemeData(
                                  // Optional. Sets the border radius for the bottomsheet.
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
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Spacing.width(8),
                        Expanded(
                            child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number'.tr;
                            }
                            if (value.length != 9) {
                              return 'mobile number not eqiual 9 '.tr;
                            }
                          },
                          hintText: 'mobile Number'.tr,
                          controller: cubit.mobileSignUpController,
                          prefixIconData: Icons.phone_android,
                          keyBoard: TextInputType.number,
                        )),
                      ],
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your  Name'.tr;
                        }
                      },
                      keyBoard: TextInputType.text,
                      controller: cubit.nameSignUpController!,
                      hintText: Translator.translate("Name".tr),
                      prefixIconData: Icons.perm_identity,
                    ),
                    CustomTextField(
                      keyBoard: TextInputType.emailAddress,
                      controller: cubit.emailSignUpController,
                      hintText: Translator.translate("Email".tr),
                      prefixIconData: Icons.email_outlined,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xffdcdee3), width: 1.5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          value: cubit.selectedType,
                          hint: Text(Translator.translate("type".tr)),
                          onChanged: (value) {
                            cubit.changeTypeUser(value.toString());
                          },
                          items: <String>[
                            'individual'.tr,
                            'institution'.tr,
                          ].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your  password'.tr;
                        }
                        if (value.length <= 8) {
                          return 'password length at least 8 character'.tr;
                        }
                      },
                      keyBoard: TextInputType.text,
                      controller: cubit.passwordSignUpController!,
                      isPassword: cubit.showPassword,
                      hintText: Translator.translate("password".tr),
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: cubit.showPassword
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      onSuffixIconPress: () {
                        cubit.changeShowPassword();
                      },
                    ),
                    CustomTextField(
                      keyBoard: TextInputType.text,
                      controller: cubit.referrerLinkSignUpController,
                      hintText: Translator.translate("referrerLink".tr),
                      prefixIconData: Icons.link,
                    ),
                    cubit.errorList.length == 0
                        ? Text('')
                        : Container(
                            margin: EdgeInsetsDirectional.only(
                              start: 20,
                            ),
                            height: 90,
                            child: cubit.errorList.isNotEmpty
                                ? ListView.builder(
                                    itemCount: cubit.errorList.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            cubit.errorList[index],
                                            softWrap: false,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : Text(''),
                          ),
                    CommonViews().createButton(
                      title: 'Sign up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.signUp(
                              account_type:
                                  cubit.selectedType == "individual".tr ? 0 : 1,
                              password: cubit.passwordSignUpController.text,
                              email: cubit.emailSignUpController.text,
                              name: cubit.nameSignUpController.text,
                              mobile: cubit.mobileSignUpController.text,
                              referrer_link:
                                  cubit.referrerLinkSignUpController.text);
                          // signUpController.registerUser(
                          //     name: nameTFController!.text,
                          //     email: emailTFController!.text,
                          //     referrerLink: referrerLinkTFController!.text ?? '2',
                          //     mobile: contryCode.toString() + _numberController!.text,
                          //     password: passwordTFController!.text,
                          //     accountType: 1);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          goTo(context: context, screen: SignInScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UserText(
                              title: Translator.translate(
                                      "Already have an account ? signIn")
                                  .tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
