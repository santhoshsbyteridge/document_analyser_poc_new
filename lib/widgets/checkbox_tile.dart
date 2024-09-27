import 'package:flutter/material.dart';

class CheckboxTileWidget extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? onChanged;
  final String title;

  const CheckboxTileWidget({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onChanged != null
          ? () => onChanged!(!isChecked) // Toggle the value when tapped
          : null,
      leading: Checkbox(value: isChecked, onChanged: onChanged),
      title: Text(title),
    );
  }
}
