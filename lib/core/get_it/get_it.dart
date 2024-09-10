import 'package:get_it/get_it.dart';
import 'package:thimar/views/auth/data/confim_code/bloc.dart';
import 'package:thimar/views/main/data/similar_products/similar_products_bloc.dart';
import 'package:thimar/views/main/data/toggle_fav/toggle_favorite_bloc.dart';
import 'package:thimar/views/my_account/data/about_app_bloc/about_app_bloc.dart';
import 'package:thimar/views/my_account/data/add_address/add_address_bloc.dart';
import 'package:thimar/views/my_account/data/my_profile/bloc.dart';
import 'package:thimar/views/my_account/data/privacy_bloc/privacy_bloc.dart';
import '../../views/auth/data/forget_password/bloc.dart';
import '../../views/auth/data/login/bloc_bloc.dart';
import '../../views/auth/data/register/bloc.dart';
import '../../views/auth/data/resend_code/resend_code_bloc.dart';
import '../../views/auth/data/reset_password/bloc.dart';
import '../../views/main/data/actionButtonsBloc/action_button_bloc.dart';
import '../../views/main/data/categories_bloc/bloc.dart';
import '../../views/main/data/finish_order_bloc/finish_order_bloc.dart';
import '../../views/main/data/get_cart_bloc/send_item_cart_bloc.dart';
import '../../views/main/data/get_fav_products_bloc/get_fav_products_bloc.dart';
import '../../views/main/data/my_orders_bloc/orders_bloc.dart';
import '../../views/main/data/product_details/bloc.dart';
import '../../views/main/data/products_bloc/product_bloc.dart';
import '../../views/main/data/rate_products/bloc.dart';
import '../../views/main/data/show_cart_bloc/bloc.dart';
import '../../views/main/data/slider_bloc/bloc.dart';
import '../../views/my_account/data/addreses/bloc.dart';
import '../../views/my_account/data/charge_wallet_bloc/charge_wallet_bloc.dart';
import '../../views/my_account/data/faqs/bloc.dart';
import '../../views/my_account/data/get_contact/get_contact_bloc.dart';
import '../../views/my_account/data/get_wallet/bloc.dart';
import '../../views/my_account/data/send_contact_us/bloc.dart';
import '../../views/my_account/data/suggestions/bloc.dart';
import '../../views/my_account/data/terms and laws bloc/terms_bloc.dart';

void initGetIt(){

  final getIt =GetIt.instance;

  getIt.registerFactory(() =>SliderViewBloc() );
  getIt.registerFactory(() =>CatogryBloc() );
  getIt.registerFactory(() =>ProductBloc() );
  getIt.registerFactory(() =>AboutAppBloc());
  getIt.registerFactory(() => FaqsBloc());
  getIt.registerFactory(() => MyProfileBloc());
  getIt.registerFactory(() => LogInBloc());
  getIt.registerFactory(() => RegisterBloc());
  getIt.registerFactory(() => ConfirmCodeBloc());
  getIt.registerFactory(() => ResendCodeBloc());
  getIt.registerFactory(() => ForgetPasswordBloc());
  getIt.registerFactory(() => ResetPasswordBloc());
  getIt.registerFactory(() => ProductDetailsBloc());
  getIt.registerFactory(() => RateProductBloc());
  getIt.registerFactory(() => AddAddressBloc());
  getIt.registerFactory(() => ToggleFavBloc());
  getIt.registerFactory(() => GetFavProductsBloc());
  ///singletoon
  getIt.registerLazySingleton(() => ShowCartBloc());
  getIt.registerFactory(() => EditProfileBloc());
  getIt.registerFactory(() => EditCartBloc());
  getIt.registerFactory(() => PrivacyBloc());
  getIt.registerFactory(() => WalletChargeBloc());
  getIt.registerFactory(() => SimilarProductsBloc());
  getIt.registerFactory(() => TermsBloc());
  getIt.registerFactory(() => GetWalletBloc());
  getIt.registerFactory(() => EditPasswordBloc());
  getIt.registerFactory(() => ShowAddressesBloc());
  getIt.registerFactory(() => SuggestionsBloc());
  getIt.registerFactory(() => GetContactBloc());
  getIt.registerFactory(() => SendContactUsBloc());
  getIt.registerFactory(() => DeleteAddressBloc());
  getIt.registerFactory(() => EditAddressBloc());
  getIt.registerFactory(() => ActionButtonBloc());
  getIt.registerFactory(() => OrdersBloc());
  getIt.registerFactory(() => FinishOrderBloc());

}