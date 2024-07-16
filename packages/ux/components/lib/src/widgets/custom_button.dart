import 'package:components/components.dart';
import 'package:components/src/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../theme/nexus_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text = 'Label',
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.width = 100,
    this.height = 45,
    this.elevation = 0,
    this.borderColor,
    this.loaderColor,
    this.style,
    this.enabled = true,
    this.loading = false,
    super.key,
  });

  factory CustomButton.outline({
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double borderRadius = Dimens.nano,
    Color? borderColor,
    Color? loaderColor = Colors.white,
    double? width = 120,
    double? height = 47,
    double? elevation = 0,
    bool enabled = true,
    bool loading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: borderRadius,
      borderColor: borderColor,
      loaderColor: loaderColor,
      backgroundColor: null,
      height: height,
      width: width,
      elevation: elevation,
      enabled: enabled,
      loading: loading,
    );
  }

  factory CustomButton.solid({
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double borderRadius = Dimens.nano,
    Color? borderColor = Colors.transparent,
    Color? loaderColor = Colors.white,
    Color? backgroundColor = Colors.lightBlue,
    double? width = 120,
    double? height = 47,
    double? elevation = 0,
    bool enabled = true,
    bool loading = false,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: borderRadius,
      borderColor: borderColor,
      loaderColor: loaderColor,
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      elevation: elevation,
      enabled: enabled,
      loading: loading,
    );
  }

  factory CustomButton.text({
    required String text,
    TextStyle? style = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double? width,
    double? height,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: 0,
      backgroundColor: null,
      borderColor: Colors.transparent,
      height: height,
      width: width,
    );
  }

  factory CustomButton.extended({
    required Widget icon,
    String? text,
    TextStyle? style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    void Function()? onPressed,
    double borderRadius = Dimens.nano,
    Color? borderColor = Colors.transparent,
    Color? loaderColor = Colors.white,
    Color? backgroundColor = Colors.blue,
    double? width = 120,
    double? height = 47,
    double? elevation = 0,
    bool enabled = true,
    bool loading = false,
  }) {
    assert(icon.runtimeType is! Text, 'icon cannot be a Text widget');
    return CustomButton(
      icon: icon,
      text: text,
      onPressed: onPressed,
      style: style,
      borderRadius: borderRadius,
      borderColor: borderColor,
      loaderColor: loaderColor,
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      elevation: elevation,
      enabled: enabled,
      loading: loading,
    );
  }

  final String? text;
  final Widget? icon;
  final TextStyle? style;
  final void Function()? onPressed;
  final double? borderRadius;
  final Color? borderColor;
  final Color? loaderColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? elevation;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = NexusTheme.of(context);
    final isIcon = icon != null;
    return MaterialButton(
      elevation: elevation ?? theme.buttonElevation,
      color: backgroundColor,
      disabledColor: Colors.grey.shade400,
      minWidth: width ?? theme.buttonWidth,
      height: height ?? theme.buttonHeight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? theme.buttonBorderRadius),
        ),
        side: BorderSide(color: borderColor ?? theme.buttonBorderColor),
      ),
      onPressed: enabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.nano),
        child: loading
            ? Transform.scale(
                scale: .6,
                child: CircularProgressIndicator(
                  color: loaderColor,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 5,
                ),
              )
            : !isIcon
                ? Text(
                    '$text',
                    style: style ?? theme.buttonTextStyle,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      const SizedBox(width: Dimens.macro),
                      Text(
                        '$text',
                        style: style ?? theme.buttonTextStyle,
                      ),
                    ],
                  ),
      ),
    );
  }
}
