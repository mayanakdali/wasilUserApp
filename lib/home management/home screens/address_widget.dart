import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/address.dart';
import '../../shared/constant/colors.dart';
import '../home bloc/cubit.dart';
import '../home bloc/state.dart';

class AddressWidget extends StatelessWidget {
  AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivering To".tr,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Selected Address",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    onSelected: (selectedItem) {
                      if (selectedItem == 'add_new_address'.tr) {
                        // Handle adding a new address here
                        // You can dispatch an event or navigate to a new screen
                      } else {
                        // Handle selecting an existing address
                        HomeCubit.get(context)
                            .emit(SelectAddressState(selectedItem));
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      final List<PopupMenuItem<String>> items = [];

                      // Add the "Add New Address" option
                      items.add(
                        PopupMenuItem<String>(
                          value: 'add_new_address'.tr,
                          child: Text('Add New Address'.tr),
                        ),
                      );

                      // Add existing addresses as options
                      for (UserAddress address
                          in HomeCubit.get(context).userAddress) {
                        items.add(
                          PopupMenuItem<String>(
                            value:
                                '${address.type == 0 ? 'Home'.tr : address.type == 1 ? 'Work'.tr : 'Other'.tr} ${address.buildingNumber}',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ${address.type == 0 ? 'Home'.tr : address.type == 1 ? 'Work'.tr : 'Other'.tr}, ${address.buildingNumber}',
                                  style: const TextStyle(
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                const Divider(
                                  color: AppColors.backgroundColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return items;
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
