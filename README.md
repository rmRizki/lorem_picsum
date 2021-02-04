# lorem_picsum

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) 
[![pub package](https://img.shields.io/pub/v/lorem_picsum.svg)](https://pub.dartlang.org/packages/lorem_picsum)


Dart client for Lorem Picsum, the Lorem Ipsum for photos

## Usage

```dart
import 'package:lorem_picsum/lorem_picsum.dart';

main() async {
  final loremPicsum = LoremPicsum();

  // get random image url, provide the width and height
  String image = loremPicsum.getImage(200, 300);

  // get specific image, provide id, width, and height
  String specificImage = loremPicsum.getSpecificImage(1, 200, 300);

  // get the same random image every time, provide seed, width, and height
  String staticImage = loremPicsum.getStaticImage('seed', 200, 300);

  // get image list, default limit is 30
  List<Photo> photoList = await loremPicsum.getImageList(limit: 30, page: 1);

  // get image detail
  Photo photo = await loremPicsum.getImageDetail(1);
}
```

## License

MIT

## Credits

This package is based on [Lorem Picsum](https://picsum.photos/) created by [David Marby](https://dmarby.se/) and [Nijiko Yonskai](https://github.com/Nijikokun)