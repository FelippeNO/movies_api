class HttpClientBase {
  final String _baseUrl = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
  final String route;

  HttpClientBase(
    this.route,
  );

  Uri httpClient() {
    final uri = Uri.parse(_baseUrl + route);
    return uri;
  }
}
