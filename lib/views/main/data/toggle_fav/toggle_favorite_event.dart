part of 'toggle_favorite_bloc.dart';

 class ToggleFavoriteEvents {}
   class ToggleFavoriteEvent extends ToggleFavoriteEvents {
   final bool is_favorite;
  final int id;
   ToggleFavoriteEvent( {required this.id,required this.is_favorite,});


   }

