enum PersonUrl {
  persons1,
  persons2,
}

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons1:
        return 'http://127.0.0.1:5500/lib/api/persons1.json';
      case PersonUrl.persons2:
        return 'http://127.0.0.1:5500/lib/api/persons2.json';
    }
  }
}
