// import 'package:cloud_firestore/cloud_firestore.dart';

// class FridgeItem {
//   final String name;
//   final int quantity;
//   final String expiry;

//   const FridgeItem({
//     required this.name,
//     required this.quantity,
//     required this.expiry,
//   });

//   toJson() {
//     return {"name": name, "quantity": quantity, "expiry": expiry};
//   }

//   // Map fetched data from Firebase to model
//   factory FridgeItem.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return FridgeItem(
//         name: data["Name"], quantity: data["Quantity"], expiry: data["Epiry"]);
//   }
// }
