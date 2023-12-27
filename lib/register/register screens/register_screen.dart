import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasil/register/register%20screens/signin_screen.dart';
import 'package:wasil/register/register%20screens/signup_screen.dart';
import '../../../shared/Components/methods.dart';
import '../../shared/constant/colors.dart';
import '../../shared/services/AppLocalizations.dart';
import '../register bloc/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 224,
                ),
                child: SvgPicture.asset(
                  'assets/images/Logo.svg',
                  width: 123,
                  height: 48,
                ),
              ),
              const SizedBox(
                height: 92,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 52),
                child: InkWell(
                  onTap: () {
                    goTo(context: context, screen: SignInScreen());
                    print("signin".tr);
                  },
                  child: Container(
                    width: 283,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 27),
                            child: Text(Translator.translate("Sign in".tr),
                                style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 52),
                child: InkWell(
                  onTap: () {
                    print("signup");
                    goTo(context: context, screen: SignUpScreen());
                  },
                  child: Container(
                    width: 283,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 27),
                            child: Text(Translator.translate("Sign Up".tr),
                                style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
