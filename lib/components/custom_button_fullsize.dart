import 'package:flutter/material.dart';

import '../constants.dart';

class FlexingButton extends StatelessWidget {
  const FlexingButton({
    Key key,
    this.child,
    this.icon,
    this.color,
    this.onTap,
    this.splashColor,
  }) : super(key: key);

  final Text child;
  final Icon icon;
  final Color color;
  final Color splashColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        elevation: 1,
        color: color,
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: splashColor,
          onTap: onTap,
          child: Ink(
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 64,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: jDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: icon,
                            padding: EdgeInsets.only(right: jDefaultPadding),
                          ),
                          child
                        ],
                      ),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
