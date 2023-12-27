import 'package:e_commerce/widgets/build_product_item.dart';
import 'package:e_commerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home_cubit/home_cubit.dart';
import '../../cubit/home_cubit/home_state.dart';
import '../../localization/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
            body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  HomeCubit.get(context)!.getProductAfterFiltered(input: value);
                },
                onFieldSubmitted: (value){
                  HomeCubit.get(context)!.getProductAfterFiltered(input: value);
                },
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.search,color: Theme.of(context).iconTheme.color,),
                  hintText: S.of(context).search,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  suffixIcon: IconButton(
                      icon:  Icon(Icons.clear,color: Theme.of(context).iconTheme.color),
                      onPressed: () {
                       setState(() {
                         searchController.text = "";
                         HomeCubit.get(context)!.productAfterFiltered=[];
                       });
                      }),
                  filled: true,
                  fillColor: Colors.black12.withOpacity(0.1),
                  enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyMedium!.color!
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).textTheme.bodyMedium!.color!
                      )
                  ),
                  border:  const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                ),
              ),

            ),
            const SizedBox(
              height: 15,
            ),
            if (HomeCubit.get(context)!.bannersData.isEmpty)
              const Center(child: CircularProgressIndicator()),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: HomeCubit.get(context)!.bannersData.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    HomeCubit.get(context)!.bannersData[index].image!,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 15,
            ),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).categories,
                    style:  TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).viewAll,
                    style: const TextStyle(
                        color: AppColor.secondColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            HomeCubit.get(context)!.categoryData.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: HomeCubit.get(context)!.categoryData.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                HomeCubit.get(context)!
                                    .categoryData[index]
                                    .image!),
                          );
                        }),
                  ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).products,
                    style:  TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).viewAll,
                    style: const TextStyle(
                        color: AppColor.secondColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            if (HomeCubit.get(context)!.productData.isEmpty)
              const Center(child: CircularProgressIndicator()),
            if (searchController.text == ""&&
                HomeCubit.get(context)!.productAfterFiltered.isEmpty)
              GridView.builder(
                  itemCount:
                           HomeCubit.get(context)!.productData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.4,
                  ),
                  itemBuilder: (context, index) => BuildProductItems(
                      productsData:
                          HomeCubit.get(context)!.productData[index])),
            if (HomeCubit.get(context)!.productAfterFiltered.isEmpty &&
                searchController.text != "")
               Center(child: Text(S.of(context).noResult)),
            if (HomeCubit.get(context)!.productAfterFiltered.isNotEmpty)
              GridView.builder(
                  itemCount: HomeCubit.get(context)!.productAfterFiltered.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.6,
                  ),
                  itemBuilder: (context, index) => BuildProductItems(
                      productsData:
                          HomeCubit.get(context)!.productAfterFiltered[index])),
          ],
        ));
      },
    );
  }
}
