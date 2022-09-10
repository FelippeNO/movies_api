import 'package:faker/faker.dart';

String get proxyImgUrl => 'https://picsum.photos/seed/image${faker.randomGenerator.integer(100)}/500/500';
int get proxyInt => faker.randomGenerator.integer(9999);
List<int> get proxyInts => faker.randomGenerator.numbers(200, 12);
double get proxyDouble => faker.randomGenerator.decimal();
String get proxyWord => faker.lorem.word();
String proxyWords([int words = 12]) => faker.lorem.words(words).join(' ');
bool get proxyBool => faker.randomGenerator.boolean();
DateTime get proxyDate => faker.date.dateTime();
