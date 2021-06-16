import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);


  TextEditingController textEditingController = TextEditingController();
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('validator and storage',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: textEditingController,decoration: InputDecoration(
              hintText: 'Enter your email'
            ),),
          ),
          ButtonBar(
            children: [
              ElevatedButton(onPressed: () {
                print(textEditingController.text);
                if(GetUtils.isEmail(textEditingController.text)){
                  storage.write('email', textEditingController.text);
                  textEditingController.clear();
                }else{
                  Get.snackbar('Email is invalid', 'Please insert Correct Email');
                }

              }, child: Text('write')),
              ElevatedButton(onPressed: () {
               var value =  storage.read('email');
               print(value);
               Get.snackbar('Email was', value,borderColor: Colors.orange,borderWidth: 10,backgroundColor: Colors.amberAccent,snackPosition:SnackPosition.BOTTOM );
              }, child: Text('read')),
            ],
          )
        ],
      ),
    );
  }
}
