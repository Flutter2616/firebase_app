import 'package:firebaseapp/controller/login_controller.dart';
import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController txtotp =TextEditingController();
  Logincontroller login=Get.put(Logincontroller());
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            children: [
              TextField(keyboardType: TextInputType.number,
                controller: txtotp,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: "Enter otp",
                    hintText: "otp",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String msg="";
                  // msg=await FirebaseHalper.fire.get_Otp(txtotp.text);
                  if(msg=="success")
                    {
                      Get.offAllNamed("home");
                    }
                },
                child: Text("Verify",
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
