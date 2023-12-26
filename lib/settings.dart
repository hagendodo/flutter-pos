import 'package:flutter/material.dart';
import 'package:flutter_pos_app/components/topmenu.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TopMenuWidget(
          title: 'POS BENSU', subTitle: 'Cabang ABC', action: Container()),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xff1f2029),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 1), // Negative y offset for top shadow
              blurRadius: 1,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 12, right: 12, top: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profil Akun",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Kode Toko",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 7),
              Text(
                "XXXXX",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              Text(
                "Nama Toko",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Nama Toko",
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Username",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Status",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 7),
              Text(
                "Owner",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 14,
                  fontWeight:
                      FontWeight.bold, // Adjust the font weight as needed
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Perform the form submission logic here
                    },
                    child: Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      primary: Colors.deepOrange,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
