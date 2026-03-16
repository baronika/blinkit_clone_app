import 'package:blinkit_clone_app/data/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Future<void> saveUserToFirestore(String name) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set({
        "uid": user.uid,
        "name": name,
        "phone": user.phoneNumber,
        "createdAt": FieldValue.serverTimestamp(),
        "lastLogin": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      print("User saved to Firestore");

    }
  }

  Future<DocumentSnapshot> getUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();
  }

  Future<void> addAddress({
    required String address,
    required String name,
    required String phone,
    required String forWhom
  }) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("address")
        .add({
      "name": name,
      "address": address,
      "phone": phone,
      "forWhom": forWhom,
      "createdAt": FieldValue.serverTimestamp()
    });
  }

  Stream<QuerySnapshot<Map<String,dynamic>>> getAddress(){
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("address")
        .snapshots();
  }

  Future<void> updateAddress({
    required String id,
    required String address,
    required String name,
    required String phone,
    required String forWhom
  }) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("address")
        .doc(id)
        .update({
      "name": name,
      "address": address,
      "phone": phone,
      "forWhom": forWhom,
      "createdAt": FieldValue.serverTimestamp()
    });
  }
  Future<void> deleteAddress(String id) async{
    String uid=FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("address")
        .doc(id)
        .delete();
  }

  Future<void> addProducts(Product product) async{
    await FirebaseFirestore.instance
        .collection("products")
        .doc(product.id.toString())
        .set(product.toJson());
  }

  Future<List<Product>>  fetchProductsFromFirestore() async{
    final snapshot=await FirebaseFirestore.instance.collection("products").get();
    return snapshot.docs.map((doc)=>
        Product.fromJson(doc.data())
    ).toList();
  }
}