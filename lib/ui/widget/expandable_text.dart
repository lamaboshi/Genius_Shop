import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLength;
  final TextStyle? style;
  final String readMoreText;
  final String readLessText;
  final Color linkColor;

  const ExpandableText({
    required this.text,
    this.maxLength = 100,
    this.style,
    this.readMoreText = 'Read more',
    this.readLessText = 'Read less',
    this.linkColor = Colors.black87,
    super.key,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? Theme.of(context).textTheme.bodyMedium;
    final shouldExpand = widget.text.length <= widget.maxLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isExpanded || shouldExpand
              ? widget.text
              : '${widget.text.substring(0, widget.maxLength)}...',
          style: textStyle,
        ),
        if (!shouldExpand)
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Text(
              _isExpanded ? widget.readLessText : widget.readMoreText,
              style: textStyle?.copyWith(
                color: widget.linkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
