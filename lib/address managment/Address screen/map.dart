// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class MapSelectionScreen extends StatefulWidget {
//   @override
//   _MapSelectionScreenState createState() => _MapSelectionScreenState();
// }
//
// class _MapSelectionScreenState extends State<MapSelectionScreen> {
//   late GoogleMapController mapController;
//   late LatLng currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     Location location = Location();
//
//     try {
//       LocationData userLocation = await location.getLocation();
//       setState(() {
//         currentLocation =
//             LatLng(userLocation.latitude!, userLocation.longitude!);
//       });
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Select Address on Map"),
//       ),
//       body: GoogleMap(
//         onMapCreated: (controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//         myLocationEnabled: true, // Show the user's location
//         initialCameraPosition: CameraPosition(
//           target: currentLocation,
//           zoom: 15.0,
//         ),
//         markers: currentLocation != null
//             ? {
//                 Marker(
//                   markerId: MarkerId('userLocation'),
//                   position: currentLocation,
//                   infoWindow: InfoWindow(title: 'Your Location'),
//                 ),
//               }
//             : {},
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle the FAB press
//         },
//         child: Icon(Icons.check),
//       ),
//     );
//   }
// }
