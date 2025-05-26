import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final Function(String?)? onSaved;
  final Function(DateTime)? datePickerCallBack;
  final Function(String)? onFieldSubmitted;
  final Function(bool?)? onFocusChanged;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final bool datePicker;
  final String? defaultText;
  final FocusNode? focusNode;
  final InputBorder? focusedBorder;
  final DateTime? initialDate;
  final Duration? initialTime;
  final InputBorder? inputBorder;
  final List<TextInputFormatter>? inputFormatters;

  ///add shadow box the TextFormField
  ///preferred to use along with
  ///`inputBorder: InputBorder.none`
  final bool isShadowAdded;

  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  final IconData? prefixIcon;
  final Color primaryColor;
  final bool readOnly;
  final TextDirection textDirection;
  final TextInputAction textInputAction;
  final String title;
  final FormFieldValidator<String?> validator;
  final double width;

  const TextFieldWidget(
    this.title, {
    super.key,
    this.defaultText,
    this.primaryColor = Colors.amber,
    this.onSaved,
    this.maxLines,
    this.minLines = 1,
    this.datePicker = false,
    this.keyboardType = TextInputType.name,
    this.datePickerCallBack,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.width = 500,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.validator = _defaultValidator,
    this.inputFormatters,
    this.textDirection = TextDirection.ltr,
    this.readOnly = false,
    this.autofillHints,
    this.autofocus = false,
    this.focusNode,
    this.initialDate,
    this.initialTime,
    this.inputBorder,
    this.isShadowAdded = false,
    this.focusedBorder,
    this.onFocusChanged,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode? focusNode = FocusNode();
  bool? isFocusing;

  final _controller = TextEditingController();
  late bool _isVisible;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isVisible = widget.obscureText;
    if (widget.focusNode != null) {
      focusNode = widget.focusNode;
    }
    isFocusing = focusNode?.hasFocus;
    focusNode?.addListener(() {
      isFocusing = focusNode?.hasFocus;
      widget.onFocusChanged?.call(isFocusing);
    });
  }

  void onFieldSubmitted(String value) {
    if (widget.onFieldSubmitted != null) {
      widget.onFieldSubmitted!(value);
    }
    _isVisible = !_isVisible;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if ((widget.defaultText?.isNotEmpty ?? false) ||
          (widget.defaultText?.isNotEmpty ?? false)) {
        _controller.value = TextEditingValue(
          text: widget.defaultText ?? '',

          ///prevent reversed text :!
          selection: TextSelection.collapsed(
            offset: widget.defaultText?.length ?? 0,
          ),
        );
      }
    });
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: widget.width,
            child: TextFormField(
              focusNode: focusNode,
              autofocus: widget.autofocus,
              autofillHints: widget.autofillHints,
              textDirection: widget.textDirection,
              inputFormatters: widget.inputFormatters,
              controller: _controller,
              obscureText: _isVisible,
              enableSuggestions: true,
              onChanged: widget.onChanged,
              keyboardType: widget.keyboardType,
              onSaved: widget.onSaved,
              textInputAction: widget.textInputAction,
              onFieldSubmitted: onFieldSubmitted,
              cursorColor: widget.primaryColor,
              readOnly: widget.datePicker || widget.readOnly,
              enabled: !widget.readOnly,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.zero,
                enabledBorder: widget.inputBorder,
                focusedBorder: widget.focusedBorder,
                border: widget.inputBorder,
                labelText: widget.title,
                labelStyle: TextStyle(color: Colors.black),
                hintText: widget.title,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                prefixIcon:
                    widget.prefixIcon == null
                        ? null
                        : Icon(
                          widget.prefixIcon,
                          size: 20,
                          color: widget.primaryColor,
                        ),
                suffix: null,
                icon: null,
                suffixIcon:
                    widget.obscureText
                        ? IconButton(
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            _isVisible = !_isVisible;
                            setState(() {});
                          },
                        )
                        : null,
              ),
              maxLines: _isVisible ? 1 : widget.maxLines,
              minLines: widget.minLines ?? 1,
              onTap: () async {},
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}

String? _defaultValidator(String? s) {
  return (s != null && s.trim().isEmpty) ? 'validation.required' : null;
}
