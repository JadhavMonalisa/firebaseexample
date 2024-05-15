import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddDataToFirestore extends StatefulWidget {
  Map<String,dynamic>? editProduct;
  String? id;
  AddDataToFirestore({super.key,this.editProduct,this.id});

  @override
  State<AddDataToFirestore> createState() => _AddDataToFirestoreState();
}

class _AddDataToFirestoreState extends State<AddDataToFirestore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    if(widget.editProduct!.isNotEmpty){
      nameController.text = widget.editProduct!['name'];
      quantityController.text = widget.editProduct!['quantity'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text( widget.editProduct!.isNotEmpty?"Update data":"Add data"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter product name'
                ),
              ),
              const SizedBox(height: 20.0,),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(
                  hintText: 'Enter product quantity'
                ),
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(onPressed: (){
                widget.editProduct!.isNotEmpty?updateData(widget.id!): addData();
              }, child: Center(child: Text(widget.editProduct!.isNotEmpty?"Update":'Add')))
            ],
          ),
        ),
      ),
    );
  }

  ///add data to firestore table name as product
  addData(){
    Map<String,dynamic> productData = {
      'name':nameController.text,
      'quantity':quantityController.text
    };
    FirebaseFirestore.instance.collection('product')
        .add(productData).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data added successfully")));
    });
  }
  ///update data to firestore table name as product to given id
  updateData(String id){
    Map<String,dynamic> productData = {
      'name':nameController.text,
      'quantity':quantityController.text
    };
    FirebaseFirestore.instance.collection('product')
        .doc(id)
        .update(productData).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data updated successfully")));
    });
  }
}
