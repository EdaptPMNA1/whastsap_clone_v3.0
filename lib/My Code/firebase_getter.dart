import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseDataScreen extends StatefulWidget {
  const FirebaseDataScreen({Key? key}) : super(key: key);

  @override
  _FirebaseDataScreenState createState() => _FirebaseDataScreenState();
}

class _FirebaseDataScreenState extends State<FirebaseDataScreen> {
  late List<Map<String, dynamic>> firebaseData;

  @override
  void initState() {
    super.initState();
    retrieveDataFromFirebase();
  }

  void retrieveDataFromFirebase() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('Users');
    QuerySnapshot querySnapshot = await collection.get();

    List<Map<String, dynamic>> data = [];
    querySnapshot.docs.forEach((doc) {
      data.add(doc.data() as Map<String, dynamic>);
    });

    setState(() {
      firebaseData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Data Example'),
      ),
      body: firebaseData != null
          ? ListView.builder(
              itemCount: firebaseData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(firebaseData[index]['Name']),
                  subtitle: Text(firebaseData[index]['Bio']),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FirebaseDataScreen(),
  ));
}
