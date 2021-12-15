import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_krista2/pages/edit_data_p.dart';
import 'package:project_krista2/widgets/profile.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Личный кабинет'),
          elevation: 0,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: users,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Что-то пошло не так');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Загрузка');
              }

              final data = snapshot.requireData;

              return ListView.builder(
                  itemCount: data.size - 1,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      const SizedBox(height: 194),
                      ProfileWidget(
                        imagePath: data.docs[index]['image'],
                        isEdit: false,
                        onClicked: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditDataPage()));
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(
                        data.docs[index]['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.docs[index]['email'],
                        style: const TextStyle(color: Colors.grey),
                      )
                    ]);
                  });
            }));
  }
}
