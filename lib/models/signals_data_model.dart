import 'package:equatable/equatable.dart';

class SignalsDataModel extends Equatable {
  final String title;
  final String image;
  final String description;
  const SignalsDataModel({
    this.title = '',
    this.image = '',
    this.description = '',
  });

  @override
  List<Object> get props => [title, image, description];

  @override
  String toString() =>
      'SignalsDataModel(title: $title, image: $image, description: $description)';

  SignalsDataModel copyWith({
    String? title,
    String? image,
    String? description,
  }) {
    return SignalsDataModel(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }
}
