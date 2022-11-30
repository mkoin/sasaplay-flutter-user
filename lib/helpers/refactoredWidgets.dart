import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/size_config.dart';
import 'fonts_functions.dart';

TextFormField emailTextFormFieldMethod(
    {required onChanged(String value), TextEditingController? controller}) {
  return TextFormField(
    controller: controller,

    onChanged: (String value) {
      onChanged(value);
    },
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      hintStyle: kzillaSlab(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.5)),
      //  labelText: 'Email',
      hintText: 'Email',

      contentPadding: const EdgeInsets.only(left: 24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.6,
          color: Colors.black.withOpacity(0.1),
        ),
      ),
    ),
    // The validator receives the text that the user has entered.
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else {
        return null;
      }
    },
    style: kzillaSlab(fontWeight: FontWeight.w500, fontSize: 12),
  );
}

Widget passwordTextFormField(
    {required bool passwordValid,
    required Function(String value) onChanged,
    bool? isPasswordHidden,
    Function()? togglePasswordView,
    String? labelText,
    String? hintText}) {
  return Container(
    width: SizeConfig.screenWidth * 0.8,
    height: getProportionalScreenHeight(55),
    color: Colors.white,
    child: TextFormField(
      obscureText: isPasswordHidden ?? true,
      onChanged: (String value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        //  labelText: labelText ?? 'Password',
        hintText: hintText ?? 'Password',
        labelStyle: kzillaSlab(fontSize: 12, fontWeight: FontWeight.w500),
        hintStyle: kzillaSlab(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5)),
        contentPadding: const EdgeInsets.only(left: 24, right: 20, top: 5),
        suffix: isPasswordHidden != null
            ? IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: 16,
                onPressed: () {
                  togglePasswordView!();
                },
                icon: Icon(
                  isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                ),
                color: const Color(0xFF828282),
              )
            : Icon(
                passwordValid ? Icons.check_circle : null,
                color: Colors.teal,
              ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            width: 0.6,
            color: Colors.red.withOpacity(0.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            width: 0.6,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),

      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some characters';
        } else {
          return null;
        }
      },
    ),
  );
}

//custom input field
Widget inputField(
    {required void Function(String value) onChanged,
    String? hintText,
    FocusNode? focusNode,
    void Function()? onTap,
    void Function()? onEditingComplete,
    TextEditingController? controller}) {
  return TextFormField(
    onTap: onTap,
    onEditingComplete: onEditingComplete,
    onChanged: onChanged,
    focusNode: focusNode,
    controller: controller,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.05),
        hintText: hintText,
        hintStyle: kzillaSlab(color: Colors.grey.withOpacity(0.6)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.1),
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ))),
    style: kzillaSlab(
        // fontWeigEpse/EpPosht: FontWeight.w700,
        fontSize: 15,
        color: Colors.grey.withOpacity(0.3)),
  );
}

//custom search field
Widget searchField(
    {required void Function(String value) onChanged,
    String? hintText,
    void Function()? onEditingComplete,
    TextEditingController? controller}) {
  return TextFormField(
    onChanged: onChanged,
    onEditingComplete: onEditingComplete,
    controller: controller,
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.05),
        hintText: hintText,
        icon: const Icon(Icons.search),
        hintStyle: kzillaSlab(color: Colors.grey.withOpacity(0.6)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.1),
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ))),
    style: kzillaSlab(
        // fontWeigEpse/EpPosht: FontWeight.w700,
        fontSize: 16,
        color: Colors.grey.withOpacity(0.3)),
  );
}

Widget elevatedButtonMethod(
    {onPressed()?,
    required String label,
    double? width,
    double? fontSize,
    double buttonRadius = 11}) {
  return SizedBox(
    width: width,
    child: ElevatedButton(
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize),
      ),
      onPressed: () {
        onPressed!();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius))),
        // backgroundColor: MaterialStateProperty.all(Color(0xFF3776D4)),
      ),
    ),
  );
}

Widget elevatedButtonMethodOutlined(
    {onPressed()?,
    required String label,
    double? width,
    double? fontSize,
    double buttonRadius = 11}) {
  return SizedBox(
    width: width,
    child: ElevatedButton(
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize),
      ),
      onPressed: () {
        onPressed!();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            side: const BorderSide(color: Color(0xFF757574)))),
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent.withOpacity(0.2)),
     
        // backgroundColor: MaterialStateProperty.all(Color(0xFF3776D4)),
      ),
    ),
  );
}

Widget headerText(
    {required String title, Color? fontColor, TextAlign? textAlign}) {
  return Text(
    title,
    textAlign: textAlign,
    style: GoogleFonts.fjallaOne(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: fontColor ?? Colors.black,
    ),
  );
}



class CustomElevatedButtonWithChild extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget? child;
  final String? label;
  final double? fontSize;

  const CustomElevatedButtonWithChild({
    Key? key,
    required this.onPressed,
    this.child,
    this.label,
    this.borderRadius,
    this.fontSize,
    this.width,
    this.height = 44.0,
    this.gradient =
        const LinearGradient(colors: [Color(0xff0D71E1), Color(0xff12E63D)]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(18);
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: const EdgeInsets.all(5),
        height: height,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0, // soften the shadow
              spreadRadius: -0.9, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label ?? '',
              style:
                  kibmPlexSansArabic(color: Colors.white, fontSize: fontSize),
            ),
            child ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
