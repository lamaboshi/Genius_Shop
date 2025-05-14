import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String? value;
  final String? label;
  final int? minLines;
  final double? width;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextEditingController? controller;
  final bool? isNumberFormat;
  final IconData? icon;
  final bool isReadOnly;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(double)? onPasswordStrengthChanged; // New callback

  const TextFieldWidget({
    this.value,
    this.label,
    required this.onChanged,
    required this.textInputType,
    this.focusedBorder,
    this.enabledBorder,
    this.width,
    this.controller,
    this.minLines,
    this.icon,
    this.validator,
    this.isNumberFormat = false,
    this.isReadOnly = false,
    this.isPassword = false,
    this.onPasswordStrengthChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController _controller;
  bool _obscureText = true;
  // double _passwordStrength = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.value);
    _obscureText = widget.isPassword;
  }

  // double _calculatePasswordStrength(String password) {
  //   double strength = 0;

  //   // Length check
  //   if (password.length >= 8) strength += 0.3;
  //   if (password.length >= 12) strength += 0.2;

  //   // Complexity checks
  //   if (password.contains(RegExp(r'[A-Z]'))) strength += 0.2;
  //   if (password.contains(RegExp(r'[0-9]'))) strength += 0.2;
  //   if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.1;

  //   return strength.clamp(0, 1);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: widget.width,
            child: TextFormField(
              key: Key(widget.label!),
              validator: widget.validator,
              focusNode: FocusNode(),
              readOnly: widget.isReadOnly,
              controller: _controller,
              keyboardType: widget.textInputType,
              obscureText: widget.isPassword ? _obscureText : false,
              textAlignVertical: TextAlignVertical.center,
              minLines: widget.minLines,
              maxLines: (widget.minLines ?? 0) + 1,
              inputFormatters:
                  widget.isNumberFormat!
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : null,
              decoration: InputDecoration(
                icon:
                    widget.icon == null
                        ? null
                        : Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            widget.icon!,
                            color: Colors.purple.shade100,
                          ),
                        ),
                enabledBorder:
                    widget.enabledBorder ??
                    UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                label: Text(widget.label!),
                suffixIcon:
                    widget.isPassword
                        ? IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                        : null,
              ),
              onChanged: (value) {
                widget.onChanged?.call(value);
                // if (widget.isPassword) {
                //   final strength = _calculatePasswordStrength(value);
                //   setState(() {
                //     _passwordStrength = strength;
                //   });
                //   widget.onPasswordStrengthChanged?.call(strength);
                // }
              },
            ),
          ),
          // if (widget.isPassword) ...[
          //   const SizedBox(height: 4),
          //   LinearProgressIndicator(
          //     value: _passwordStrength,
          //     backgroundColor: Colors.grey[200],
          //     color:
          //         _passwordStrength < 0.3
          //             ? Colors.red
          //             : _passwordStrength < 0.6
          //             ? Colors.orange
          //             : Colors.green,
          //   ),
          //   const SizedBox(height: 4),
          //   Text(
          //     _passwordStrength < 0.3
          //         ? 'Weak'
          //         : _passwordStrength < 0.6
          //         ? 'Fair'
          //         : 'Strong',
          //     style: TextStyle(
          //       color:
          //           _passwordStrength < 0.3
          //               ? Colors.red
          //               : _passwordStrength < 0.6
          //               ? Colors.orange
          //               : Colors.green,
          //       fontSize: 12,
          //     ),
          //   ),
          // ],
        ],
      ),
    );
  }
}
