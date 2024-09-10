part of 'bloc.dart';
class ShowAddressesEvents{}
class ShowAddressesEvent extends ShowAddressesEvents
{

  ShowAddressesEvent();


}
class DeleteAddressesEvent extends ShowAddressesEvents
{
  final int id;

  DeleteAddressesEvent({required this.id});


}
class EditAddressesEvent extends ShowAddressesEvents
{
  final int id;
  final String type;
  EditAddressesEvent({required this.id,required this.type});


}
