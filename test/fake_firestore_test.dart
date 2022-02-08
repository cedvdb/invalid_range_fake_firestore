// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fake_firestore_test/main.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

void main() async {
  final firestore = FakeFirebaseFirestore();
  GeoFirePoint point = GeoFirePoint(40, 40);
  firestore.collection('test').doc('id-1').set({
    'data': 1,
    'position': point.data,
  });

  test('should get documents', () {
    final result = GeoFireCollectionRef(firestore.collection('test'))
        .within(center: GeoFirePoint(40, 40), radius: 2000, field: 'position');
    expect(result, emits(isA<List>));
  });
}
