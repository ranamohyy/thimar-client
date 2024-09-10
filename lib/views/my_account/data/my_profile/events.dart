part of 'bloc.dart';

abstract class ProfileEvents{}

class GetProfileEvent extends ProfileEvents{

  GetProfileEvent();
}




class EditProfileEvent extends ProfileEvents{
late  TextEditingController   nameController ;
late  TextEditingController phoneController;
late  TextEditingController cityController ;
late TextEditingController  passwordController ;
late  TextEditingController passwordConfirmationController;
  late File?  image ;
EditProfileEvent(){
  nameController = TextEditingController();
  phoneController = TextEditingController();
  cityController = TextEditingController();

  image = null;
}

}



class EditPasswordEvent extends ProfileEvents{
final TextEditingController  passwordController = TextEditingController();
final TextEditingController    oldPasswordController= TextEditingController() ;
final  TextEditingController passwordConfirmationController = TextEditingController();
EditPasswordEvent();

}
