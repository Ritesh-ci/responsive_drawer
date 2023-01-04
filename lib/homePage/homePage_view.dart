import 'package:flutter/material.dart';
import 'package:responsive_drawer/auth/login_view.dart';
import 'package:responsive_drawer/base/base_view.dart';
import 'package:responsive_drawer/common/constant.dart';
import 'package:responsive_drawer/graph/graph_view.dart';
import 'package:responsive_drawer/homePage/home_viewmodel.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class MyHomePage extends StatefulWidget {
  final String title;
  final drawerItems = [
    DrawerItem(constString.dashboard, Icons.home),
    DrawerItem(constString.registration, Icons.recycling_outlined),
    DrawerItem(constString.participation, Icons.paragliding),
  ];

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const GraphView();
      case 1:
        return LoginView();
      case 2:
        return const GraphView();

      default:
        return const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    isMenuFixed(context) ? null : null;
    // : Navigator.of(context).pop(); // close the drawer
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(Container(
        decoration: i == _selectedDrawerIndex
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.blue.withOpacity(0.37),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.28),
                //     blurRadius: 3,
                //   )
                // ],
              )
            : null,
        child: ListTile(
          leading: Icon(
            d.icon,
            color: i == _selectedDrawerIndex ? Colors.blue : Colors.black,
          ),
          title: Text(
            d.title,
            // style: ThemeStyle.whiteText,
          ),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ),
      ));
    }
    final theme = Theme.of(context);

    final menu = Container(
      padding: const EdgeInsets.only(top: 20.0),
      color: theme.canvasColor,
      child: SafeArea(
        right: true,
        child: Drawer(
          elevation: 0,
          child: Column(children: drawerOptions),
        ),
      ),
    );

    return BaseView<HomeViewModel>(
        onModelReady: (HomeViewModel homeViewModel) async {
      await homeViewModel.getHomeDetails();
    }, builder: (context, homeViewModel, child) {
      return Row(
        children: <Widget>[
          if (isMenuFixed(context)) menu,
          Expanded(
            child: Navigator(
              key: navigatorKey,
              initialRoute: '/',
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor:
                              isMenuFixed(context) ? Colors.white : null,
                          title: Text(
                            constString.dashboard,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        // body: const SafeArea(
                        //   child: Center(child: Text("Body")),
                        // ),
                        body: _getDrawerItemWidget(_selectedDrawerIndex),
                        drawer: isMenuFixed(context) ? null : menu,
                      );
                    },
                    settings: settings);
              },
            ),
          ),
        ],
      );
    });
  }
}
