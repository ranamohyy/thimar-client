import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
static int? userId;
static String? city_name;
static String? userName;
static String? token;
static String? image;
static String? phoneNumber;


static bool get isAuth => token?.isNotEmpty ==true;


 static late final SharedPreferences prefs ;

 static init ()async{
   prefs  = await SharedPreferences.getInstance();
   userId = prefs.getInt('user_id');
   city_name = prefs.getString('city');
   userName = prefs.getString('user_name');
   token = prefs.getString('token');
   image = prefs.getString('image');
   phoneNumber = prefs.getString('phone');
 }


 static saveData (){
   if(userId !=null) prefs.setInt('user_id', userId!);
   if(userName !=null) prefs.setString('user_name',userName!);
   if(token !=null) prefs.setString('token', token !);
   if(image !=null) prefs.setString('image', image!);
   if(phoneNumber !=null) prefs.setString('phone', phoneNumber!);
   if(city_name !=null) prefs.setString('city', city_name!);
 }

 static clear (){
   prefs.remove('user_id');
   prefs.remove('user_name');
   prefs.remove('token');
   prefs.remove('image');
   prefs.remove('phone');
   prefs.remove('city');
 }
}