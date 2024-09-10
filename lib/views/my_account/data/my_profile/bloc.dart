
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import '../../../../core/logic/cache_helper.dart';

part  'events.dart';
part 'states.dart';
part  'model.dart';
///getProfile
class MyProfileBloc extends Bloc<ProfileEvents,ProfileStates> {
  MyProfileBloc() :super(ProfileStates()) {
    on <GetProfileEvent>(_getData);
}

Future<void>_getData (GetProfileEvent event,Emitter<ProfileStates>emit)async
{
  
  emit (ProfileLoadingState());
  final response = await DioHelper.get('client/profile');

  if(response.isSuccess){
    final data = ProfileModel.fromJson(response.data["data"]);
  emit(ProfileSuccessState(msg: response.msg, list: data));
  }
  else{
    ProfileFailureState(
      errMessage: response.msg
    );
  }
}}

///
class EditProfileBloc extends Bloc<ProfileEvents,ProfileStates> {
  EditProfileBloc():super(EditProfileInitialState()){
    on<EditProfileEvent>(_sendData);
  }
  Future<void>_sendData (EditProfileEvent event,Emitter<ProfileStates>emit)async
  {
    emit(EditProfileLoadingState());
    final response = await DioHelper.send('client/profile',
        data: {
        'image':MultipartFile.fromFileSync(event.image!.path),
        'fullname':event.nameController.text,
          'phone':event.phoneController.text,
          'city':event.cityController.text,
        });
    if (response.isSuccess) {
      CachHelper.userId = response.data['data']['id'];
      CachHelper.image= response.data['data']['image'];
      CachHelper.city_name= response.data['data']['city'];
      CachHelper.phoneNumber= response.data['data']['phone'];
      CachHelper.userName= response.data['data']['fullname'];
      CachHelper.saveData();

      emit(EditProfileSuccessState(msg: response.msg));
    }
    else {
      EditProfileFailureState(
          errMessage: response.msg
      );
    }
  }}



class EditPasswordBloc extends Bloc<ProfileEvents,ProfileStates> {
  EditPasswordBloc() :super(EditPasswordInitialState()) {
    on <EditPasswordEvent>(_editData );
  }

  Future<void>_editData (EditPasswordEvent event,Emitter<ProfileStates>emit)async
  {
emit((EditPasswordLoadingState()));

    final response = await DioHelper.put('edit_password',data: {
      "old_password":event.oldPasswordController.text,
      "password":event.passwordController.text,
      "password_confirmation":event.passwordConfirmationController.text
    });

    if(response.isSuccess){
      emit(EditPasswordSuccessState(msg: response.msg));
    }
    else{
      EditPasswordFailureState(
          errMessage: response.msg
      );
    }
  }}