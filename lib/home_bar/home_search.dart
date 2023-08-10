import 'package:flutter/material.dart';

class SearchMenu extends StatefulWidget {
  const SearchMenu({super.key});

  @override
  State<SearchMenu> createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  TextEditingController controlText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        autocorrect: true,
        enableInteractiveSelection: true, //klo mau paste tinggal hold def'true'
        autofocus: false, // g usah ngeklik langsung ngisi def'false
        onSubmitted: (value) {
          controlText.clear();
        },
        enabled: true,
        focusNode: FocusNode(),
        controller: controlText,
        decoration: InputDecoration(
          fillColor: Colors.green.withOpacity(0.08),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintText: 'Mau makan apa hari ini?',
          hintStyle: TextStyle(
            color: Colors.green[600],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                controlText.clear();
              },
              icon: Icon(Icons.clear)),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
