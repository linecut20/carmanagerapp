import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  BatteryStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Column(
        children: [
          Text('220 mi',
              style: Theme.of(context).
              textTheme.headline3!.
              copyWith(color: Colors.white)),

          Text('63%',
            style: Theme.of(context).
            textTheme.headline5!.
            copyWith(color: Colors.white),
          ),
          Spacer(),
          Text('충전중',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
          ),

          Text('17분 남았습니다'.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('22mi/hr',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text('232v',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
