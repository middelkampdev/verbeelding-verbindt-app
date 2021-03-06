import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.personalImage,
  });

  final String firstName;
  final String? middleName;
  final String lastName;
  final String? personalImage;

  String get fullName {
    final middle = middleName?.isNotEmpty == true ? '$middleName ' : '';
    return '$firstName $middle$lastName';
  }

  bool get hasPersonalImage => personalImage?.isNotEmpty == true;

  @override
  List<Object?> get props => [
        firstName,
        middleName,
        lastName,
        personalImage,
      ];

  Profile copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? personalImage,
  }) {
    return Profile(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      personalImage: personalImage ?? this.personalImage,
    );
  }
}
