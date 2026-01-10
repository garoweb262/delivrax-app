import '../packages.dart';

// import 'package:test_project/src/core/utils/extension/widget_extensions.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final String? title;
  final bool fill;
  final bool obscured;
  final bool readOnly;
  final int? maxLines;
  final bool isAmount;
  final TextStyle? hintStyle;
  final TextInputType type;
  final Color? fillColor;
  final TextEditingController? controller;
  final Widget? prefixIcons;
  final List<TextInputFormatter>? formeter;
  final Widget? surfixIcons;
  final int? maxLenth;
  final double? radius;
  final FocusNode? focusNode;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.hint,
    this.prefixIcons,
    this.surfixIcons,
    this.formeter,
    this.maxLines = 1,
    this.radius,
    this.controller,
    this.maxLenth,
    this.hintStyle,
    this.style,
    this.fill = true,
    this.isAmount = false,
    this.onEditingComplete,
    this.focusNode,
    this.readOnly = false,
    this.isPassword = false,
    this.obscured = false,
    this.fillColor,
    this.contentPadding,
    this.validator,
    this.onChange,
    this.onSubmitted,
     this.type = TextInputType.text,
    this.title,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;
  @override
  void initState() {
    widget.focusNode?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(widget.title ?? '', style: AppTextStyle.bodyText5),
          if (widget.title != null) 5.0.spacingH,
          TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            maxLines: widget.maxLines,
            onChanged: widget.onChange,
            validator: widget.validator,
            inputFormatters: widget.formeter,
            maxLength: widget.maxLenth,
            style:
                widget.style ??
                AppTextStyle.subtitleStyle.copyWith(
                  color: AppColors.black,
                  fontWeight: AppFontWeight.regular,
                ),
            cursorColor: AppColors.black,
            cursorHeight: 20,
            obscureText: widget.isPassword ? !isVisible : widget.obscured,
            keyboardType: widget.type,
            readOnly: widget.readOnly,
            decoration: AppTextFieldDecoration(),
          ),
        ],
      ),
    );
  }

  InputDecoration AppTextFieldDecoration() {
    double radius = widget.radius ?? 10;
    return InputDecoration(
      hintText: widget.hint,
      hintStyle:
          widget.hintStyle ??
          AppTextStyle.formText.copyWith(color: AppColors.hintGrey),
      counterText: "",
      filled: widget.fill,
      prefixText: widget.isAmount ? '₦' : null,
      prefixStyle: TextStyle(
        fontFamily: 'Arial',
        fontWeight: AppFontWeight.medium,
        fontSize: 15.sp,
      ),
      prefixIcon: widget.prefixIcons != null
          ? Opacity(
              opacity: widget.focusNode?.hasFocus ?? true ? 1 : 0.3,
              child: widget.prefixIcons,
            )
          : null,
      prefixIconConstraints: widget.prefixIcons != null
          ? BoxConstraints(maxHeight: 40.h, maxWidth: 55.h)
          : null,
      fillColor: widget.fillColor ?? AppColors.white,
      suffixIcon: Opacity(
        opacity: widget.focusNode?.hasFocus ?? true ? 1 : 0.3,
        child: widget.isPassword
            ? InkWell(
                child: Icon(
                  isVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.formGrey,
                  size: 20,
                ),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : widget.surfixIcons,
      ),
      contentPadding:
          widget.contentPadding ??
          const EdgeInsets.all(
            17,
          ).copyWith(left: widget.prefixIcons != null ? 10 : 10).r,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(color: Colors.black, width: 0.8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          width: !widget.fill ? 0.8 : 0.8,
          color: !widget.fill ? AppColors.black : AppColors.greyBlack,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: !widget.fill
              ? AppColors.black.withOpacity(0.12)
              : widget.readOnly
              ? Colors.transparent
              : AppColors.black.withOpacity(0.12),
          width: widget.fill ? 0.8 : 0.8,
        ),
      ),
    );
  }
}
