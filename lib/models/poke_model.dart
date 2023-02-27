class PokeModel {
  PokeModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<PokeItemModel> results;

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    return PokeModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<PokeItemModel>.from(json['results'].map(
        (result) => PokeItemModel.fromJson(result),
      )),
    );
  }
}

class PokeItemModel {
  PokeItemModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory PokeItemModel.fromJson(Map<String, dynamic> json) {
    return PokeItemModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
