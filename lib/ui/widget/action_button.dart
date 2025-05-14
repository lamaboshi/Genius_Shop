import 'package:flutter/material.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';

class ActionButton extends StatelessWidget {
  final Widget title;
  final bool withBorder;
  final VoidCallback onPressed;
  const ActionButton({
    required this.title,
    required this.withBorder,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextButton(
            style:
                withBorder
                    ? context.actionBorderButtonStyle
                    : context.actionButtonStyle.copyWith(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
            onPressed: onPressed,
            child: Padding(padding: const EdgeInsets.all(8.0), child: title),
          ),
        ),
      ],
    );
  }
}
