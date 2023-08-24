import 'package:firebaseapp/modal/product_modal.dart';
import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:firebaseapp/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Readscreen extends StatefulWidget {
  const Readscreen({super.key});

  @override
  State<Readscreen> createState() => _ReadscreenState();
}

class _ReadscreenState extends State<Readscreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtimage = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtcategory = TextEditingController();
Map m1=Get.arguments;
String? id;
@override
  void initState() {
    super.initState();
    if(m1['status']==1)
      {
        ProductModal modal=m1['product'];
        id=modal.id;
        txtname=TextEditingController(text: modal.name);
        txtprice=TextEditingController(text: modal.price);
        txtimage=TextEditingController(text: modal.image);
        txtcategory=TextEditingController(text: modal.category);
        txtdesc=TextEditingController(text: modal.desc);
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
            title: Text(
              "Add Product",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: Colors.white),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              customfield("name", txtname),
              const SizedBox(height: 10),
              customfield("price", txtprice),
              const SizedBox(height: 10),
              customfield("category", txtcategory),
              const SizedBox(height: 10),
              customfield("description", txtdesc),
              const SizedBox(height: 10),
              customfield("image", txtimage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if(m1['status']==0)
                    {
                      ProductModal p = ProductModal(
                          name: txtname.text,
                          category: txtcategory.text,
                          image: txtimage.text,
                          desc: txtdesc.text,
                          price: txtprice.text);
                      FirebaseHalper.fire.insertdata(p);
                      Notificationservice.service.image_Notification();
                    }
                  else
                    {
                      ProductModal p = ProductModal(
                          name: txtname.text,
                          id: id,
                          category: txtcategory.text,
                          image: txtimage.text,
                          desc: txtdesc.text,
                          price: txtprice.text);
                      FirebaseHalper.fire.update(p);
                    }

                  Get.back();
                },
                child: Text(m1['status']==0?"Add":"update", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField customfield(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Product $title",
        hintText: "Product $title",border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: Colors.blueGrey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(color: Colors.blueGrey,width: 2)),
      ),
    );
  }

}
