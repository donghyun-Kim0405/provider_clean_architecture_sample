import 'dart:math';

import 'package:faker/faker.dart';


abstract class FakerUtil {

  static final _faker = Faker();

  static String get name => _faker.person.name();

  static String get phone => _faker.phoneNumber.de();

  static String get content => _faker.lorem.sentence();

  static String get word => _faker.lorem.word();

  static String get city => _faker.address.city();

  static String get state => _faker.address.state();

  static String get country => _faker.address.country();

  static String get roadAddr => _faker.address.streetAddress();

  static DateTime get dateTime =>
      _faker.date.dateTime(minYear: 2023, maxYear: 2024);

  static String get uid => _faker.guid.guid();

  static String get imageUrl =>
      _faker.image.image(
        keywords: ['nature', 'water'], // 이미지 검색 키워드 (옵션)
        width: 640, // 이미지 너비
        height: 480, // 이미지 높이
        random: true, // 랜덤 이미지
      );

  static bool get flag => _faker.randomGenerator.boolean();

  static int get number => _faker.randomGenerator.integer(1000);

  static num latSeoul = 37.554713;
  static num lngSeoul = 126.970788;


}