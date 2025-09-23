import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:unicv_tech_mvp/ui/theme/app_color.dart';
@Preview(name: 'Botão Próximo')
Widget avancarButtonPreview() {
  return Center(
    child: DefaultButtonBack(
      text: "Anterior",
      icon: Icons.arrow_back_ios,
      onPressed: () {},
    ),
  );
}
class DefaultButtonBack extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double fontSize;
  const DefaultButtonBack({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.fontSize = 14,
  });
  @override
  State<DefaultButtonBack> createState() => _DefaultButtonBackState();
}
class _DefaultButtonBackState extends State<DefaultButtonBack> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: widget.onPressed,
      icon: Icon(widget.icon, color: AppColors.primaryDark),
      label: Text(
        widget.text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.webNeutral800,
          fontSize: 16,
        ),
      ),
    );
  }
}