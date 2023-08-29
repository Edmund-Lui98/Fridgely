import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FridgeList extends StatefulWidget {
  const FridgeList({super.key});

  @override
  State<FridgeList> createState() => _FridgeListState();
}

class _FridgeListState extends State<FridgeList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final fridgeStream =
        FirebaseFirestore.instance.collection("Fridge").snapshots();

    return Scaffold(
      body: StreamBuilder(
        stream: fridgeStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Connection Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          }

          var docs = snapshot.data!.docs;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.03,
                          screenHeight * 0.01,
                          screenWidth * 0.03,
                          screenHeight * 0.01),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(docs[index]["Name"]),
                            subtitle: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                        "Quantity: ${docs[index]["Quantity"]}")),
                                Expanded(
                                    child: Text(
                                        "Expiration: ${docs[index]["Expiration"]}")),
                              ],
                            ),
                          )));
                },
              ))
            ],
          );
        },
      ),
    );
  }
}
