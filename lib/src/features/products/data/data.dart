import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mnjz_task/src/core/consts/consts.dart';
import 'package:mnjz_task/src/core/error/exceptions.dart';
import 'package:mnjz_task/src/core/error/failures.dart';
import 'package:mnjz_task/src/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/domain.dart';

part 'repositories/products_repository_impl.dart';
part 'data_sources/products_remote_src.dart';
part 'data_sources/products_local_src.dart';

part 'models/product_model.dart';
