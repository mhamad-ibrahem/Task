import 'package:flutter/material.dart';
import 'package:task/Core/constant/Size.dart';
import '../../Core/Constant/Colors.dart';



class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.textEditingController,
    required this.validator,
    this.inputType,
    @required this.suffixIcon,
  }) : super(key: key);
  final Widget? icon;
  final String hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?) validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        style: const TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontFamily: 'muli',
            fontWeight: FontWeight.bold),
        obscureText: obscure,
        maxLines: 1,
        cursorColor: AppColors.darkGrey,
        keyboardType: inputType,
        decoration: InputDecoration(
          fillColor: AppColors.black,
            suffixIcon: suffixIcon,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: icon
            ),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headline1,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.purple, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.darkGrey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:const  BorderSide(color: AppColors.red, width: 2)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
