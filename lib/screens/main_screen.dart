import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadwalnya/constants.dart';
import 'package:jadwalnya/components/sqlite_helper.dart';
import 'package:jadwalnya/models/schedule.dart';
import '../components/main_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  var accountName = 'Leonardo Taufan Sontani';
  var accountEmail = 'leonardotaufans@gmail.com';
  SqliteHelper sqliteHelper = SqliteHelper();
  Future<List<Schedule>> future;

  @override
  void initState() {
    super.initState();
    Schedule sched =
        new Schedule('1234', 'null', 'OwO', '12:34', '23:45', 'si4001-owo', 4);
    sqliteHelper.insertSchedule(sched);
    updateListView();
  }

  void updateListView() {
    setState(() {
      future = sqliteHelper.schedules();
    });
  }

  @override
  Widget build(BuildContext context) {
    Schedule sched2 = new Schedule('1234', 'null',
        'Initialize Schedule Namba Wan', '12:34', '23:45', 'si4001-owo', 4);
    Schedule sched3 = new Schedule('1235', 'null',
        'Initialize Schedule Namba Tyu', '12:34', '23:45', 'si4001-owo', 0);
    Schedule sched4 = new Schedule('1236', 'null',
        'Initialize Schedule Namba Twii', '12:34', '23:45', 'si4001-owo', 0);

    sqliteHelper.insertSchedule(sched2);
    sqliteHelper.insertSchedule(sched3);
    sqliteHelper.insertSchedule(sched4);
    updateListView();
    ThemeData theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        drawerEdgeDragWidth: 25.0,
        drawer: MainDrawer(
          accountEmail: accountEmail,
          accountName: accountName,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Test',
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            jDefaultPadding - 10,
                            0,
                            jDefaultPadding - 10,
                            jDefaultPadding),
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36),
                                bottomRight: Radius.circular(36))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 0,
                                  color: theme.accentColor,
                                  child: IconButton(
                                      icon: Icon(Icons.menu,
                                          color: theme.buttonColor),
                                      onPressed: () => scaffoldKey.currentState
                                          .openDrawer()),
                                ),
                                Spacer(),
                                Card(
                                  elevation: 0,
                                  color: theme.accentColor,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.notifications,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                            Divider(color: Colors.transparent,),
                            Text('Halo, $accountName', style: theme.textTheme.headline5.copyWith(color: Colors.white),),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                HeaderOverview(
                                    title: 'Tugas tersisa', amount: 0),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                ),
                                HeaderOverview(
                                    title: 'Jadwal Hari Ini', amount: 0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: jDefaultPadding),
                      padding:
                          EdgeInsets.symmetric(horizontal: jDefaultPadding),
                      child: Column(
                        children: [
                          Text('Jadwalnya apa hari ini?',
                              style: theme.textTheme.caption
                                  .copyWith(fontSize: 16)),
                          FutureBuilder(
                              future: future,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    height: size.height * 0.3 + jDefaultPadding * 2,
                                    child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: snapshot.data
                                            .map<Widget>((list) => tallCard(list))
                                            .toList()),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              })
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));

  }

  Card tallCard(Schedule schedule) {
    Size size = MediaQuery.of(context).size;
    int assignment = schedule.assignment;
    var theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: jDefaultPadding / 3),
      child: Stack(
        children: [
          Material(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            elevation: 2,
            child: Ink(
              child: InkWell(
                onTap: () {
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(schedule.uidSched)));
                },
                onLongPress: () {},
                child: Container(
                  alignment: Alignment.topLeft,
                  height: size.height * 0.3 + jDefaultPadding,
                  width: size.width * 0.3 + jDefaultPadding,
                  child: Column(
                    children: [
                      Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4)),
                            child:
                                Image.asset('assets/images/placeholder.jpg')),
                      ]),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(
                            horizontal: jDefaultPadding / 2),
                        child: Column(
                          children: [
                            Text(
                              schedule.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  schedule.timeBegin,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(' - '),
                                Text(
                                  schedule.timeEnd,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            Divider(),
                            Text(
                              schedule.classRoom,
                              style: theme.textTheme.caption,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              height: jDefaultPadding,
              child: CircleAvatar(
                backgroundColor: assignment > 0 ? Colors.red : Colors.white,
                child: Text(
                  assignment.toString(),
                  style: TextStyle(
                      color: assignment == 0 ? Colors.black : Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderOverview extends StatelessWidget {
  const HeaderOverview({
    Key key,
    this.amount,
    this.title,
  }) : super(key: key);
  final String title;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: '$amount\n',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white)),
        TextSpan(
            text: title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white70)),
      ]),
    );
  }
}
