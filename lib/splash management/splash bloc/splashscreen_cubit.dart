import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../onboarding/onboarding_screen.dart';
import '../../shared/network/local/shared_prefrenses_helper.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  SplashscreenCubit() : super(SplashscreenInitial());

  static SplashscreenCubit get(context) => BlocProvider.of(context);

  void initState() {
    print("test");
    Future.delayed(const Duration(seconds: 3), () {
      checkOnBoard();
    });
  }

  void checkOnBoard() async {
    String? isChecked = CachHelper.getData(key: "isChecked");
    String? token = CachHelper.getData(key: "token");

    if (isChecked == null) {
      CachHelper.saveData(key: 'isChecked', value: 'true');
      emit(OnBoardingScreenState());
    } else {
      if (token == null) {
        print('token null');
        emit(RegisterScreenState());
      } else {
        print('token not  null');
        emit(HomeScreenState());
      }
    }
  }
}
