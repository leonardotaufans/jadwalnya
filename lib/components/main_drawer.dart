import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
    this.accountName,
    this.accountEmail,
    this.onTap,
  }) : super(key: key);
  final String accountName;
  final String accountEmail;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: IntrinsicHeight(
                child: SafeArea(
                    child: Column(children: [
                      Column(
                        children: [
                          DrawerHeader(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://breakthrough.org/wp-content/uploads/2018/10/default-placeholder-image-300x300.png"),
                                    //todo:
                                    fit: BoxFit.cover,
                                  )),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 12.0,
                                    left: 6.0,
                                    child: Text(
                                      'Jadwalnya',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(shadows: [
                                        Shadow(
                                            color: Colors.grey.withOpacity(0.23),
                                            offset: Offset(0, 3))
                                      ]),
                                    ),
                                  )
                                ],
                              )),
                          DrawerListCard(
                              leading: Icon(Icons.home),
                              title: Text('Dashboard'),
                              isSelected: true),
                          DrawerListCard(
                              leading: Icon(Icons.calendar_today_rounded),
                              title: Text('Jadwal'),
                              subtitle: Text('OwO'),
                              isSelected: false),
                          DrawerListCard(
                            leading: Icon(Icons.book),
                            title: Text('Tugas'),
                            subtitle: Text('OwO'),
                            isSelected: false,
                            onTap: () {},
                          ),
                          DrawerListCard(
                            leading: Icon(Icons.settings),
                            title: Text('Pengaturan'),
                            subtitle: Text('OwO'),
                            isSelected: false,
                            onTap: () {},
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: DrawerListCard(
                            leading: Icon(Icons.person),
                            title: Text('Leonardo Taufan Sontani'),
                            subtitle: Text('leonardotaufans@gmail.com', style: TextStyle(fontSize: 10.0),),
                            isSelected: false,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ])),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class DrawerListCard extends StatelessWidget {
  const DrawerListCard(
      {Key key,
        this.leading,
        this.title,
        this.subtitle,
        this.onTap,
        this.isSelected = false})
      : super(key: key);
  final Icon leading;
  final Text title;
  final Text subtitle;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade400 : null,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: ListTile(
          leading: Container(height: double.infinity,child: leading),
          subtitle: subtitle,
          title: title,
          onTap: isSelected ? null : onTap),
    );
  }
}
