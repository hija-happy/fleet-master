// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map / Tracking'),
      ),
      body: const Center(
        child: HtmlWidget(
          '''
          <iframe
            width="100%"
            height="100%"
            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d15556.352436368128!2d74.8571!3d12.90205575!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1701354500737!5m2!1sen!2sin"
            frameborder="0"
            style="border:0"
            allowfullscreen
          ></iframe>
          <script>
            // Example polyline
            var coordinates = [
              { lat: 12.90205575, lng: 74.8571 },
              // Add more coordinates as needed
            ];

            var polyline = new google.maps.Polyline({
              path: coordinates,
              geodesic: true,
              strokeColor: '#FF0000',
              strokeOpacity: 1.0,
              strokeWeight: 2
            });

            polyline.setMap(map);
          </script>
          <script>
            // Example marker
            var marker = new google.maps.Marker({
              position: { lat: 12.90205575, lng: 74.8571 },
              map: map,
              title: 'Marker Title'
            });
          </script>
          ''',
        ),
      ),
    );
  }
}
