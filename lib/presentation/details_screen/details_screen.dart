import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/presentation/details_screen/details_cubit.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/common_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          router.pop();
        }, icon: Icon(Icons.arrow_back_rounded,size: size(context).width*numD07,)),
        actions: [
          IconButton(onPressed: (){
          }, icon: Image.asset(Assets.assetsCartIcon,height: size(context).width*numD07,)),
        ],
      ),
      body: BlocProvider(create: (_)=>DetailsCubit(context),
      child: BlocBuilder<DetailsCubit,DetailsState>(builder: (context,state){
        final cubit = context.read<DetailsCubit>();
       return Column(
          children: [
            Container(
              height: size(context).width * numD85,
              width: size(context).width,
              decoration: BoxDecoration(),
              child: ListView.builder( controller: cubit.scrollController,scrollDirection: Axis.horizontal, itemCount: 3, itemBuilder: (context,index){
                String? url = 'https://picsum.photos/700?random=$index';
                return GestureDetector(
                  onTap: () {
                    debugPrint('ygfgv');
                  },
                  child: cachedNetworkImage(imageUrl: url,width: size(context).width),
                );
              }),
            ),
            SingleChildScrollView(scrollDirection: Axis.horizontal, child: DotsIndicator(dotsCount: 3,position: cubit.state.currentCount.toDouble())),

          ],
        );
      }),
      ),
      bottomNavigationBar: Row(
        children: [

        ],
      ),
    );
  }
}
