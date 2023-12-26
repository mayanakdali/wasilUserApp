import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/constant/colors.dart';
import '../../shared/utils/helper/size.dart';
import '../../shared/utils/ui/text_feild_address.dart';
import '../address bloc/cubit.dart';
import '../address bloc/state.dart';
import 'map.dart';

class AddAddress extends StatelessWidget {
  AddAddress({Key? key}) : super(key: key);
  TextEditingController nameTFController = TextEditingController();
  TextEditingController streetTFController = TextEditingController();
  TextEditingController buildingNumberTFController = TextEditingController();
  TextEditingController cityTFController = TextEditingController();
  TextEditingController apartmentTFController = TextEditingController();

  void _openGoogleMaps(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => MapSelectionScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var cubit = AddressCubit.get(context);
    return BlocConsumer<AddressCubit, AddressStates>(
        listener: (context, state) {
      // if (state is AddressSelectedState) {
      //   streetTFController.text = "Selected Street";
      //   cityTFController.text = "Selected City";
      // }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            //  iconTheme: const IconThemeData(color: Colors.black),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            elevation: 0,
            title: Text("Add Address".tr,
                style: TextStyle(
                  color: const Color(0xff373636),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                )),
            backgroundColor: AppColors.backgroundColor,
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                    padding: Spacing.fromLTRB(24, 8, 24, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormFieldAddress(
                            hintText: 'Name Address'.tr,
                            controller: nameTFController,
                            prefixIconData: Icons.display_settings),
                        TextFormFieldAddress(
                          hintText: 'street_name'.tr,
                          readOnly: true,
                          controller: streetTFController,
                          prefixIconData: Icons.location_on_sharp,
                        ),
                        TextFormFieldAddress(
                          hintText: 'building_number'.tr,
                          controller: buildingNumberTFController,
                          prefixIconData: Icons.add_location_alt,
                        ),
                        TextFormFieldAddress(
                          readOnly: true,
                          controller: cityTFController,
                          prefixIconData: Icons.location_on_sharp,
                          hintText: 'city'.tr,
                        ),
                        TextFormFieldAddress(
                          readOnly: true,
                          controller: apartmentTFController,
                          prefixIconData: Icons.onetwothree_outlined,
                          hintText: 'apartment_number'.tr,
                        ),
                      ],
                    )),
                Text('OR'),
                InkWell(
                    onTap: () {
                      _openGoogleMaps(context);
                    },
                    child: Text('Set point on map')),
              ],
            ),
          ));
    });
  }
}
