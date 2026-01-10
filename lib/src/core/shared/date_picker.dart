import '../packages.dart';

final datePickerProvider = StateProvider<DateTime?>((ref) {
  return null;
});

class DatePicker extends ConsumerStatefulWidget {
  final DateTime? initDate;
  final bool hideDate;
  final bool readOnly;
  const DatePicker({
    this.initDate,
    this.hideDate = false,
    this.readOnly = false,
    super.key,
  });

  @override
  ConsumerState<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends ConsumerState<DatePicker> {
  @override
  void initState() {
    if (widget.initDate != null) {
      date = widget.initDate;
    }
    super.initState();
  }

  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          widget.initDate == null
              ? () async {
                try {
                  DateTime? result = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary:
                                AppColors.primary, // header background color
                            onPrimary: AppColors.white, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  AppColors.primary, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                    firstDate: DateTime(1900),
                    initialDate: DateTime.now(),
                    lastDate: DateTime.now(),
                    context: context,
                  );
                  if (result != null) {
                    setState(() {
                      date = result;
                      ref
                          .read(datePickerProvider.notifier)
                          .update((state) => result);
                    });
                  }
                  // print(result);
                } catch (e) {}
              }
              : null,
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(
              vertical: 20,
            ).r.copyWith(left: 10, right: 20).r,
        decoration: BoxDecoration(
          color:
              widget.readOnly
                  ? AppColors.formGrey.withOpacity(0.08)
                  : AppColors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: widget.readOnly ? AppColors.transparent : AppColors.hintGrey,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            // SvgWidget(
            //     AssetConstants.calender),
            // Icon(Icons.arrow_drop_down),
            // Container(
            //   height: 30,
            //   width: 1,
            //   color: AppColors.gray,
            // ),
            5.0.spacingW,
            if (date == null)
              Text(
                'Date of Birth',
                style: AppTextStyle.formText.copyWith(
                  color: AppColors.hintGrey,
                ),
              ),
            if (date != null)
              Text(
                widget.hideDate
                    ? "**/**/**${date!.year.toString().substring(2)}"
                    : '${date!.day}-${date!.month}-${date!.year}',
                style: AppTextStyle.bodyText1,
              ),
            Spacer(),
            SvgWidget(AssetConstants.calender, color: AppColors.hintGrey),
          ],
        ),
      ),
    );
  }
}
