
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar/core/logic/dio_helper.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
class AddAddressBloc extends Bloc<AddAddressEvents,AddAddressStates> {
  AddAddressBloc():super(AddAddressStates()){
  on<GetAddAddressEvent>(_sendData);
  }


  Future<void> _sendData(GetAddAddressEvent event, Emitter<AddAddressStates> emit) async{
  emit(AddAddressLoadingState());
  final location = getLocationName(event.latlng!.latitude,event.latlng!.longitude);
    final response = await DioHelper.send("client/addresses",data: {
  "type":event.type.text,
  "phone":event.phone.text,
  "description":event.description.text,
  "location":location,
  "lat":event.latlng,
  "lng":event.latlng,
  "is_default":event.isDefault
  });

  if(response.isSuccess){
  emit(AddAddressSuccessState(
  msg: response.msg
  ));
  }else{
  emit(AddAddressFailureState(errMessage: response.msg
  ));
  }
  }


Future<String?>  getLocationName(double latitude, double longitude)async{
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude,longitude);
return placemarks.firstOrNull?.street;
    }catch(e){
      return null;
    }
  }
  }



