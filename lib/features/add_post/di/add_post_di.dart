import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_post_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddPost',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/add_post'],
)
void configureAddPost(GetIt getIt) {
  getIt.initAddPost();
}
