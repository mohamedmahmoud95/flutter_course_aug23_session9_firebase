
import 'package:flutter/material.dart';

import '../Constants/project_colors.dart';

class AletDialogWidget extends StatelessWidget {
  final String contentText;
  final String? title;

  AletDialogWidget({Key? key, required this.contentText, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      title:  Text(title ?? '',
        style:  const TextStyle(fontSize: 20, height: 1.5,color: Colors.white10,
        ),
      ),
      content: Text(contentText,
        style:  const TextStyle(fontSize: 20, height: 1.5, color: Colors.white10,
        ),),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: mainGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          onPressed: () { Navigator.of(context).pop(); },
          child:  const Text("OK",
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );

  }


}


