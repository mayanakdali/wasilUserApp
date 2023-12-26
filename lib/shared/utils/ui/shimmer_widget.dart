import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/custom_package.dart';
import '../../constant/colors.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.borderColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer.fromColors(
              baseColor: AppColors.borderColor,
              highlightColor: Colors.grey.shade300,
              child: Container(
                height: 80,
                width: 80,
                color: Colors.grey,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                  baseColor: AppColors.borderColor,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.70,
                    color: Colors.grey,
                    margin: const EdgeInsets.all(4),
                  )),
              Shimmer.fromColors(
                  baseColor: AppColors.borderColor,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.70,
                    color: Colors.grey,
                    margin: const EdgeInsets.all(4),
                  )),
              Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.shade300,
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.70,
                    color: Colors.grey,
                    margin: const EdgeInsets.all(4),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
