// import 'dart:io';
// import 'dart:math' as math;
// import 'dart:ui';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_dart/core/config/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // final theme = PlatformDispatcher.instance.platformBrightness;
  // print("theme : $theme");

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey,

    // statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    // systemStatusBarContrastEnforced: false,

    // systemNavigationBarContrastEnforced: true,
    // systemNavigationBarDividerColor: Colors.red,
    // systemNavigationBarIconBrightness: Brightness.light,
  ));
  final appRoute = AppRouter();
  // runApp(HomePageResponsive());
  runApp(
    MaterialApp.router(
      routerConfig: appRoute.config(),
    ),
  );
}

class FlutterViewCustom {
  // FlutterViewCustom(this.FlutterView);
}

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {

    // final generatedColor = math.Random().nextInt(Colors.primaries.length);
    return SafeArea(child: ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, ScreenType screenType) {
        return MaterialApp(
          // scrollBehavior: const ScrollBehavior().copyWith(
          //     physics: const ClampingScrollPhysics(
          //         parent: RangeMaintainingScrollPhysics())),
          home: SafeArea(
            child: Scaffold(
              // appBar: AppBar(title: Text("home"),),
              body: Stack(children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.red,
                        )
                      ],
                      // children: List<Widget>.generate(
                      //   15,
                      //   (index) => Container(
                      //     height: 100,
                      //     width: 100,
                      //     color: Colors.primaries[generatedColor],
                      //   ),
                      // ),
                    ),
                  ),
                ),
                const BottomSheetPOC(),
              ]),
            ),
          ),
        );
      },
    ));
  }
}

class AdaptiveHeight extends StatefulWidget {
  const AdaptiveHeight({super.key});

  @override
  State<AdaptiveHeight> createState() => _AdaptiveHeightState();
}

class _AdaptiveHeightState extends State<AdaptiveHeight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 50.h,
        )
      ],
    );
  }
}

class BottomSheetPOC extends StatefulWidget {
  const BottomSheetPOC({super.key});

  @override
  State<BottomSheetPOC> createState() => _BottomSheetPOCState();
}

class _BottomSheetPOCState extends State<BottomSheetPOC> {
  final draggableScrollableController = DraggableScrollableController();
  double panScreenPercentage = 0;
  final double _snapSizeMultiplier = 10.h;
  List<double> _snapSized = [];

  @override
  void initState() {
    super.initState();
    // print("snap : $_snapSizeMultiplier");
    // print("device : ${Device.boxConstraints}");
    final maxHeight = Device.boxConstraints.maxHeight;
    final multiplier = (maxHeight / _snapSizeMultiplier) / 100;
    _snapSized = [multiplier, multiplier * 2, multiplier * 3];
    listenToDrag();
  }

  listenToDrag() async {
    // final platform = Platform.operatingSystem;
    // print("platform $platform");
    draggableScrollableController.addListener(() {
      // final size = draggableScrollableController.size;
      // print("dragController size : $size");
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);
    // final viewInsets = MediaQuery.of(context).viewInsets;
    // final padding = MediaQuery.of(context).padding;
    // final viewPadding = MediaQuery.of(context).viewPadding;
    // print("view insets : $viewInsets \n"
    //     "padding : $padding \n"
    //     "view padding : $viewPadding \n");

    // print("size : ${mediaQueryData.size}");
    return Scaffold(
      body: DraggableScrollableSheet(
        controller: draggableScrollableController,
        minChildSize: _snapSized.first,
        initialChildSize: _snapSized.elementAt(1),
        maxChildSize: _snapSized.last,
        snapSizes: _snapSized,
        snap: true,
        shouldCloseOnMinExtent: false,
        builder: (BuildContext context, ScrollController scrollController) {
          // MediaQueryData dssBuilderContext = MediaQuery.of(context);
          // print("builderContext");
          // print("size : ${[dssBuilderContext.size]}");
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              // print("overscroll");
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        constraints: BoxConstraints(
                            maxHeight: _snapSizeMultiplier,
                            minHeight: _snapSizeMultiplier),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Hello there"),
                            Text("Hello there"),
                            Text("Hello there"),
                            Text("Hello there"),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        constraints: BoxConstraints(
                            maxHeight: _snapSizeMultiplier,
                            minHeight: _snapSizeMultiplier),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List<Widget>.generate(
                              4,
                              (index) => Container(
                                    color: Colors.white,
                                    // padding: const EdgeInsets.all(4),
                                    width: 75,
                                    height: 75,
                                  )),
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        constraints: BoxConstraints(
                            maxHeight: _snapSizeMultiplier,
                            minHeight: _snapSizeMultiplier),
                        alignment: Alignment.bottomLeft,
                        child: const Text("THere"),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

class OverscrollCustomBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
