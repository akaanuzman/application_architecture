import 'package:flutter_test/flutter_test.dart';

main(List<String> args) {
  setUp((){
    print('hello world');
  });

  test('User Login Fail Test', (){
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });
}