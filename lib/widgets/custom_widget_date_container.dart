import 'package:flutter/material.dart';

class CustomWidgetDateContainer extends StatefulWidget {
  const CustomWidgetDateContainer(
      {super.key,
      required this.dataPartida,
      this.left,
      this.right,
      required this.textPartida});

  final DateTime? dataPartida;
  final double? left;
  final double? right;
  final String textPartida;

  @override
  State<CustomWidgetDateContainer> createState() =>
      _CustomWidgetDateContainerState();
}

class _CustomWidgetDateContainerState extends State<CustomWidgetDateContainer> {
  DateTime? data;

  @override
  void initState() {
    data = widget.dataPartida;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.left ?? 0,
        right: widget.right ?? 0,
      ),
      child: GestureDetector(
        onTap: () async {
          data = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
              locale: const Locale('pt', 'BR'));
          setState(() {});
        },
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: const Color(0xFF222222))),
          height: 54,
          width: 156,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              data == null
                  ? widget.textPartida
                  : '${data!.day}/${data!.month < 10 ? 0 : ''}${data!.month}/${data!.year}',
              style: TextStyle(
                color: data == null
                    ? const Color(0xFFA9A9A9)
                    : const Color(0xFF222222),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
