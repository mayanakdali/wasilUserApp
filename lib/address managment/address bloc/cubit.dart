import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil/address%20managment/address%20bloc/state.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(AddressInitialState());
  static AddressCubit get(context) => BlocProvider.of(context);

  bool loaded = false;
  // GoogleMapController? mapController;
  //
  // void selectAddress(LatLng selectedAddress) {
  //   emit(AddressSelectedState(selectedAddress));
  // }
}
