import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_krista2/widgets/profile.dart';

class EditDataPage extends StatefulWidget {
  const EditDataPage({Key key}) : super(key: key);

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Редактирование профиля'),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: users,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Что-то пошло не так');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Загрузка');
            }

            final data = snapshot.requireData;

            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  nameController.text = data.docs[index]['name'];
                  emailController.text = data.docs[index]['email'];
                  imageURLController.text = data.docs[index]['image'];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      const SizedBox(height: 24),
                      ProfileWidget(
                        imagePath: data.docs[index]['image'],
                        isEdit: true,
                      ),
                      const SizedBox(height: 24),
                      _buildTextField(nameController, 'Имя, фамилия'),
                      const SizedBox(height: 24),
                      _buildTextField(emailController, 'Email'),
                      const SizedBox(height: 24),
                      _buildTextField(imageURLController, 'Фото профиля'),
                      const SizedBox(height: 34),
                      Center(
                          child: MaterialButton(
                              child: const Text('Сохранить'),
                              color: Colors.amberAccent[100],
                              shape: const StadiumBorder(),
                              onPressed: () {
                                snapshot.data.docs[index].reference.update({
                                  'name': nameController.text,
                                  'email': emailController.text,
                                  'image': imageURLController.text
                                }).whenComplete(
                                    () => Navigator.of(context).pop());
                              })),
                    ]),
                  );
                });
          }));

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.amber[100],
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black38),
        ),
        // prefix: Icon(icon),
      ),
    );
  }
}
