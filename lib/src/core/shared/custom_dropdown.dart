import 'package:dropdown_button2/dropdown_button2.dart';

// import '../packages.dart';
import '../packages.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.itemsList,
    required this.hintText,
    this.fillColor,
    this.onChange,
    this.hintStyle,
    required this.firstItem,
    this.validator,
    this.prefIcon,
    this.showSearch = false,
    this.controller,
    this.borderColor,
  });

  final List itemsList;
  final String hintText;
  final Color? fillColor;
  final Color? borderColor;
  final String firstItem;
  final TextStyle? hintStyle;
  final Widget? prefIcon;
  final bool showSearch;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    double radius = 30;
    return DropdownButtonFormField2<String>(
      isDense: true,
      value: firstItem,
      // barrierColor: AppColors.appBlue,
      menuItemStyleData: MenuItemStyleData(),
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        // fillColor: AppColors.red,
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius).r,
          borderSide: BorderSide(
            color: borderColor ?? AppColors.hintGrey,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius).r,
          borderSide: BorderSide(
            color: borderColor ?? AppColors.hintGrey,
            width: 0.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius).r,
          borderSide: BorderSide(
            color: borderColor ?? AppColors.hintGrey,
            width: 0.5,
          ),
        ),
      ),
      isExpanded: true,
      // barrierColor: AppColors.red,
      dropdownSearchData:
          showSearch
              ? DropdownSearchData(
                searchInnerWidgetHeight: 20,
                searchController: controller,
                searchInnerWidget: Padding(
                  padding: const EdgeInsets.all(10.0).r,
                  child: AppTextField(
                    controller: controller,
                    prefixIcons: Padding(
                      padding: const EdgeInsets.all(20.0).r,
                      child: SvgWidget(AssetConstants.search),
                    ),
                    hint: 'Search Bank',
                    type: TextInputType.text,
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().toLowerCase().contains(
                    searchValue.toLowerCase(),
                  );
                },
              )
              : null,

      hint: Text(hintText, style: hintStyle ?? AppTextStyle.formText),
      items:
          itemsList
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppTextStyle.bodyText2.copyWith(
                      color: item == itemsList[0] ? AppColors.hintGrey : null,
                    ),
                    maxLines: 1,
                  ),
                ),
              )
              .toList(),
      onChanged: onChange,
      buttonStyleData: ButtonStyleData(
        height: 60.h,

        // overlayColor: MaterialStateProperty.all(Colors.red),
        padding: EdgeInsets.only(left: 0, right: 10),
      ),
      iconStyleData: IconStyleData(
        icon:
            prefIcon ??
            Icon(Icons.keyboard_arrow_down, color: AppColors.hintGrey),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
    );
  }
}

// class CustomDropDown2 extends StatelessWidget {
//   const CustomDropDown2(
//       {Key? key,
//       required this.itemsList,
//       required this.hintText,
//       this.fillColor,
//       this.onChange,
//       this.hintStyle,
//       required this.firstItem,
//       this.borderColor})
//       : super(key: key);

//   final List<Currency> itemsList;
//   final String hintText;
//   final Color? fillColor;
//   final Color? borderColor;
//   final Currency firstItem;
//   final TextStyle? hintStyle;

//   final Function(Currency?)? onChange;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField2<Currency>(
//       isDense: true,
//       value: firstItem,
//       // barrierColor: AppColors.appBlue,
//       menuItemStyleData: MenuItemStyleData(),
//       decoration: InputDecoration(
//         isDense: true,
//         filled: true,
//         fillColor: fillColor ?? Colors.white,
//         // fillColor: AppColors.red,
//         contentPadding: EdgeInsets.zero,
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10).r,
//             borderSide: BorderSide(
//                 color: borderColor ?? AppColors.darkGray, width: 0.5)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10).r,
//             borderSide: BorderSide(
//                 color: borderColor ?? AppColors.primary, width: 0.5)),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10).r,
//             borderSide: BorderSide(
//                 color: borderColor ?? AppColors.appDark, width: 0.8)),
//       ),
//       isExpanded: true,
//       // barrierColor: AppColors.red,

//       hint: Text(hintText, style: hintStyle ?? AppTextStyle.formText),
//       items: itemsList
//           .map((item) => DropdownMenuItem<Currency>(
//                 value: item,
//                 child: Row(
//                   children: [
//                     ImageWidget(item.code),
//                     10.0.spacingW,
//                     Text(
//                       item.title,
//                       style: AppTextStyle.bodyText1,
//                     ),
//                   ],
//                 ),
//               ))
//           .toList(),
//       onChanged: onChange,
//       buttonStyleData: ButtonStyleData(
//         height: 50,
//         // overlayColor: MaterialStateProperty.all(Colors.red),

//         padding: EdgeInsets.only(left: 0, right: 10),
//       ),
//       iconStyleData: const IconStyleData(
//         icon: Icon(
//           Icons.keyboard_arrow_down,
//           color: Colors.black45,
//         ),
//         iconSize: 30,
//       ),
//       dropdownStyleData: DropdownStyleData(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(10).r,
//         ),
//       ),
//     );
//   }
// }
