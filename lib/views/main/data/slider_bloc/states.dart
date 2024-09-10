part of 'bloc.dart';

 class SliderStates{}

class SliderSuccessState extends SliderStates{
  final String msg;
  final List <SliderModel> list;

  SliderSuccessState({required this.msg,required this.list});
}
class SliderLoadingState extends SliderStates {}
class SliderFailedState extends SliderStates{
  final String errMessage;

  SliderFailedState({required this.errMessage});
}