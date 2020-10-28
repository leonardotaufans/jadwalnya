import 'package:flutter/material.dart';

import '../constants.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key key,
    @required this.size,
    @required this.theme,
    @required this.title, @required this.subtitle,
  }) : super(key: key);

  final Size size;
  final ThemeData theme;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: jDefaultPadding * 2.5),
      height: size.height * 0.3 +20,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.3 + 20,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(80))),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          jDefaultPadding - 10,
                          jDefaultPadding + 10,
                          jDefaultPadding - 10,
                          jDefaultPadding),
                      alignment: Alignment.topLeft,
                      child: FlatButton.icon(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        label: Text(
                          'Back',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: theme.canvasColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20))),
                            child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  title,
                                  style: theme.textTheme.overline
                                      .copyWith(fontSize: 24),
                                )),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: jDefaultPadding),
                            child: Text(
                              subtitle,
                              style: theme.textTheme.headline6
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                  ],
                ),
                // Positioned(left: 32, top: size.height * 0.2 + jDefaultPadding,child: FlatButton(child: Text('Lupa Password?'), onPressed: () {},))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
