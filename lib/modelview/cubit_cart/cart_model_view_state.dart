part of 'cart_model_view_cubit.dart';

@immutable
sealed class CartModelViewState {}

final class CartModelViewInitial extends CartModelViewState {}

final class ChangeCartState extends CartModelViewState {}

final class AddedCartState extends CartModelViewState {}

final class RemovedCartState extends CartModelViewState {}

final class IncrementItemsState extends CartModelViewState {}

final class DecrementItemsState extends CartModelViewState {}
