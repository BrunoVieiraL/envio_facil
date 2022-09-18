import 'package:flutter/material.dart';

import '../constants.dart';

class CustomWidgetListView extends StatefulWidget {
  const CustomWidgetListView({
    super.key,
    required this.itemCount,
    required this.value,
    required this.title,
    this.subtitle,
    required this.imagePath,
  });

  final int itemCount;
  final List<bool> value;
  final List<String> title;
  final String? subtitle;
  final List<String> imagePath;

  @override
  State<CustomWidgetListView> createState() => _CustomWidgetListViewState();
}

class _CustomWidgetListViewState extends State<CustomWidgetListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(),
        itemCount: widget.itemCount,
        itemBuilder: (context, index) => RadioListTile(
          groupValue: true,
          value: widget.value[index],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          activeColor: Colors.green,
          onChanged: (trueOrFalse) {
            for (var i = 0; i < widget.value.length; i++) {
              widget.value[i] = false;
            }
            widget.value[index] = !trueOrFalse!;
            setState(() {});
          },
          title: Text(
            widget.title[index],
            style: TextStyle(
                fontFamily: titilliumWebBold,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.subtitle ?? ''),
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: Image(
            image: AssetImage(
              widget.imagePath[index],
            ),
          ),
        ),
      ),
    );
  }
}
