import 'package:connect/app/views/components/map/map_controller.dart';
import 'package:connect/core/values/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: GetBuilder<MapController>(
          init: MapController(),
          builder: (_) {
            return Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: true,
                  onMapCreated: (controller) {
                    _.mapController.complete(controller);
                  },
                  onTap: (location) => {},
                  markers: _.makers,
                  initialCameraPosition: CameraPosition(
                      target: _.currentLocation != null
                          ? _.currentLocation!.toLatLng()
                          : _.initialLocation,
                      zoom: defaultZoom),
                  mapType: MapType.normal,
                ),
                Positioned(
                  //search input bar
                  top: 10,
                  child: InkWell(
                    onTap: () async {
                      _.search(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title: Text(
                              _.searchLocation,
                              style: const TextStyle(fontSize: 18),
                            ),
                            trailing: const Icon(Icons.search),
                            dense: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //search input bar
                  bottom: 72,
                  right: 10,
                  child: Container(
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.add_location,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () =>
                            {Get.back(result: _.selectedLocation)}),
                  ),
                ),
                Positioned(
                  //search input bar
                  bottom: 132,
                  right: 10,
                  child: Container(
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.keyboard_backspace_rounded,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => {Get.back(result: null)}),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
