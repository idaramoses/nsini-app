class DataModel {
  final String english;
  final String oro;

  DataModel({required this.english, required this.oro});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      english: json['ENGLISH'] ?? '',
      oro: json['oro'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ENGLISH': english,
      'oro': oro,
    };
  }
}
