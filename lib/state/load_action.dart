import 'package:flutter/foundation.dart' show immutable;

import '../types/persons_url.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final PersonUrl url;

  const LoadPersonsAction({required this.url});
}
