class FavoriteManager {
  static final FavoriteManager _instance = FavoriteManager._internal();

  factory FavoriteManager() {
    return _instance;
  }

  FavoriteManager._internal();

  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => List.unmodifiable(_favorites);

  void addFavorite(Map<String, dynamic> favorite) {
    _favorites.add(favorite);
  }

  void removeFavorite(String name) {
    _favorites.removeWhere((fav) => fav['name'] == name);
  }

  bool isFavorite(String name) {
    return _favorites.any((fav) => fav['name'] == name);
  }
}
