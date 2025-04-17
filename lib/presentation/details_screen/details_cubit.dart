import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final ScrollController scrollController = ScrollController();
  DetailsCubit(BuildContext context) : super(DetailsState(imageCount: 3, currentCount: 0)){
    scrollController.addListener(()=>_updateIndex(context));
  }

  void _updateIndex(BuildContext context) {
    double scrollPosition = scrollController.position.pixels;
    double itemWidth = size(context).width;
    int newIndex = (scrollPosition / itemWidth).round();
    emit(state.copyWith(currentCount: newIndex.clamp(0, state.imageCount - 1)));
  }

}

class DetailsState {
  int currentCount;
  int imageCount;

  DetailsState({required this.currentCount, required this.imageCount});

  DetailsState copyWith({int? currentCount, int? imageCount}) {
    return DetailsState(
      currentCount: currentCount ?? this.currentCount,
      imageCount: imageCount ?? this.imageCount,
    );
  }
}
