import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicv_tech_mvp/ui/theme/app_color.dart';
// <-- importa cores

/// ============================
/// Preview Constants & Widgets
/// ============================

const Size DefaultPreviewSize = Size(353, 100);

// Preview do botão primário - apenas texto
@Preview(
  name: 'Primary Button (Text)',
  size: DefaultPreviewSize,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget PrimaryButtonTextPreview() {
  return Container(
    child: Center(
      child: CustomButton(
        text: "Primary",
        onPressed: () {},
        type: ButtonType.Primary,
      ),
    ),
  );
}

// Preview do botão primário - apenas ícone
@Preview(
  name: 'Primary Button (Icon)',
  size: DefaultPreviewSize,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget PrimaryButtonIconPreview() {
  return Container(
    child: Center(
      child: CustomButton(
        text: "",
        icon: Icons.add,
        onPressed: () {},
        type: ButtonType.Primary,
      ),
    ),
  );
}

// Preview do botão primário - texto + ícone
@Preview(
  name: 'Primary Button (Text + Icon)',
  size: DefaultPreviewSize,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget PrimaryButtonTextIconPreview() {
  return Container(
    child: Center(
      child: CustomButton(
        text: "Primary",
        icon: Icons.add,
        onPressed: () {},
        type: ButtonType.Primary,
      ),
    ),
  );
}

// Preview do botão secundário - texto
@Preview(
  name: 'Secondary Button (Text)',
  size: DefaultPreviewSize,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget SecondaryButtonTextPreview() {
  return Container(
    child: Center(
      child: CustomButton(
        text: "Secondary",
        onPressed: () {},
        type: ButtonType.Secondary,
      ),
    ),
  );
}

// Preview do botão desabilitado - texto
@Preview(
  name: 'Disabled Button (Text)',
  size: DefaultPreviewSize,
  textScaleFactor: 1.2,
  brightness: Brightness.light,
)
Widget DisabledButtonTextPreview() {
  return Container(
    child: Center(
      child: CustomButton(
        text: "Disabled",
        onPressed: () {},
        type: ButtonType.Disabled,
      ),
    ),
  );
}

/// ============================
/// Preview Annotation
/// ============================
class Preview {
  final String name;
  final Size? size;
  final double? textScaleFactor;
  final Brightness? brightness;

  const Preview({
    required this.name,
    this.size,
    this.textScaleFactor,
    this.brightness,
  });
}

/// ============================
/// CustomButton
/// ============================
enum ButtonType { Primary, Secondary, Disabled }


class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ButtonType type;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;

  const CustomButton({
    super.key,
    required this.text,
    required this.type,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 67,
    this.width = double.infinity,
  });

  // Retorna a cor de fundo de acordo com o tipo do botão
  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.Primary:
        return backgroundColor ??
            AppColors.buttonPrimaryBackground; // do AppColors
      case ButtonType.Secondary:
        return backgroundColor ??
            AppColors.buttonSecondaryBackground; // do AppColors
      case ButtonType.Disabled:
        return backgroundColor ??
            AppColors.buttonDisabledBackground; // equivalente grey.shade400
    }
  }

  // Retorna a cor do texto de acordo com o tipo do botão
  Color _getTextColor() {
    switch (type) {
      case ButtonType.Primary:
      case ButtonType.Secondary:
        return textColor ?? const Color.fromARGB(255, 255, 255, 255); // branco padrão
      case ButtonType.Disabled:
        return textColor ??
            AppColors.webNeutral200; // equivalente grey.shade200
    }
  }

  // Monta o conteúdo do botão (ícone + texto)
  Widget _buildButtonContent(Color colorText) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) Icon(icon, color: colorText),
        if (icon != null && text.isNotEmpty) const SizedBox(width: 8),
        if (text.isNotEmpty)
          Text(
            text,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: colorText,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg = _getBackgroundColor();
    final txt = _getTextColor();

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: type == ButtonType.Disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
          ),
        ),
        child: _buildButtonContent(txt),
      ),
    );
  }
}
