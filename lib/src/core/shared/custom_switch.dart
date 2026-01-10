import '../packages.dart';

// ignore: must_be_immutable
class CustomSwitch extends StatefulWidget {
  CustomSwitch({
    super.key,
    required this.onSwitch,
    this.value = false,
    this.autoTap = true,
    this.text,
  });
  final Function(bool) onSwitch;
  final Widget? text;
  bool value;
  bool autoTap;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  // bool _on = false;
  // dynamic sub;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (widget.autoTap) {
          setState(() {
            widget.value = !widget.value;
          });
        }
        widget.onSwitch(widget.value);
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
            height: 25,
            width: 45,
            decoration: BoxDecoration(
              color: widget.value ? AppColors.primary : const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(100),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color:
                      widget.value
                          ? AppColors.primary
                          : const Color(0xFFEBEBEB),
                  width: 3,
                ),
              ),
              width: 25,
              height: 25,
            ),
          ),
          if (widget.text != null) const SizedBox(width: 10),
          if (widget.text != null) widget.text as Widget,
        ],
      ),
    );
  }
}
