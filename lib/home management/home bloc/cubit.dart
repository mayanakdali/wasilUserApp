import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/home%20management/home%20bloc/state.dart';
import '../../../shared/end points/end_points1.dart';
import '../../../shared/network/remot/dio_helper.dart';
import '../../model/address.dart';
import '../../model/banner.dart';
import '../../model/category_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  String selectedAddress = '';

  // Get Home Categories
  List<CategoriesModel> categories = [];
  getHomeCategories() {
    categories = [];
    emit(GetCategoriesLoadingState());
    DioHelper.getData(url: getCategories).then((value) {
      value.data.forEach((element) {
        categories.add(CategoriesModel.fromJson(element));
        print(element);
      });
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetCategoriesErrorState());
    });
  }

  // get home banners
  Banner banners = Banner();
  getBanner() {
    emit(GetBannerLoadingState());
    DioHelper.getData(url: getBanners).then((value) {
      banners = Banner.fromJson(value.data);
      print(value.data);
      emit(GetBannerSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetBannerErrorState());
    });
  }

  // get user address
  List<UserAddress> userAddress = [];
  getUserAddresses() {
    userAddress = [];
    emit(GetUserAddressLoadingState());
    DioHelper.getData(url: getUserAddress).then((value) {
      value.data.forEach((element) {
        userAddress.add(UserAddress.fromJson(element));
        print(element);
      });
      emit(GetUserAddressSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserAddressErrorState());
    });
  }
}
