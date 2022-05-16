import 'package:bloc/bloc.dart';

abstract class ParkingSpaceImageEvent {}

class Image000 extends ParkingSpaceImageEvent {}

class Image001 extends ParkingSpaceImageEvent {}

class Image010 extends ParkingSpaceImageEvent {}

class Image011 extends ParkingSpaceImageEvent {}

class Image100 extends ParkingSpaceImageEvent {}

class Image101 extends ParkingSpaceImageEvent {}

class Image110 extends ParkingSpaceImageEvent {}

class Image111 extends ParkingSpaceImageEvent {}

String parkingStateImageString = 'images/000.jpg';

class ParkingStateImageStringBloc extends Bloc<ParkingSpaceImageEvent, String> {
  ParkingStateImageStringBloc() : super('My Account') {
    on<Image000>(
        (event, emit) => emit(parkingStateImageString = 'images/000.jpg'));
    on<Image001>(
        (event, emit) => emit(parkingStateImageString = 'images/001.jpg'));
    on<Image010>(
        (event, emit) => emit(parkingStateImageString = 'images/010.jpg'));
    on<Image011>(
        (event, emit) => emit(parkingStateImageString = 'images/011.jpg'));
    on<Image100>(
        (event, emit) => emit(parkingStateImageString = 'images/100.jpg'));
    on<Image101>(
        (event, emit) => emit(parkingStateImageString = 'images/101.jpg'));
    on<Image110>(
        (event, emit) => emit(parkingStateImageString = 'images/110.jpg'));
    on<Image111>(
        (event, emit) => emit(parkingStateImageString = 'images/111.jpg'));
  }
}
