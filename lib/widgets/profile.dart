import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({Key key, this.imagePath, this.onClicked, this.isEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
        child: Stack(children: [
      buildImage(),
      isEdit
          ? const Text('')
          : Positioned(
              child: buildEditIcon(Colors.amberAccent[700]),
              bottom: 0,
              right: 4,
            ),
    ]));
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath); //imagePath.contains('htpps://')
    // ? NetworkImage(imagePath)
    // : FileImage(File(imagePath));
    return ClipOval(
        child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: image as ImageProvider,
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(onTap: onClicked),
            )));
  }

  Widget buildEditIcon(Color color) => buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ));

  Widget buildCircle({Widget child, double all, Color color}) => ClipOval(
        child:
            Container(padding: EdgeInsets.all(all), color: color, child: child),
      );
}
