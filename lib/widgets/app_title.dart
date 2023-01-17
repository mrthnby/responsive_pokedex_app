import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: titlleTs,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image(
              image: const AssetImage("assets/pokeball.jpg"),
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.25.sh
                  : 0.25.sw,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
