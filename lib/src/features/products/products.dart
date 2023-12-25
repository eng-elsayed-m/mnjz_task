import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mnjz_task/src/core/utiles/animated_switche.dart';
import 'package:mnjz_task/src/core/utiles/entrance_fader.dart';
import 'package:mnjz_task/src/core/utiles/shortcuts.dart';
import 'package:mnjz_task/src/features/products/domain/domain.dart';
import 'package:mnjz_task/src/features/products/presentation/bloc/bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mnjz_task/src/core/consts/app_image.dart';
import 'package:mnjz_task/src/core/public_widgets/cached_image.dart';
import 'package:mnjz_task/src/src.dart';
import 'package:shimmer/shimmer.dart';
part 'presentation/products_screen.dart';
part 'presentation/components/drop_down.dart';
part 'presentation/components/product_card.dart';
part 'presentation/components/products_card_indicator.dart';
