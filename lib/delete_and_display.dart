import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseexample/add_and_update.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {

  CollectionReference ref = FirebaseFirestore.instance.collection('product');
  late Stream<QuerySnapshot>  productList;

  @override
  void initState() {
    productList = ref.snapshots();
    super.initState();
  }

  deleteSelectedItem(String id){
    ref.doc(id).delete().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data deleted successfully")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of Product"),),
      floatingActionButton: FloatingActionButton(
        child: const Center(child:Icon(Icons.add)),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDataToFirestore()));
        },
      ),
     body:Padding(
       padding: const EdgeInsets.all(10.0),
       child: StreamBuilder<QuerySnapshot>(stream: productList,
           builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasError){
              const Text("Error occurred");
            }
            if (snapshot.connectionState == ConnectionState.active) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
                  querySnapshot.docs;

              return ListView.builder(
                  itemCount: listQueryDocumentSnapshot.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot document =
                    listQueryDocumentSnapshot[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text("Name : ${document['name']}"),
                         subtitle: Text("Quantity : ${document['quantity']}"),
                        ),
                        Row(
                          children: [
                            Expanded(child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  AddDataToFirestore(editProduct: {
                                    "name":document['name'],
                                    "quantity":document['quantity']},
                                    id: document.id,
                                  )));
                            }, child: const Text("Update"))),
                            const SizedBox(width: 10.0,),
                            Expanded(child: ElevatedButton(onPressed: (){
                              deleteSelectedItem(document.id);
                            }, child: const Text("Delete")))
                          ],
                        )
                      ],
                    );
                  });
            }
            return const CircularProgressIndicator();
           }),
     )
    );
  }
}
