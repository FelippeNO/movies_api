class HttpClientBase {
  final String baseUrl = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
  final String route;

  HttpClientBase(
    this.route,
  );

  Uri httpClient() {
    final uri = Uri.parse(baseUrl + route);
    return uri;
  }
}
