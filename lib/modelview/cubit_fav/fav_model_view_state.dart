part of 'fav_model_view_cubit.dart';

@immutable
sealed class FavModelViewState {}

final class FavModelViewInitial extends FavModelViewState {}

final class ChangeFavState extends FavModelViewState {}

final class AddedFavState extends FavModelViewState {}

final class RemovedFavState extends FavModelViewState {}
