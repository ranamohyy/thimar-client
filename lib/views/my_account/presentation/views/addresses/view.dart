import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/main/widgets/custom_item_address.dart';
import '../../../../../core/logic/helper_method.dart';
import '../../../data/addreses/bloc.dart';
import '../add_address/view.dart';

class AddressesView extends StatefulWidget {
  const  AddressesView ({super.key, required this.type});
final String type;
  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
final bloc= GetIt.I<ShowAddressesBloc>()..add(ShowAddressesEvent());
final editBloc= GetIt.I<EditAddressBloc>();
final deleteBloc= GetIt.I<DeleteAddressBloc>();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(
        bloc:bloc ,
        builder: (context, state) {
          if (state is ShowAddressLoadingState) {
            return const Scaffold(
              backgroundColor: Colors.white,
                body:  AppLoadingView());
          }
          if (state is ShowAddressSuccessStates) {
      return Scaffold(
      appBar:widget.type=='العناوين'?
      const CustomAppBar(text: 'العناوين'):
          AppBar(
            leading:const SizedBox(),
            centerTitle: true,
          title:const  Text('العناوين',style: kTextStyle18,),)
          ,

         bottomNavigationBar: Padding(
           padding: const EdgeInsets.only(bottom: 30.0,right: 12,left: 12),
           child: DottedBorder(
             dashPattern:const [7],
             color: kPrimaryColor,
             borderType: BorderType.RRect,
             radius: const Radius.circular(16),
             child: ElevatedButton(
               onPressed: () {
                 navigateTo( AddAddressView());
               },
               style: ElevatedButton.styleFrom(
                   backgroundColor:const Color(0XFFF9FCF5),
                    ),
               child:const Text(
                 "إضافة عنوان ",
                 style:  kTextStyle18),
               ),
           ),
         ),
      body: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 8),
              itemCount: state.list.length,
              itemBuilder:  widget.type=='العناوين'?
                  (context, index) {
               return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemAddressBuilder(
                      id: state.list[index].id,
                      address: state.list[index].location,
                      description: state.list[index].description,
                      phone: state.list[index].phone,
                      type: state.list[index].type,
                      onDelete: () {
                        deleteBloc.add(DeleteAddressesEvent(id: state
                            .list[index].id),
                        );
                        bloc.add(ShowAddressesEvent());
                      },
                      onEdit: () {
                        editBloc.add(EditAddressesEvent(id: state.list[index]
                            .id, type: state.list[index].type));
                        bloc.add(ShowAddressesEvent());
                      }


                  ),
                );}
                :  (context, index) {
                return   GestureDetector(
                  onTap:(){
                    Navigator.pop(context, state.list[index].id.toString());},
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ItemAddressBuilder(
                      id: state.list[index].id,
                        address: state.list[index].location,
                        description: state.list[index].description,
                        phone: state.list[index].phone,
                        type: state.list[index].type,
                        onDelete: () {
                          deleteBloc.add(DeleteAddressesEvent(id: state
                              .list[index].id),
                          );
                          bloc.add(ShowAddressesEvent());
                        },
                        onEdit: () {
                          editBloc.add(EditAddressesEvent(id: state.list[index]
                              .id, type: state.list[index].type));
                          bloc.add(ShowAddressesEvent());
                        }


                    ),
                  ),
                );},



      ))   ;

          }return Container(
            color: Colors.red,
          );
        });
  }
}
