part of '../products.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/products';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsBloc>()..add(GetProductsEvent()),
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsErrorState) showBar(context, state.message);
        },
        builder: (context, state) {
          final bloc = context.read<ProductsBloc>();
          final searchCtrl = TextEditingController();
          String? selectedCat;
          bool isList = false;
          return StatefulBuilder(builder: (context, changeState) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text('Products'),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(110.h),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 3),
                              child: TextField(
                                controller: searchCtrl,
                                decoration: const InputDecoration(
                                    hintText: 'Product Name',
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none),
                                onChanged: (value) {
                                  changeState(() {});
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropDownWidget(
                                  hint: 'Category',
                                  value: selectedCat,
                                  items: (bloc.products.isEmpty)
                                      ? <DropdownMenuItem>[]
                                      : bloc.products
                                          .map((e) => e.category)
                                          .toSet()
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e!),
                                              ))
                                          .toList(),
                                  onChange: (value) {
                                    changeState(() => selectedCat = value);
                                  }),
                              IconButton(
                                  onPressed: () {
                                    changeState(() => isList = !isList);
                                  },
                                  icon: Icon(
                                      isList
                                          ? Icons.list
                                          : Icons.grid_view_rounded,
                                      color: Colors.white70,
                                      size: 40.r))
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              body: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isList ? 1 : 2,
                      childAspectRatio: isList ? 1.7 : .8,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  children: (state is ProductsLoadingState
                          ? List.generate(10, (index) => const ProductEntity())
                          : bloc.products.where((e) {
                              if (selectedCat != null) {
                                return e.category == selectedCat &&
                                    e.title!.contains(searchCtrl.text);
                              }
                              return e.title!.contains(searchCtrl.text);
                            }))
                      .map((e) => EntranceFader(
                          child: AnimatedSwitch(
                              isFadeTransition: true,
                              child: state is ProductsLoadingState
                                  ? const ProductCardIndicator()
                                  : ProductCard(productEntity: e))))
                      .toList()),
            );
          });
        },
      ),
    );
  }
}
