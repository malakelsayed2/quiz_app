import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/core/resources/color_manager.dart';
import 'package:quizapp/core/resources/route_manager.dart';
import 'package:quizapp/core/resources/size_manager.dart';
import 'package:quizapp/core/resources/string_manager.dart';
import 'package:quizapp/view/splash/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage(StringManagerLogin.image),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                StringManagerSplash.logo,
                style: GoogleFonts.quicksand(
                  fontSize: FontSize.font200,
                  color: Color(ColorMangager.mainColor),
                ),
              ),
              Container(
                padding: EdgeInsets.all(PaddingSize.pad20),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Radius.rad40),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: Width.wid2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Radius.rad40),
                        borderSide: BorderSide(
                          color: Color(ColorMangager.mainColor),
                          width: Width.wid4,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Radius.rad40),
                      ),
                      label: Text(
                        StringManagerLogin.label,
                        style: TextStyle(fontSize: FontSize.font20),
                      ),
                      labelStyle: TextStyle(fontSize: FontSize.font15),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringManagerLogin.validation;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              CustomButton(
                text: StringManagerLogin.start,
                function: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteStringManager.quizScreen,
                    );
                  }
                },
                colorText: Colors.white,
                colorButton: Color(ColorMangager.mainColor),
                fontweight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
