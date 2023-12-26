import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_pos_app/components/topmenu.dart';
import 'package:flutter_pos_app/main.dart';

class FormMenu extends StatefulWidget {
  @override
  _FormMenuState createState() => _FormMenuState();
}

class _FormMenuState extends State<FormMenu> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TopMenuWidget(
        title: 'POS BENSU',
        subTitle: 'Cabang ABC',
        action: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(
                    movePage: "Menus",
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange, // Button color
            ),
            child: const Row(
              children: [
                Text(
                  "Kembali",
                  selectionColor: Colors.white,
                )
              ],
            ),
          ),
        ]),
      ),
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
                "Form Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Nama Menu",
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
                  hintText: 'xxxx',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Harga",
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
                  hintText: 'Rp. xxx',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Foto Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.deepOrange, // Change color as needed
                  child: Text(
                    'Choose Image',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              _image != null
                  ? Image.file(
                      _image!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Text(
                      'No image selected.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
              const SizedBox(height: 16),
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

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}
