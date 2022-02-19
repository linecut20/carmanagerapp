import 'package:carmanagerapp/model/TyrePsi.dart';
import 'package:flutter/material.dart';

import 'constains.dart';

class TyrePsiCard extends StatelessWidget {
  TyrePsi tyrePsi;

  TyrePsiCard({Key? key, required this.tyrePsi}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(
              color: tyrePsi.isLowPressure ? redColor : primaryColor,
              width: 3
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                text: tyrePsi.psi.toString(),
                children: [
                  TextSpan(
                      text: ' pis',
                      style: TextStyle(fontSize: 20)
                  )
                ]
            ),
          ),
          SizedBox(height: defaultPadding),
          Text('${tyrePsi.temp} \u2103',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Opacity(
            opacity: tyrePsi.isLowPressure ? 1 : 0,
            child: Text('LOW PRESSURE',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
