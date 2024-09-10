part of 'add_address_bloc.dart';

  class AddAddressEvents {}
class GetAddAddressEvent extends AddAddressEvents{
  final type=TextEditingController();
   LatLng ?latlng;
  final phone=TextEditingController();
   final description= TextEditingController();
    int ?isDefault ;



}
