import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/src/asset_manifest.dart';



class TextStyleScreen extends StatefulWidget {
  @override
  _TextStyleScreenState createState() => _TextStyleScreenState();
}

class _TextStyleScreenState extends State<TextStyleScreen> {
  double _fontSize = 20.0;
  String _selectedFont = 'Roboto'; // Default font

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sample Text',
                style: GoogleFonts.getFont(
                  _selectedFont,
                  textStyle: TextStyle(fontSize: _fontSize),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Font Size: $_fontSize'),
                  Slider(
                    min: 20,
                    max: 50,
                    value: _fontSize.ceilToDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        _fontSize = newValue.ceilToDouble();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedFont,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFont = newValue!;
                  });
                },
                items: <String>['Roboto', 'Open Sans', 'Lobster'] // Add more font options here
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
    );
  }
}

