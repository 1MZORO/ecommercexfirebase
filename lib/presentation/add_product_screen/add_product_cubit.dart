import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final formKey = GlobalKey<FormState>();
  final productController = TextEditingController();
  final brandController = TextEditingController();
  final productPriceController = TextEditingController();
  final descriptionController = TextEditingController();
  final productTypeController = TextEditingController();
  final List<String> sizeList = [];
  final List<String> colorList = [];
  final ImagePicker _picker = ImagePicker();
  final _firestore = FirebaseFirestore.instance;
  final _dio = Dio();
  final List<String> _imageUrls = [];
  final _url = 'https://api.cloudinary.com/v1_1/zoro1/image/upload';
  AddProductCubit()
    : super(
        AddProductState(
          sizeList: ['S', 'M', 'L', 'XL', 'XXL', 'XXXl'],
          colorList: ['White', 'Black', 'Red', 'Green', 'Blue', 'Sky Blue'],
          selectedSizeList: [],
          selectedColorList: [],
          file: [], jeansSizeList: ['26','28','30','32','34','36'], shoesSizeList: ['6','7','8','9','10'], isLoading: false,
        ),
      );

  void addSizeFilterChips(String value) {
    sizeList.add(value);
    debugPrint(sizeList.toString());
    emit(state.copyWith(selectedSizeList: sizeList));
  }

  void removeSizeFilterChips(String value) {
    sizeList.remove(value);
    debugPrint(sizeList.toString());
    emit(state.copyWith(selectedSizeList: sizeList));
  }

  void addColorFilterChips(String value) {
    colorList.add(value);
    debugPrint(colorList.toString());
    emit(state.copyWith(selectedColorList: colorList));
  }

  void removeColorFilterChips(String value) {
    colorList.remove(value);
    debugPrint(colorList.toString());
    emit(state.copyWith(selectedColorList: colorList));
  }

  void removeImage(int index) {
    final updatedFiles = List<XFile>.from(state.file)..removeAt(index);
    emit(state.copyWith(file: updatedFiles));
  }

  Future<void> imagePicker(BuildContext context) async {
    List<XFile> list = [];
    list = await _picker.pickMultiImage();
    list.forEach((value) {
      log(value.path.toString());
    });
    emit(state.copyWith(file: list));
  }
  AddProductModel getProductModel(String productId,List<String> images) {
    return AddProductModel(
      productId: productId,
      brandName: brandController.text.trim(),
      description: descriptionController.text.trim(),
      productName: productController.text.trim(),
      productPrice: double.tryParse(productPriceController.text.trim()) ?? 0.0,
      productType: productTypeController.text.trim(),
      colors: state.selectedColorList,
      size: state.selectedSizeList,
      images: images,
    );
  }

  Future<bool> uploadImages(BuildContext context) async {
    try {
      print('isLoading: ${state.isLoading}');
      emit(state.copyWith(isLoading: true));
      print('isLoading: ${state.isLoading}');
      log('<<message>>');
      for (var image in state.file) {
        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(image.path),
          'upload_preset': 'ecommerce',
        });
        Response response = await _dio.post(_url, data: formData);
        _imageUrls.add(response.data['url']);
        debugPrint('${response.toString()} || ${response.statusCode}');
        if (response.statusCode == 200) {
          debugPrint('Image Success');
        }
      }
      // showCustomToast(context, txSuccess);
      log('message<< ${_imageUrls.toString()}');
      return true;
    } on DioException catch (e) {
      log('Error in Cloudinary while adding images ${e.toString()}');
      showCustomToast(context, txFailed);
      emit(state.copyWith(isLoading: false));
      return false;
    }
  }

  Future<void> addProductsDetails(BuildContext context)async{
    try {
      print('isLoading: ${state.isLoading}');
      final docRef = _firestore.collection('products').doc();
      final productModel = getProductModel(docRef.id,_imageUrls);
      await docRef.set(productModel.toJson());
      showCustomToast(context, txSuccess);
      log('Product Added: ${productModel.toJson()} ${_imageUrls.toString()}');
      emit(state.copyWith(isLoading: false));
      print('isLoading: ${state.isLoading}');
      router.pop();
      close();
    } on FirebaseException catch (e) {
      log('Error in Firestore while adding products ${e.toString()}');
      showCustomToast(context, txFailed);
      emit(state.copyWith(isLoading: false));
      print('isLoading: ${state.isLoading}');
      router.pop();
      close();
    }
  }

  @override
  Future<void> close() {
    brandController.clear();
    productController.clear();
    productPriceController.clear();
    descriptionController.clear();
    productTypeController.clear();
    return super.close();
  }
}

class AddProductState {
  List<String> sizeList;
  List<String> shoesSizeList;
  List<String> jeansSizeList;
  List<String> selectedSizeList;
  List<String> colorList;
  List<String> selectedColorList;
  List<XFile> file;
  bool isLoading;

  AddProductState({
    required this.sizeList,
    required this.colorList,
    required this.selectedColorList,
    required this.selectedSizeList,
    required this.file,
    required this.jeansSizeList,
    required this.shoesSizeList,
    required this.isLoading
  });

  AddProductState copyWith({
    List<String>? sizeList,
    List<String>? colorList,
    List<String>? selectedSizeList,
    List<String>? selectedColorList,
    List<XFile>? file,
    List<String>? jeansSizeList,
    List<String>? shoesSizeList,
    bool? isLoading
  }) {
    return AddProductState(
      sizeList: sizeList ?? this.sizeList,
      colorList: colorList ?? this.colorList,
      selectedColorList: selectedColorList ?? this.selectedColorList,
      selectedSizeList: selectedSizeList ?? this.selectedSizeList,
      file: file ?? this.file,
      jeansSizeList: jeansSizeList ?? this.jeansSizeList,
      shoesSizeList: shoesSizeList ?? this.shoesSizeList,
      isLoading: isLoading ?? this.isLoading
    );
  }
}


class AddProductModel {
  final String productId;
  final String brandName;
  final String description;
  final String productName;
  final double productPrice;
  final String productType;
  final List<String> colors;
  final List<String> size;
  final List<String> images;

  AddProductModel({
    required this.productId,
    required this.brandName,
    required this.description,
    required this.productName,
    required this.productPrice,
    required this.productType,
    required this.colors,
    required this.size,
    required this.images,
  });

  factory AddProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductModel(
      productId: json['productId'] as String,
      brandName: json['brandName'] as String,
      description: json['description'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productType: json['productType'] as String,
      colors: List<String>.from(json['colors']),
      size: List<String>.from(json['size']),
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'brandName': brandName,
      'description': description,
      'productName': productName,
      'productPrice': productPrice,
      'productType': productType,
      'colors': colors,
      'size': size,
      'images': images,
    };
  }
}
