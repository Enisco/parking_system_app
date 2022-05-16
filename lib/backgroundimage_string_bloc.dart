import 'package:bloc/bloc.dart';

abstract class BackgroundImageEvent {}

class BackgroundImage1 extends BackgroundImageEvent {}

class BackgroundImage2 extends BackgroundImageEvent {}

class BackgroundImage3 extends BackgroundImageEvent {}

String backgroundImageString = 'images/futa1.jpg';

class BackgroundImageStringBloc extends Bloc<BackgroundImageEvent, String> {
  BackgroundImageStringBloc() : super('images/futa1.jpg') {
    on<BackgroundImage1>(
        (event, emit) => emit(backgroundImageString = 'images/futa1.jpg'));
    on<BackgroundImage2>(
        (event, emit) => emit(backgroundImageString = 'images/futa2.jpg'));
    on<BackgroundImage3>(
        (event, emit) => emit(backgroundImageString = 'images/futa3.jpg'));
  }
}
