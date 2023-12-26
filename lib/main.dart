import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wasil/register/register%20bloc/register_cubit.dart';
import 'package:wasil/shared/Components/services.dart';
import 'package:wasil/shared/bloc%20observer/bloc_observer.dart';
import 'package:wasil/shared/locale/locale.controller.dart';
import 'package:wasil/shared/locale/translation.dart';
import 'package:wasil/shared/network/local/shared_prefrenses_helper.dart';
import 'package:wasil/shared/network/remot/dio_helper.dart';
import 'package:wasil/shared/services/PushNotificationsManager.dart';
import 'package:wasil/shared/services/f.dart';
import 'package:wasil/splash%20management/splash%20screen/splash_screen.dart';
import 'package:wasil/splash%20management/splash%20bloc/splashscreen_cubit.dart';

import 'address managment/address bloc/cubit.dart';
import 'firebase_options.dart';
import 'home management/home bloc/cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //by ready firebase
  DioHelper.init();
  await CachHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  FirebaseMessaging.onBackgroundMessage((message) async {
    print("Handling background message: ");
    await FlutterNotificationView().firebaseMessagingBackgroundHandler(message);
  });

  await initialServices();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    // String langCode = await AllLanguage.getLanguage();
    //await Translator.load(langCode);
    blocObserver:
    Bloc.observer = MyBlocObserver();
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  initFCM() async {
    PushNotificationsManager pushNotificationsManager =
        PushNotificationsManager();
    await pushNotificationsManager.init();
    FirebaseMessaging.onBackgroundMessage((message) async {
      print("Handling background message: ");
      await FlutterNotificationView()
          .firebaseMessagingBackgroundHandler(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 844),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SplashscreenCubit()..initState()),
            BlocProvider(create: (_) => RegisterCubit()),
            BlocProvider(
                create: (_) => HomeCubit()
                  ..getBanner()
                  ..getUserAddresses()),
            BlocProvider(create: (_) => AddressCubit())
          ],
          child: GetMaterialApp(
              locale: controller.language,
              //theme:  AppTheme.getThemeFromThemeMode(value.themeMode()),
              translations: MyTranslation(),
              debugShowCheckedModeBanner: false,
              home: SplashScreen()),
        );
      }),
    );
  }
}
