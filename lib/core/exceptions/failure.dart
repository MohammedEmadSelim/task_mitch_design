abstract class Failure {
  final String error;

  Failure({required this.error});
}


class CustomFailure extends Failure{
  CustomFailure({required super.error});
}