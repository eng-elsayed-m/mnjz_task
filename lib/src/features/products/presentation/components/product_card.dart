part of '../../products.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCard({super.key, required this.productEntity});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    Image _image(String path) => Image.asset(
          path,
          color: Colors.yellow.shade600,
        );
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Material(
          color: theme.cardColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: theme.primaryColor)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: size.height * .13,
              child: Center(
                child: CachedImage(
                  path: productEntity.image!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RatingBar(
              initialRating: productEntity.rating!.rate!,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: _image(AppImages.heart),
                half: _image(AppImages.haldHeart),
                empty: _image(AppImages.emptyHeart),
              ),
              glow: true,
              ignoreGestures: true,
              itemSize: 15,
              glowColor: theme.primaryColor,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              onRatingUpdate: (rating) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(productEntity.price.toString()),
            ),
          ],
        ),
      ),
      Text(
        productEntity.title!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ]);
  }
}
