import 'package:test/test.dart';
import 'package:lorem_picsum/lorem_picsum.dart';

void main() {
  LoremPicsum loremPicsum;

  setUpAll(() {
    loremPicsum = LoremPicsum();
  });
  test('get image list', () async {
    var imageList = await loremPicsum.getImageList();
    expect(imageList.length, 30);
    expect(imageList, isA<List<Photo>>());
  });

  test('get image detail', () async {
    var image = await loremPicsum.getImageDetail(0);
    expect(image.id, 0);
    expect(image, isA<Photo>());
  });
}
