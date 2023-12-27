import 'package:flutter/material.dart';
import 'package:flutter_pos_app/detail_history.dart';
import 'package:flutter_pos_app/form_menu.dart';
import 'package:flutter_pos_app/history.dart';
import 'package:flutter_pos_app/login.dart';
import 'package:flutter_pos_app/models/order_data.dart';
import 'package:flutter_pos_app/order.dart';
import 'package:flutter_pos_app/home.dart';
import 'package:flutter_pos_app/register.dart';
import 'package:flutter_pos_app/report.dart';
import 'package:flutter_pos_app/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Point Of Sale',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(movePage: "Login"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  final String movePage;
  final OrderData? menuDetail;

  const MainPage({Key? key, required this.movePage, this.menuDetail})
      : super(key: key);

  @override
  State<MainPage> createState() =>
      _MainPageState(movePage: movePage, menuDetail: menuDetail);
}

class _MainPageState extends State<MainPage> {
  String pageActive = "Login";
  OrderData? detailMenu;

  _MainPageState({required String movePage, OrderData? menuDetail}) {
    pageActive = movePage;
    detailMenu = menuDetail;
  }

  _pageView() {
    switch (pageActive) {
      case 'Login':
        return Login();
      case 'Register':
        return Register();
      case 'Menus':
        return HomePage();
      case 'FormMenu':
        return FormMenu();
      case 'Order':
        return Checkout();
      case 'History':
        return History();
      case 'DetailHistory':
        return DetailHistory(itemMenu: detailMenu);
      case 'Report':
        return Report();
      case 'Settings':
        return Settings();

      default:
        return const HomePage();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2029),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xff17181f),
              ),
              child: _pageView(),
            ),
          ),
        ],
      ),
      floatingActionButton: pageActive == "Menus"
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                            movePage: "FormMenu",
                          )),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.deepOrange,
            )
          : null,
      bottomNavigationBar: pageActive == "Login" ||
              pageActive == "DetailHistory" ||
              pageActive == "Register" ||
              pageActive == "FormMenu"
          ? null
          : _bottomMenu(),
    );
  }

  Widget _bottomMenu() {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 6, right: 12, left: 12),
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: (1 / 1),
        children: [
          _itemMenu(
            menu: 'Order',
            icon: Icons.format_list_bulleted_rounded,
          ),
          _itemMenu(
            menu: 'Menus',
            icon: Icons.rocket_sharp,
          ),
          _itemMenu(
            menu: 'History',
            icon: Icons.history_toggle_off_rounded,
          ),
          _itemMenu(
            menu: 'Report',
            icon: Icons.file_copy,
          ),
          _itemMenu(
            menu: 'Settings',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }

  Widget _itemMenu({required String menu, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: GestureDetector(
        onTap: () => _setPage(menu),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: pageActive == menu
                    ? Colors.deepOrangeAccent
                    : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
