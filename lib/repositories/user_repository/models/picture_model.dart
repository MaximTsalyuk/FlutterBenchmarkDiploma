class PictureModel {
  final String large, medium, thumbnail;

  PictureModel({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  static PictureModel fromJson(Map<String, dynamic> json) => PictureModel(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail'],
      );

  Map<String, dynamic> toJson() => {
        'large': large,
        'medium': medium,
        'thumbnail': thumbnail,
      };
}
