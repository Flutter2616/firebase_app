import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/controller/login_controller.dart';
import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Phonelogin extends StatefulWidget {
  const Phonelogin({super.key});

  @override
  State<Phonelogin> createState() => _PhoneloginState();
}

class _PhoneloginState extends State<Phonelogin> {
  TextEditingController txtnumber = TextEditingController();
  Logincontroller controller=Get.put(Logincontroller());
  @override
  void initState() {
    super.initState();
    FirebaseHalper.fire.iniMessage();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
          children: [
              TextField(keyboardType: TextInputType.number,
                controller: txtnumber,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: "phone number",
                    hintText: "phone number",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: ()  {
                  FirebaseHalper.fire.phone_Login(txtnumber.text);
                  Get.toNamed("otp");
                },
                child: Text("Otp",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
            )),
      ),
    );
  }
}
