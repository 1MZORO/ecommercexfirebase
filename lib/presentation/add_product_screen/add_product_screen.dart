import 'dart:developer';
import 'dart:io';

import 'package:ecommercexfirebase/presentation/add_product_screen/add_product_cubit.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_button.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/common_textfield.dart';
import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/assets.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddProductCubit(),
      child: BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
          final cubit = context.read<AddProductCubit>();
          return GestureDetector(
            onTap: () => unFocus(context),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: size(context).width * numD03,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size(context).width * numD16),
                            GestureDetector(
                              onTap: (){
                                router.pop();
                              },
                              child: Container(
                                height: size(context).width*numD14,
                                width: size(context).width*numD14,
                                decoration: BoxDecoration(
                                    color: colorLightTwo,
                                    shape: BoxShape.circle
                                ),
                                child: Center(child: Icon(Icons.arrow_back_ios_new_rounded)),
                              ),
                            ),
                            SizedBox(height: size(context).width * numD03),
                            CommonText(
                              text: 'Add Products',
                              fontSize: size(context).width * numD08,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: size(context).width * numD04),
                            CommonTextField(hintText: txBrandName,controller: cubit.brandController,
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return txFieldCanNotBeEmptyValidation;
                              }
                              return null;
                            },
                              prefixIconWidget: Transform.scale(scale: size(context).width*numD001, child: Image.asset(Assets.assetsTagIcon,color: colorGrey,height: 0,)),
                            ),
                            SizedBox(height: size(context).width * numD04),
                            CommonTextField(hintText: txProductName,controller: cubit.productController,validator: (value) {
                              if (value == null || value.isEmpty) {
                                return txFieldCanNotBeEmptyValidation;
                              }
                              return null;
                            },
                              prefixIconWidget: Transform.scale(scale: size(context).width*numD0015, child: Image.asset(Assets.assetsOrderBox,color: colorGrey,height: 0,)),
                            ),
                            SizedBox(height: size(context).width * numD04),
                            CommonTextField(hintText: txDescription,controller: cubit.descriptionController,validator: (value) {
                              if (value == null || value.isEmpty) {
                                return txFieldCanNotBeEmptyValidation;
                              }
                              return null;
                            },
                              prefixIconWidget: Transform.scale(scale: size(context).width*numD0013, child: Image.asset(Assets.assetsInformationIcon,color: colorGrey,height: 0,)),
                            ),
                            SizedBox(height: size(context).width * numD04),
                            CommonTextField(hintText: txProductPrice,keyboardType: TextInputType.number,controller: cubit.productPriceController,validator: (value) {
                              if (value == null || value.isEmpty) {
                                return txFieldCanNotBeEmptyValidation;
                              }
                              return null;
                            },
                              prefixIconWidget: Icon(Icons.currency_rupee_rounded,color: colorGrey,size: size(context).width*numD055,),

                            ),
                            SizedBox(height: size(context).width * numD04),
                            customDropDownField(context: context,list:  ['Shoes','Hoodies','Jeans','Jackets','Shirts'],value: 'select',onChanges:(value){
                              cubit.productTypeController.text = value;
                            },
                              prefixIconWidget: Transform.scale(scale: size(context).width*numD0013, child: Image.asset(Assets.assetsChoiceIcon,color: colorGrey,height: 0,)),
                            ),
                            SizedBox(height: size(context).width * numD04),
                            CommonTextField(hintText: txSelectColorAndSize,readOnly: true,onTap: (){
                              showBottomSheet(context, cubit);
                              FocusScope.of(context).unfocus();
                            },
                              prefixIconWidget: Transform.scale(scale: size(context).width*numD0013, child: Image.asset(Assets.assetsPaintIcon,color: colorGrey,height: 0,)),
                            ),
                            SizedBox(height: size(context).width * numD04),
                            CommonTextField(hintText: txSelectImages,readOnly: true,onTap: (){
                              cubit.imagePicker(context);
                              FocusScope.of(context).unfocus();
                            },
                              prefixIconWidget: Transform.scale(scale: size(context).width*numD0013, child: Image.asset(Assets.assetsGalleryIcon,color: colorGrey,height: 0,)),

                            ),
                            cubit.state.file.isNotEmpty ? Container(
                              height: size(context).width*numD20,
                              alignment: Alignment.center,
                              child: Wrap(
                                children: List.generate(cubit.state.file.length, (index){
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: size(context).width*numD03),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(size(context).width*numD02),
                                            child: Image.file(File(cubit.state.file[index].path),height: size(context).width*numD15,width:size(context).width*numD15,fit: BoxFit.cover,)),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 5,
                                        child: GestureDetector(
                                          onTap: (){
                                            cubit.removeImage(index);
                                          },
                                          child: Container(
                                          height: size(context).width*numD04,
                                          width: size(context).width*numD04,
                                            decoration: BoxDecoration(
                                              color: colorWhite,
                                              shape: BoxShape.circle
                                            ),
                                              child: Image.asset(Assets.assetsDeleteIcon,fit: BoxFit.cover,)),
                                        )
                                      ),
                                    ],
                                  );
                                })
                              ),
                            ) : Container(),
                            SizedBox(height: size(context).width * numD06,),
                            CommonButton(onPressed: (){
                              if(cubit.formKey.currentState!.validate()){
                                cubit.uploadImages(context).then((value){
                                  if(value){
                                    cubit.addProductsDetails(context);
                                  }
                                });
                              }
                            }, text: txSubmit)

                          ],
                        ),
                        cubit.state.isLoading ? Center(child: CircularProgressIndicator()) : Container()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showBottomSheet(BuildContext context, AddProductCubit cubit) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<AddProductCubit, AddProductState>(
          bloc: cubit,
          builder: (context, state) {
            return Container(
              width: size(context).width,
              // height: size(context).width * numD90,
              padding: EdgeInsets.symmetric(horizontal: size(context).width*numD04,vertical: size(context).width*numD04),
              decoration: BoxDecoration(
                color: colorLightTwo,
                borderRadius: BorderRadius.vertical(top: Radius.circular(size(context).width*numD04))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(text: txSelectSize,fontSize: size(context).width*numD045,fontWeight: FontWeight.w500,),
                  SizedBox(height: size(context).width*numD02,),
                  Wrap(
                    spacing: size(context).width*numD02,
                    children: state.sizeList.map((tag) {
                      final isSelected = cubit.sizeList.contains(tag);
                      return FilterChip(
                        label: Text(tag),
                        selected: isSelected,
                        selectedColor: Colors.blue.shade200,
                        onSelected: (bool selected) {
                          if (selected) {
                            cubit.addSizeFilterChips(tag);
                          } else {
                            cubit.removeSizeFilterChips(tag);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: size(context).width*numD03,),
                  CommonText(text: txSelectColor,fontSize: size(context).width*numD045,fontWeight: FontWeight.w500,),
                  SizedBox(height: size(context).width*numD02,),
                  Wrap(
                    spacing: size(context).width*numD02,
                    children: cubit.state.colorList.map((tag) {
                      final isSelected = cubit.colorList.contains(tag);
                      return FilterChip(
                        label: CommonText(text: tag),
                        selected: isSelected,
                        selectedColor: Colors.blue.shade200,
                        onSelected: (bool selected) {
                          if (selected) {
                            cubit.addColorFilterChips(tag);
                          } else {
                            cubit.removeColorFilterChips(tag);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: size(context).width*numD02,),
                  CommonButton(onPressed: (){
                    router.pop();
                    FocusScope.of(context).unfocus();
                  }, text: txContinue)
                ],
              ),
            );
          },
        );
      },
    );
  }


}
