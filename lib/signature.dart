import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class EmailSignatureEditorWidget extends StatefulWidget {
  @override
  _EmailSignatureEditorWidgetState createState() =>
      _EmailSignatureEditorWidgetState();
}

class _EmailSignatureEditorWidgetState
    extends State<EmailSignatureEditorWidget> {
  TextEditingController _signatureNameController = TextEditingController();
  List<EmailSignature> _signatures = [];

  void _saveSignature() {
    String signatureName = _signatureNameController.text;
    if (signatureName.isNotEmpty) {
      setState(() {
        _signatures.add(EmailSignature(signatureName));
      });
      _signatureNameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _signatureNameController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: 'Enter your text here...',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _saveSignature,
                  child: Text('Save Signature'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _signatures.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_signatures[index].text),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmailSignature {
  final String text;

  EmailSignature(this.text);
}
