import 'package:ecommercexfirebase/generated/assets.dart';
import 'package:ecommercexfirebase/presentation/home_screen/home_cubit.dart';
import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/utils/colors.dart';
import 'package:ecommercexfirebase/utils/common_text.dart';
import 'package:ecommercexfirebase/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Men';
    List<String> items = ['Men', 'Woman'];
    return BlocProvider(create: (_)=>HomeCubit(),
    child: BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
      return GestureDetector(
        onTap: () {
          unFocus(context);
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size(context).width * numD03),
            child: CustomScrollView(
              slivers: [
                // app bar
                SliverAppBar(
                  expandedHeight: size(context).width * numD1,
                  backgroundColor: colorWhite,
                  foregroundColor: colorWhite,
                  floating: true,
                  pinned: false,
                  snap: true,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                    color: colorWhite,
                  )),
                  leading: Image.asset(Assets.assetsMenuIcon),
                  leadingWidth: size(context).width * numD08,
                  title: Container(
                    width: size(context).width * numD25,
                    height: size(context).width * numD09,
                    padding: EdgeInsets.only(left: 9),
                    decoration: BoxDecoration(
                      color: colorLightTwo,
                      borderRadius: BorderRadius.circular(
                        size(context).width * numD06,
                      ),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedValue,
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          onChanged: (d){},
/*
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
*/
                          items:
                          items.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Image.asset(
                      Assets.assetsNotificationIcon,
                      height: size(context).width * numD06,
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(size(context).width * numD15),
                    child: Container(
                      height: size(context).width * numD12,
                      margin: EdgeInsets.only(bottom: size(context).width * numD04),
                      padding: EdgeInsets.symmetric(
                        horizontal: size(context).width * numD04,
                      ),
                      decoration: BoxDecoration(
                        color: colorLightTwo,
                        borderRadius: BorderRadius.circular(
                          size(context).width * numD06,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: txSearch,
                          border: InputBorder.none,
                          hintFadeDuration: Duration(milliseconds: 200),
                          icon: Image.asset(
                            Assets.assetsSearchIcon,
                            height: size(context).width * numD06,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ads banners
                SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: size(context).width * numD03),
                        height: size(context).width * numD45,
                        child: CarouselView(scrollDirection: Axis.horizontal,
                          itemExtent: size(context).width,
                          children: List.generate(3, (int index) {
                            String? url = 'https://picsum.photos/700?random=$index';
                            return GestureDetector(
                              onTap: () {},
                              child: cachedNetworkImage(imageUrl: url),
                            );
                          }
                          ),
                        ))),

                // categories
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: size(context).width * numD01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(text: txCategories,
                          fontWeight: FontWeight.w800,
                          fontSize: size(context).width * numD04,),
                        TextButton(onPressed: () {},
                            child: CommonText(text: txSeeAll,
                              fontWeight: FontWeight.w500,
                              fontSize: size(context).width * numD035,
                              color: Colors.blue,)),
                      ],
                    ),
                  ),
                ),

                // categories list
                SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        return Column(
                          children: [
                            Container(
                              height: size(context).width * numD14,
                              width: size(context).width * numD14,
                              padding: EdgeInsets.symmetric(
                                  horizontal: size(context).width * numD03,
                                  vertical: size(context).width * numD03),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorLightTwo,
                                // image: DecorationImage(image: AssetImage(Assets.assetsHoodieImage),fit: BoxFit.fill),
                              ),
                              child: Image.asset(
                                Assets.assetsHoodieImage, fit: BoxFit.cover,),
                            ),
                            CommonText(text: 'Hoodies',
                              color: Colors.black87,
                              fontSize: size(context).width * numD035,)
                          ],
                        );
                      }
                      ),)),

                // top selling
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: size(context).width * numD01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(text: txTopSelling,
                          fontWeight: FontWeight.w800,
                          fontSize: size(context).width * numD04,),
                        TextButton(onPressed: () {},
                            child: CommonText(text: txSeeAll,
                              fontWeight: FontWeight.w500,
                              fontSize: size(context).width * numD035,
                              color: Colors.blue,)),
                      ],
                    ),
                  ),
                ),

                // SliverToBoxAdapter(
                //   child: SizedBox(),
                // ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.66,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => _productList(index, context),
                    childCount: 6,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text('Summer Sale! 50% OFF')),
                  ),
                ),

                // 5. Product List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                        ListTile(
                          leading: Icon(Icons.shopping_bag),
                          title: Text('Product ${index + 1}'),
                          subtitle: Text('\$ ${(index + 1) * 20}'),
                        ),
                    childCount: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }),
    );
  }

  Widget _productList(int index,BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return GestureDetector(
      onTap: (){
        router.push(AppRouter.detailsScreen);
      },
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(size(context).width * numD03),
              child: cachedNetworkImage(
                  imageUrl: 'https://picsum.photos/200/300?random=$index',
                  height: size(context).width * numD50,
                  width: 200)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text('Product ${index + 1}')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${(index + 1) * 50}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: () {
                cubit.toggle(cubit.state.isFav);
              },
                  icon: Icon(Icons.favorite_rounded,size: size(context).width*numD06,color: cubit.state.isFav ? colorRed:Colors.grey.shade300,))
            ],
          ),
        ],
      ),
    );
  }
}
// Image.asset(cubit.state.isFav ? Assets.assetsHeartIcon : Assets.assetsHeartFillIcon, height: cubit.state.isFav ? size(context).width*numD06:size(context).width*numD07,))
// Image.asset( Assets.assetsHeartFillIcon, height: size(context).width*numD06,color: cubit.state.isFav ? null:Colors.grey.shade300,))