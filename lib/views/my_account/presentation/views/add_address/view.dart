import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/location_services/location_services.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';

import '../../../../main/widgets/body_add_address_widget.dart';
import '../../../data/add_address/add_address_bloc.dart';
class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key, });
  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController mapController;
  final event = GetAddAddressEvent();
  late LocationService location;
  LatLng?currentPosition;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(24.739841599214106, 46.67391779290244),
      zoom: 19.5,
    );
    location = LocationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BodyAddAddressWidget(currentLocation: currentPosition,
   ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar:const CustomAppBar(text: 'إضافة عنوان',),
      body: GoogleMap(
        onTap: (latLng) {
          currentPosition = latLng;
          setState(() {});
          goTo(latLng);
        },
        zoomControlsEnabled: false,
        markers: {
          if (currentPosition != null)
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(135),
              infoWindow: InfoWindow(title: currentPosition.toString()),
              markerId: const MarkerId("myLocation"),
              position: currentPosition!,
            ),
        },
        mapType: MapType.normal,
        onMapCreated: (controller) {
          mapController = controller;
          updateCurrentLocation();
        },
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }

  void updateCurrentLocation() async {
    try {
      var locationData = await location.getLocation();
      currentPosition = LatLng(
        locationData.latitude!,
        locationData.longitude!,
      );
      setState(() {});
      goTo(currentPosition!);
    } on LocationServiceException catch (e) {
     e.toString();
    } on LocationPermissionException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
       Text("can't select your Location",style: kTextStyle14,)
          ,backgroundColor: kPrimaryColor,
      ));
    } catch (e) {
     e.toString();
    }
  }

  goTo(LatLng latlng) {
    CameraPosition myCurrentLocation = CameraPosition(target: latlng, zoom: 18);
    mapController.animateCamera(CameraUpdate.newCameraPosition(myCurrentLocation));
  }
}
