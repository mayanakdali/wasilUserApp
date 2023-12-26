import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../shared/constant/colors.dart';
import '../../shared/locale/locale.controller.dart';
import '../home bloc/cubit.dart';
import '../home bloc/state.dart';
import 'address_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var cubit = HomeCubit.get(context);
    // AddressController controllerAddress = Get.put(AddressController());
    LocaleController controller = Get.put(LocaleController());
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              drawer: const Drawer(
                backgroundColor: AppColors.primaryColor,
                width: 250,
              ),
              appBar: AppBar(
                  backgroundColor: AppColors.backgroundColor,
                  actionsIconTheme: const IconThemeData(color: Colors.black),
                  iconTheme: const IconThemeData(color: Colors.black),
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: InkWell(
                          onTap: () {
                            // UserNavigator.of(context).push(const OrderDetail());
                          },
                          child: const Icon(Icons.shopping_bag)),
                    ),
                  ]),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressWidget(),
                  cubit.banners.isEmpty
                      ? Image.asset(
                          'assets/images/mobil_home.png',
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        )
                      : SizedBox(
                          height: 150,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                cubit.banners[index].url.toString(),
                                fit: BoxFit.fill,
                              );
                            },
                            autoplay: true,
                            itemCount: cubit.banners.length,
                            pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                    color: Colors.white,
                                    activeColor: AppColors.primaryColor)),
                            // control: const SwiperControl(color: Colors.black),
                          ),
                        ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemCount: cubit.categories.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {},
                          child: Container(
                              width: double.infinity,
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      blurRadius: 8,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              // color: Colors.black,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                      width: 100.w,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(cubit
                                                .categories[index].imageUrl
                                                .toString())),
                                      )),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Text(
                                    controller.language!.languageCode == 'en'
                                        ? '${cubit.categories[index].title?.en}'
                                        : '${cubit.categories[index].title?.ar}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(color: Color(0xff15cb95)))
                ],
              ));
        });
  }
}
