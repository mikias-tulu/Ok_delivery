import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:ok_delivery/providers/map_provider.dart';

import 'drawer/custom_side_drawer.dart';
import 'map_screen/confirm_pickup.dart';
import 'map_screen/driver_arrived.dart';
import 'map_screen/driver_arriving.dart';
import 'map_screen/floating_drawer_bar_button.dart';
import 'map_screen/reached_destination.dart';
import 'map_screen/search_driver.dart';
import 'map_screen/trip_started.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapProvider mapProvider;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    Provider.of<MapProvider>(context, listen: false).initializeMap(
      scaffoldKey: scaffoldKey,
    );

    @override
    void initState() {
      super.initState();
      mapProvider = MapProvider();
      mapProvider.initializeMap();
    }

    return Consumer<MapProvider>(
      builder: (BuildContext context, MapProvider mapProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          body: SafeArea(
            child: Stack(
              children: [
                mapProvider.cameraPos != null
                    ? GoogleMap(
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                        onMapCreated: mapProvider.onMapCreated,
                        initialCameraPosition: mapProvider.cameraPos!,
                        compassEnabled: true,
                        onTap: mapProvider.onTap,
                        markers: mapProvider.markers!,
                        polylines: mapProvider.polylines!,
                        padding: const EdgeInsets.only(bottom: 90),
                      )
                    : (mapProvider.deviceLocation != null
                        ? GoogleMap(
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            zoomControlsEnabled: false,
                            onMapCreated: mapProvider.onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                mapProvider.deviceLocation!.latitude,
                                mapProvider.deviceLocation!.longitude,
                              ),
                              zoom: 15,
                            ),
                            compassEnabled: true,
                            onTap: mapProvider.onTap,
                            markers: mapProvider.markers!,
                            polylines: mapProvider.polylines!,
                            padding: const EdgeInsets.only(bottom: 90),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),

                ConfirmPickup(mapProvider: mapProvider),
                SearchDriver(mapProvider: mapProvider),
                DriverArriving(mapProvider: mapProvider),
                DriverArrived(mapProvider: mapProvider),
                TripStarted(mapProvider: mapProvider),
                ReachedDestination(mapProvider: mapProvider),
                // FloatingDrawerBarButton(scaffoldKey: scaffoldKey),
              ],
            ),
          ),
        );
      },
    );
  }
}
