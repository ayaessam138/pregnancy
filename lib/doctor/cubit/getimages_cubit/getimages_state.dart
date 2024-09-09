part of 'getimages_cubit.dart';

@immutable
abstract class GetimagesState {}

class GetimagesInitial extends GetimagesState {}

class Getimagesloading extends GetimagesState {}

class Getimagesstored extends GetimagesState {
  List<getimage> imageslist;
  Getimagesstored({required this.imageslist});
}
