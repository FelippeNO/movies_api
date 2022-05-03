import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

String comicsToMap(Comics data) => json.encode(data.toMap());

Future<List<Movie>> pegarJson() async {
  String baseurl = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies";

  final data = Uri.parse(baseurl);
  http.Response response = await http.get(data);

  final dados = json.decode(response.body).cast<Map<String, dynamic>>();
  // debugPrint(dados.map<Movie>((json).toString()));
  return dados.map<Movie>((json) => Movie.fromJson(json)).toList();
}

class Movie {
  int? id;
  double? voteAverage;
  String? title;
  String? posterUrl;
  List<String>? genres;
  String? releaseDate;

  Movie({this.id, this.voteAverage, this.title, this.posterUrl, this.genres, this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    genres = json['genres'].cast<String>();
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['poster_url'] = this.posterUrl;
    data['genres'] = this.genres;
    data['release_date'] = this.releaseDate;
    return data;
  }
}

class Comics2 {
  int id;
  String? description;
  int? pagecount;

  Comics2({required this.id, this.description, this.pagecount});

  static Comics2 fromJson(Map<String, dynamic> json) {
    return Comics2(id: json["id"], pagecount: json["pageCount"], description: json["description"]);
  }
}

class Comics {
  Comics(
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.collections,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  );

  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String modified;
  final String isbn;
  final String upc;
  final DiamondCode diamondCode;
  final String ean;
  final String issn;
  final Format format;
  final int pageCount;
  final List<TextObject> textObjects;
  final String resourceUri;
  final List<Url> urls;
  final List<dynamic> collections;
  final List<Date> dates;
  final List<Price> prices;
  final Thumbnail thumbnail;
  final List<Thumbnail> images;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters events;

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "digitalId": digitalId == null ? null : digitalId,
        "title": title == null ? null : title,
        "issueNumber": issueNumber == null ? null : issueNumber,
        "variantDescription": variantDescription == null ? null : variantDescription,
        "description": description == null ? null : description,
        "modified": modified == null ? null : modified,
        "isbn": isbn == null ? null : isbn,
        "upc": upc == null ? null : upc,
        "diamondCode": diamondCode == null ? null : diamondCodeValues.reverse[diamondCode],
        "ean": ean == null ? null : ean,
        "issn": issn == null ? null : issn,
        "format": format == null ? null : formatValues.reverse[format],
        "pageCount": pageCount == null ? null : pageCount,
        "textObjects": textObjects == null ? null : List<dynamic>.from(textObjects.map((x) => x.toMap())),
        "resourceURI": resourceUri == null ? null : resourceUri,
        "urls": urls == null ? null : List<dynamic>.from(collections.map((x) => x)),
        "dates": dates == null ? null : List<dynamic>.from(dates.map((x) => x.toMap())),
        "prices": prices == null ? null : List<dynamic>.from(prices.map((x) => x.toMap())),
        "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toMap())),
        "creators": creators == null ? null : creators.toMap(),
        "characters": characters == null ? null : characters.toMap(),
        "stories": stories == null ? null : stories.toMap(),
        "events": events == null ? null : events.toMap(),
      };
}

class Characters {
  Characters(
    this.available,
    this.collectionUri,
    this.returned,
  );

  final int available;
  final String collectionUri;
  final int returned;

  Map<String, dynamic> toMap() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "returned": returned == null ? null : returned,
      };
}

class Creators {
  Creators(
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  );

  final int available;
  final String collectionUri;
  final List<CreatorsItem> items;
  final int returned;

  Map<String, dynamic> toMap() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned == null ? null : returned,
      };
}

class CreatorsItem {
  CreatorsItem(
    this.resourceUri,
    this.name,
    this.role,
  );

  final String resourceUri;
  final String name;
  final Role role;

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "role": role == null ? null : roleValues.reverse[role],
      };
}

enum Role { EDITOR, WRITER, PENCILLER, PENCILLER_COVER, COLORIST, INKER, LETTERER, PENCILER }

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciler": Role.PENCILER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  Date(
    this.type,
    this.date,
  );

  final DateType type;
  final String date;

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : dateTypeValues.reverse[type],
        "date": date == null ? null : date,
      };
}

enum DateType { ONSALE_DATE, FOC_DATE }

final dateTypeValues = EnumValues({"focDate": DateType.FOC_DATE, "onsaleDate": DateType.ONSALE_DATE});

enum DiamondCode { EMPTY, JUL190068 }

final diamondCodeValues = EnumValues({"": DiamondCode.EMPTY, "JUL190068": DiamondCode.JUL190068});

enum Format { EMPTY, COMIC, TRADE_PAPERBACK, DIGEST }

final formatValues = EnumValues(
    {"Comic": Format.COMIC, "Digest": Format.DIGEST, "": Format.EMPTY, "Trade Paperback": Format.TRADE_PAPERBACK});

class Thumbnail {
  Thumbnail(
    this.path,
    this.extension,
  );

  final String path;
  final Extension extension;

  Map<String, dynamic> toMap() => {
        "path": path == null ? null : path,
        "extension": extension == null ? null : extensionValues.reverse[extension],
      };
}

enum Extension { JPG }

final extensionValues = EnumValues({"jpg": Extension.JPG});

class Price {
  Price(
    this.type,
    this.price,
  );

  final PriceType type;
  final double price;

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : priceTypeValues.reverse[type],
        "price": price == null ? null : price,
      };
}

enum PriceType { PRINT_PRICE }

final priceTypeValues = EnumValues({"printPrice": PriceType.PRINT_PRICE});

class Stories {
  Stories(
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  );

  final int available;
  final String collectionUri;
  final List<StoriesItem> items;
  final int returned;

  Map<String, dynamic> toMap() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned == null ? null : returned,
      };
}

class StoriesItem {
  StoriesItem(
    this.resourceUri,
    this.name,
    this.type,
  );

  final String resourceUri;
  final String name;
  final ItemType type;

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "type": type == null ? null : itemTypeValues.reverse[type],
      };
}

enum ItemType { COVER, INTERIOR_STORY, PROMO }

final itemTypeValues =
    EnumValues({"cover": ItemType.COVER, "interiorStory": ItemType.INTERIOR_STORY, "promo": ItemType.PROMO});

class TextObject {
  TextObject(
    this.type,
    this.language,
    this.text,
  );

  final TextObjectType type;
  final Language language;
  final String text;

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : textObjectTypeValues.reverse[type],
        "language": language == null ? null : languageValues.reverse[language],
        "text": text == null ? null : text,
      };
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_SOLICIT_TEXT }

final textObjectTypeValues = EnumValues({"issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT});

class Url {
  Url(
    this.type,
    this.url,
  );

  final UrlType type;
  final String url;

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : urlTypeValues.reverse[type],
        "url": url == null ? null : url,
      };
}

enum UrlType { DETAIL, PURCHASE }

final urlTypeValues = EnumValues({"detail": UrlType.DETAIL, "purchase": UrlType.PURCHASE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
