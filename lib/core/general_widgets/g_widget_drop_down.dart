import 'package:flutter/material.dart';

import '../assets_manager.dart';

class GWidgetDropDown extends StatelessWidget {
  const GWidgetDropDown(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.items,
      required this.isError,
      this.isSearch = false,
      this.controller});
  final String title;
  final Function(dynamic value) onChanged;
  final List<String> items;
  final bool isError;
  final bool isSearch;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              color: Theme.of(context).colorScheme.background,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(title,
                    style: const TextStyle(
                        fontFamily: FontsAssets.gotham,
                        color: Colors.black,
                        fontSize: 15)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 66,
              color: Theme.of(context).colorScheme.background,
              child: DropdownButtonFormField<String>(
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.black,
                  iconSize: 29,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 6, right: 6),
                      border: InputBorder.none,
                      hintText: 'Please choose from the options',
                      focusedErrorBorder: isError ? outLine(Colors.red) : null,
                      errorBorder: isError ? outLine(Colors.red) : null,
                      errorText: isError ? 'This field required' : null,
                      errorStyle: isError
                          ? const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontFamily: FontsAssets.gotham)
                          : null,
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: FontsAssets.gotham,
                          fontSize: 10)),
                  focusColor: Theme.of(context).colorScheme.background,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: FontsAssets.gotham,
                              fontSize: 12)),
                    );
                  }).toList(),
                  onChanged: onChanged),
            ),
          )
        ],
      ),
    );
  }
}

OutlineInputBorder outLine(Color borderColor) => OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(5),
    );
