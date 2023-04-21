import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ok_delivery/providers/map_provider.dart';
import 'package:ok_delivery/screens/drawer/custom_side_drawer.dart';
import 'package:ok_delivery/screens/map_screen.dart';
import 'package:ok_delivery/screens/map_screen/floating_drawer_bar_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ok_delivery/routes/routes.dart';
import 'package:ok_delivery/utils/custom_color.dart';
import 'package:ok_delivery/utils/custom_style.dart';
import 'package:ok_delivery/utils/dimensions.dart';
import 'package:ok_delivery/utils/strings.dart';
import 'package:ok_delivery/screens/drawer/drawer_menu_screen.dart';
import 'package:ok_delivery/widgets/buttons/default_button.dart';
import 'package:ok_delivery/widgets/custom_appbar_with_menu.dart';
import 'package:ok_delivery/widgets/input/default_input_text_field.dart';
import 'package:ok_delivery/widgets/size.dart';
import 'package:ok_delivery/providers/map_provider.dart';

//search
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:ok_delivery/config/map_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MapProvider mapProvider = MapProvider();
  @override
  void initState() {
    super.initState();
    mapProvider = MapProvider();
  }

  /* Position? currentPosition;
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(8.9806, 38.7578), zoom: 15);

  late final GoogleMapController _mapController;
  Set<Marker> _markers = {}; */
  final TextEditingController promoController = TextEditingController();

  final TextEditingController pickupSearchController = TextEditingController();

  final TextEditingController pickupSearchController2 = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKeyTwo = GlobalKey();

  /* void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  } */
  String location = "Search Location";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Provider.of<MapProvider>(context, listen: false).initializeMap(
      scaffoldKey: scaffoldKey,
    );
    Widget pointText(String text, String boldText) {
      return RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: Dimensions.dialogueTextSize,
            color: Colors.black.withOpacity(0.5),
          ),
          children: <TextSpan>[
            TextSpan(
              text: boldText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget textInput() {
      return TextFormField(
        autofocus: false,
        controller: promoController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onSaved: (value) => promoController.text = value!,
        decoration: InputDecoration(
          hintText: Strings.enterPromo,
          hintStyle: CustomStyle.hintTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
        ),
      );
    }

    Future safeTravels() {
      return Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        title: '',
        content: Container(
          width: 363.w,
          height: 465.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Dimensions.radius,
            ),
          ),
          child: Column(
            mainAxisAlignment: mainStart,
            crossAxisAlignment: crossStart,
            children: [
              addVerticalSpace(31.h),
              SizedBox(
                width: 500.w,
                height: 170.h,
                child: Image.asset("assets/images/home/safe-travel.png"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 19.w,
                  right: 18.9.w,
                ),
                child: Column(
                  mainAxisAlignment: mainStart,
                  crossAxisAlignment: crossStart,
                  children: [
                    Text(
                      Strings.safeTravels,
                      style: CustomStyle.forgotPasswordTitleStyle,
                    ),
                    addVerticalSpace(8.h),
                    Text(
                      Strings.getCoverage,
                      style: CustomStyle.orTextStyle.copyWith(
                        fontSize: Dimensions.dialogueTextSize,
                      ),
                    ),
                    addVerticalSpace(28.h),
                    pointText(
                      Strings.point1,
                      Strings.point1Bold,
                    ),
                    addVerticalSpace(7.h),
                    pointText(
                      Strings.point2,
                      Strings.point2Bold,
                    ),
                    addVerticalSpace(7.h),
                    Text(
                      Strings.learnMore,
                      style: CustomStyle.dialogueTextStyle,
                    ),
                    addVerticalSpace(7.h),
                    SizedBox(
                      width: 324.15.w,
                      height: 55.h,
                      child: DefaultButton(
                          title: Strings.gotIt, onPresssed: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Future discount() {
      return Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        title: '',
        content: Container(
          width: 500.w,
          height: 465.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Dimensions.radius,
            ),
          ),
          child: Column(
              mainAxisAlignment: mainStart,
              crossAxisAlignment: crossStart,
              mainAxisSize: mainMin,
              children: [
                addVerticalSpace(31.h),
                SizedBox(
                  width: 350.w,
                  height: 170.h,
                  child: Image.asset("assets/images/home/discount.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 18.9.w),
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        Strings.addPromo,
                        style: CustomStyle.dialogueTitleTextStyle,
                      ),
                      addVerticalSpace(10.4.h),
                      textInput(),
                      addVerticalSpace(7.1.h),
                      Center(
                        child: Text(
                          Strings.promoNotApplied,
                          style: CustomStyle.dialogueSubtitleTextStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          Strings.addCodeManually,
                          textAlign: TextAlign.center,
                          style:
                              CustomStyle.forgotPasswordSubtitleStyle.copyWith(
                            fontSize: Dimensions.dialogueTextSize,
                          ),
                        ),
                      ),
                      addVerticalSpace(16.h),
                      SizedBox(
                        width: 324.15.w,
                        height: 55.h,
                        child: DefaultButton(
                            title: Strings.apply, onPresssed: () {}),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKeyTwo,
        drawer: const CustomSideDrawer(),
        body: Stack(
          children: [
            const MapScreen(),
            Positioned(
              top: 30,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  _scaffoldKeyTwo.currentState!.openDrawer();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child:
                      const Icon(Icons.menu, size: 26, color: Colors.black54),
                ),
              ),
            ),

            /* GoogleMap(
              // assign the initial camera position
              initialCameraPosition: _initialPosition,
              // assign the GoogleMapController
              onMapCreated: _onMapCreated,
              // assign the set of markers to be displayed on the map
              markers: _markers,
            ), */
            /* CustomAppbarWithMenu(
              gapBetweenBackButtonAndTitle: 0,
              gapBetweenTitlAndAppbar: 0,
              title: "",
              onPress: () {
                _key.currentState!.openDrawer();
              },
            ), */
            Positioned(
              bottom: 0,
              child: GestureDetector(
                child: Container(
                  height: 190.h,
                  width: 414.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius),
                      topRight: Radius.circular(Dimensions.radius),
                    ),
                  ),
                  child: Column(
                    children: [
                      addVerticalSpace(15.h),
                      GestureDetector(
                        onTap: () => _openBottomSheetModal(context),
                        child: Container(
                          width: 49.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: CustomColor.secondaryColor,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius,
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(15.h),
                      //orginal textbox
                      /*  Padding(
                        padding: EdgeInsets.only(
                          left: 36.0.w,
                          right: 35.2.w,
                        ),
                        child: SizedBox(
                          height: 55.h,
                          child: DefaultTextInputField(
                            controller: pickupSearchController,
                            hintText: Strings.searchDestination,
                            keyboardType: TextInputType.text,
                            icon: const Icon(
                              Icons.location_on,
                              color: CustomColor.primaryColor,
                            ),
                          ),
                        ),
                      ), */
                      //SizedBox(height: 20.h),
                      /* Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.0.w),
                        child: SizedBox(
                          width: 342.76.w,
                          height: 55.h,
                          child: DefaultButton(
                            title: Strings.setDestination,
                            onPresssed: () {
                              Get.toNamed(Routes.setDestinationScreen);
                            },
                          ),
                        ),
                      ), */
                      //search autoconplete input
                      InkWell(
                        onTap: () async {
                          var place = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: googleMapApi,
                              mode: Mode.overlay,
                              types: [],
                              strictbounds: false,
                              components: [Component(Component.country, 'et')],
                              //google_map_webservice package
                              onError: (err) {
                                print(err);
                              });

                          if (place != null) {
                            setState(() {
                              location = place.description.toString();
                            });

                            //form google_maps_webservice package
                            final plist = GoogleMapsPlaces(
                              apiKey: googleMapApi,
                              apiHeaders:
                                  await const GoogleApiHeaders().getHeaders(),
                              //from google_api_headers package
                            );
                            String placeid = place.placeId ?? "0";
                            final detail =
                                await plist.getDetailsByPlaceId(placeid);
                            final geometry = detail.result.geometry!;
                            final lat = geometry.location.lat;
                            final lang = geometry.location.lng;
                            var newlatlang = LatLng(lat, lang);

                            //move map camera to selected place with animation

                            mapProvider.animateCameraToPos(
                              //CameraUpdate.newCameraPosition(
                              // CameraPosition(target:
                              newlatlang,
                              15,

                              //),
                              //),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 36.0.w,
                            right: 35.2.w,
                          ),
                          child: Card(
                            child: Container(
                              height: 55.h,
                              margin: EdgeInsets.only(right: 17.w),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * 0.5),
                              ),
                              padding: const EdgeInsets.all(0),
                              //width: MediaQuery.of(context).size.width - 40,
                              child: ListTile(
                                title: Text(
                                  location,
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Container(
                                  width: 60.w,
                                  height: 55.h,
                                  // margin: EdgeInsets.only(right: 17.w),
                                  decoration: BoxDecoration(
                                    color: CustomColor.textInputIconBgColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius * 0.5),
                                  ),
                                  child: const Icon(
                                    Icons.location_on,
                                    color: CustomColor.primaryColor,
                                  ),
                                ),
                                dense: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.0.w),
                        child: SizedBox(
                          width: 342.76.w,
                          height: 55.h,
                          child: DefaultButton(
                            title: Strings.continuetext,
                            onPresssed: () {
                              Get.toNamed(Routes.destinationScreen);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _openBottomSheetModal(context);
                },
              ),
            ),
            /* Positioned(
              bottom: 180.h,
              right: 21.w,
              child: SizedBox(
                width: 67.w,
                height: 67.h,
                child: GestureDetector(
                  onTap: () {
                    _getCurrentLocation(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: /* Icon(
                      Icons.my_location,
                      color: CustomColor.customIconColorTwo,
                    ), */

                        currentPosition != null
                            ? const Icon(
                                Icons.my_location,
                                color: CustomColor.customIconColorTwo,
                              )
                            : const Icon(
                                Icons.my_location,
                                color: Colors.red,
                              ),
                  ),
                ),
              ),
            ), */
            Positioned(
              bottom: 267.h,
              right: 21.w,
              child: GestureDetector(
                onTap: discount,
                child: SizedBox(
                  width: 67.w,
                  height: 67.h,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.percent,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 354.h,
              right: 21.w,
              child: GestureDetector(
                onTap: safeTravels,
                child: SizedBox(
                  width: 67.w,
                  height: 67.h,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.wallet_outlined,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openBottomSheetModal(BuildContext context) {
    return showCupertinoModalBottomSheet(
      //expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => bottomNav(),
    );
  }

  Widget bottomNav() {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15.h),
            Container(
              width: 49.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: CustomColor.secondaryColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: SizedBox(
                height: 55.h,
                child: DefaultTextInputField(
                  controller: pickupSearchController,
                  hintText: Strings.searchDestination,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    color: CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: SizedBox(
                height: 55.h,
                child: DefaultTextInputField(
                  controller: pickupSearchController2,
                  hintText: Strings.setPickUpLocation,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    color: CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: SizedBox(
                width: 342.76.w,
                height: 55.h,
                child: DefaultButton(
                  title: Strings.setDestination,
                  onPresssed: () {
                    Get.toNamed(Routes.setDestinationScreen);
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: SizedBox(
                width: 342.76.w,
                height: 55.h,
                child: DefaultButton(
                  title: Strings.setPickUpLocation,
                  onPresssed: () {
                    Get.toNamed(Routes.setPickupLocationScreen);
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: SizedBox(
                width: 342.76.w,
                height: 55.h,
                child: DefaultButton(
                  title: Strings.continueText,
                  onPresssed: () {
                    Get.toNamed(Routes.sendRequestScreen);
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
