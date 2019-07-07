// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_app_sample/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    // TODO: Once the build() function is inside the State object,
    // you'll have to reference this using `widget.units`
    final unitWidgets = widget.units.map((Unit unit) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print(unit.name);
          },
          child: Container(
            color: widget.color,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  unit.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  'Conversion: ${unit.conversion}',
                  style: Theme.of(context).textTheme.subhead,
                )
              ],
            ),
          ),
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
