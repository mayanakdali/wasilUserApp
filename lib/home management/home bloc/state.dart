import '../../model/address.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class SelectAddressState extends HomeStates {
  final String selectedAddress;

  SelectAddressState(this.selectedAddress);
}

class SelectAddressDetailsState extends HomeStates {
  final UserAddress selectedAddressDetails;

  SelectAddressDetailsState(this.selectedAddressDetails);
}

class GetCategoriesLoadingState extends HomeStates {}

class GetCategoriesSuccessState extends HomeStates {}

class GetCategoriesErrorState extends HomeStates {}

class GetBannerLoadingState extends HomeStates {}

class GetBannerSuccessState extends HomeStates {}

class GetBannerErrorState extends HomeStates {}

class GetUserAddressLoadingState extends HomeStates {}

class GetUserAddressSuccessState extends HomeStates {}

class GetUserAddressErrorState extends HomeStates {}
