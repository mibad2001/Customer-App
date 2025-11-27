import 'package:customer/View/Widgets/color.dart';
import 'package:customer/View/textstyle/apptextstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumber_TextField extends StatelessWidget {
  final String hintText;
  const PhoneNumber_TextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(

          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  //color: const Color.fromARGB(255, 172, 171, 171)
                ), // default
              borderRadius: BorderRadius.circular(15),
            ),
               enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.textfield_fill, width: 0.5), // unfocused
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColor.Text_Color, width: 1), // focused
              borderRadius: BorderRadius.circular(15),
            ),
          
        prefixIconColor: CustomColor.Text_Color,

        labelText: hintText,
        prefixIcon: Icon(Icons.call, color: CustomColor.Text_Color, size: 50),
        labelStyle: AppTextStyles.medium(color: CustomColor.blueGrey),
        filled: true,
        fillColor: Colors.white70,
    
      ),
      initialCountryCode: 'GB',
      onChanged: (phone) {},
    );
  }
}
