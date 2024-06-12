import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final takePhotoProvider = StateProvider<List<File>>((_) => []);
