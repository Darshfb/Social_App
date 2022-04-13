import 'package:flutter/material.dart';
import 'package:flutter_learning/shared/component.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: DefaultAppBar(context: context, title: 'Add Post'),
      body: const Center(
        child: Text('add post'),
      ),
    );
  }
}
