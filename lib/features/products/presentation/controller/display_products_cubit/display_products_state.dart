part of 'display_products_cubit.dart';

@immutable
sealed class DisplayProductsState {}

final class DisplayProductsInitial extends DisplayProductsState {}

final class DisplayProductsLoading extends DisplayProductsState {}
final class DisplayProductsSuccess extends DisplayProductsState {
  final bool isLoading;

  DisplayProductsSuccess(this.isLoading);
}
final class DisplayProductsFailure extends DisplayProductsState {}

final class DisplayProductsSorted extends DisplayProductsState {}

final class DisplayProductsChangeGroupValue extends DisplayProductsState {}

final class DisplayProductsSelectArrangement extends DisplayProductsState {
  DisplayProductsSelectArrangement();
}
