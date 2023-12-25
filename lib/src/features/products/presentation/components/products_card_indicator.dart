part of '../../products.dart';

class ProductCardIndicator extends StatelessWidget {
  const ProductCardIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    Image _image(String path) => Image.asset(
          path,
          color: Colors.yellow.shade600,
        );
    Shimmer shimmer(Widget child) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white70,
        child: child);
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmer(
            Material(
                color: theme.cardColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: theme.primaryColor)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: size.height * .13,
                    width: double.infinity,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: shimmer(
              RatingBar(
                initialRating: 4.5,
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
            ),
          ),
          shimmer(const Divider(
            thickness: 3,
            endIndent: 20,
          )),
          shimmer(const Divider(
            thickness: 3,
            endIndent: 80,
          )),
        ]);
  }
}
