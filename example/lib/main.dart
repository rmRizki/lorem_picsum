import 'package:flutter/material.dart';
import 'package:lorem_picsum/lorem_picsum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final LoremPicsum _loremPicsum = LoremPicsum();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lorem Picsum Example')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                Image.network(_loremPicsum.getImage(200, 200)),
                Image.network(_loremPicsum.getImage(300, 200, grayscale: true)),
                Image.network(_loremPicsum.getImage(200, 400, blur: 5)),
                Image.network(
                    _loremPicsum.getSpecificImage(1, 200, 200, blur: 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
