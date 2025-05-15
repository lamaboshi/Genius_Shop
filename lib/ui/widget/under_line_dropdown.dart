import 'package:flutter/material.dart';

class UnderlineDropdown extends StatefulWidget {
  final List<String> items;
  final String? hintText;
  final String? value;
  final ValueChanged<String?>? onChanged;

  const UnderlineDropdown({
    required this.items,
    this.hintText,
    this.value,
    this.onChanged,
    super.key,
  });

  @override
  _UnderlineDropdownState createState() => _UnderlineDropdownState();
}

class _UnderlineDropdownState extends State<UnderlineDropdown> {
  String? selectedValue;
  final FocusNode _focusNode = FocusNode();
  Color underlineColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    _focusNode.addListener(() {
      setState(() {
        underlineColor =
            _focusNode.hasFocus ? Theme.of(context).primaryColor : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              focusNode: _focusNode,
              hint:
                  widget.hintText != null
                      ? Text(
                        widget.hintText!,
                        style: TextStyle(color: Colors.grey),
                      )
                      : null,
              items:
                  widget.items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              },
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: underlineColor, width: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
