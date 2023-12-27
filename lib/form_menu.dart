import 'dart:io';
import 'package:dio/dio.dart';
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

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

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
                controller: _nameController,
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
                controller: _priceController,
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
              //buildImageWidget(),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                      print("heeh");
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

  Widget buildImageWidget() {
    if (_image != null) {
      // For mobile (Android and iOS), use Image.file
      return Image.file(
        _image!,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      );
    } else {
      // For web, use Image.network
      return _image != null
          ? Image.network(
              'your_image_url', // Replace with the actual image URL or Firebase Storage URL
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
          : const Text(
              'No image selected.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            );
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // Future<void> _getImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     allowMultiple: false,
  //   );
  //   setState(() {
  //     if (result != null && result.files.isNotEmpty) {
  //       // For web, you get a list of files. Pick the first one.
  //       _image = File(result.files.first.path!);
  //     }
  //   });
  // }

  Future<void> _submitForm() async {
    // Validate form fields
    if (_nameController.text.isEmpty || _priceController.text.isEmpty) {
      // Show an error message or handle validation as needed
      return;
    }

    // Create Dio instance
    final dio = Dio();

    // Create FormData
    final formData = FormData.fromMap({
      'name': _nameController.text,
      'price': _priceController.text,
      'image': await MultipartFile.fromFile(_image!.path),
    });

    try {
      // Make POST request
      final response = await dio.post(
        'http://localhost:3000/api/items', // Replace with your actual API endpoint
        data: formData,
      );

      // Handle the response as needed
      print(response.data);
    } catch (error) {
      // Handle the error
      print('Error: $error');
    }
  }
}
