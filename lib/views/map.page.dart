import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/user.dart';
import 'package:c4c/views/foodpage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';
import 'package:c4c/provider/foods.dart' as food;

class MapPage extends StatefulWidget {
  @override
  late final User user;
  MapPage(this.user);
  _MapPage createState() => _MapPage(this.user);
}

class _MapPage extends State<MapPage> {
  late final User _user;
  _MapPage(this._user);
  late GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  final TextEditingController _controller = new TextEditingController();
  double lat = -22.9831965;
  double long = -43.2511123;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final food.Foods _foodList = Provider.of(context);

    Future<void> _findLocation(String val) async {
      final query = val;
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
      LatLng position =
          LatLng(first.coordinates.latitude, first.coordinates.longitude);
      mapController.moveCamera(CameraUpdate.newLatLng(position));
    }

    void _createMarkers() async {
      late String query2;
      for (int i = 0; i < _foodList.count; i++) {
        query2 = _foodList.byIndex(i).donor.address.country +
            ' ' +
            _foodList.byIndex(i).donor.address.state +
            ' ' +
            _foodList.byIndex(i).donor.address.city +
            ' ' +
            _foodList.byIndex(i).donor.address.address;

        var address = await Geocoder.local.findAddressesFromQuery(query2);
        var first = address.first;
        LatLng position =
            LatLng(first.coordinates.latitude, first.coordinates.longitude);
        final Marker marker = Marker(
          markerId:
              MarkerId(i.toString() + _foodList.byIndex(i).date.toString()),
          position: position,
          infoWindow: InfoWindow(
            title: _foodList.byIndex(i).name,
            snippet: _foodList.byIndex(i).finality,
          ),
          onTap: () {
            final _foodData = _foodList.byIndex(i);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodPage(_foodData, _user, i)));
          },
        );
        if (mounted) {
          setState(() {
            this.markers.add(marker);
          });
        }
      }
    }

    if (mounted) {
      _createMarkers();
      print(markers.length);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  controller: _controller,
                  decoration:
                      new InputDecoration(hintText: S.of(context).enterAddress),
                ),
              ),
              new IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () {
                    _findLocation(_controller.text);
                  })
            ],
          ),
          Stack(
            children: [
              _googleMap(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 180,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 14.0,
        ),
        markers: markers,
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
          ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
          ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
          ..add(
            Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer()),
          ),
      ),
    );
  }
}
