import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInpoutBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      enabledBorder: outlineInpoutBorder,
      focusedBorder: outlineInpoutBorder,
      filled: true,
      suffixIcon: IconButton(icon: Icon(Icons.send_outlined), onPressed: () {
        final textValue = textController.text;
        print('Enviando mensaje: $textValue');
        textController.clear();
        focusNode.requestFocus();
      }),
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Enviando mensaje: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      focusNode: focusNode,
    );
  }
}
