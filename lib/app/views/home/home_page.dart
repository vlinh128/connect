import 'package:connect/app/data/repository_impl/activity_repo_impl.dart';
import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:connect/app/views/home/home_controller.dart';
import 'package:connect/core/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: GetBuilder<HomeController>(
          init: HomeController(Get.find<ActivityRepoImpl>()),
          builder: (_) {
            return Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: true,
                  onMapCreated: (controller) {
                    _.mapController.complete(controller);
                  },
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
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
