import 'package:bill_splitter/const/app_colors.dart';
import 'package:bill_splitter/view/home/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MaterialApp(
                builder: (context, child) {
                  final MediaQueryData data = MediaQuery.of(context);
                  return MediaQuery(
                      data: data.copyWith(
                          textScaler: const TextScaler.linear(1.0)),
                      child: child!);
                },
                title: 'Bill Splitter',
                theme: ThemeData(
                    scaffoldBackgroundColor: AppColors.kScaffoldColor),
                debugShowCheckedModeBanner: false,
                scrollBehavior: const ScrollBehavior()
                    .copyWith(physics: const BouncingScrollPhysics()),
                home: HomeView(),
                navigatorKey: navigatorKey,
                scaffoldMessengerKey: scaffoldMessengerKey,
              ));
        });
  }
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
