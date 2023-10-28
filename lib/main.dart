import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello24/settings_item.dart';
import 'package:hello24/signature.dart';
import 'package:hello24/star_settings.dart';
import 'package:hello24/textstyle.dart';
import 'package:google_fonts/src/asset_manifest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Settings',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: GmailSettingsScreen(),
    );
  }
}

class GmailSettingsScreen extends StatefulWidget {
  @override
  State<GmailSettingsScreen> createState() => _GmailSettingsScreenState();
}

class _GmailSettingsScreenState extends State<GmailSettingsScreen> {
  List<String> _languages = [
    'English',
    'Tamil',
    'Hindi',
    'Kannada',
    'Telugu',
    'Malayalam'
  ];  List<String> _country = [
    'UNITED KINGDOM',
    'INDIA',
    'USA',
    'AUSTRALIA',
    'NEW ZEALAND',
    'CHINA'
  ];

  List<Icon> sourceList = [Icon(Icons.star), Icon(Icons.favorite), Icon(Icons.send)];
  List<Icon> targetList = [];


  String selectedLanguage = 'English';
  String selectedCountry = 'INDIA';
  double _fontSize = 20.0;
  String _selectedFont = 'Roboto';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('General Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Language:'),
                  DropdownButton(
                    onChanged: (String? value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                    value: selectedLanguage,
                    items: _languages
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Phone Number:'),
                  DropdownButton(
                    onChanged: (String? value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                    value: selectedCountry,
                    items: _country
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Default Text Style:'),
                  TextStyleScreen()
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Expanded(
                child: DragAndDropLists(),
              ),
              Divider(
                thickness: 2,
              ),
              EmailSignatureEditorWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStarWidget(Star star, bool isSelected) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Tooltip(
      message: star.name,
      child: Icon(
        Icons.star,
        size: isSelected ? 50 : 30,
        color: isSelected ? Colors.amber : Colors.grey,
      ),
    ),
  );
}

class Star {
  final String name;

  Star(this.name);
}
