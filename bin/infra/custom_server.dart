import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';

class CustomServer{

  Future<void> initialize({required Handler handler, required String address, required int port}) async{

    await shelf_io.serve(handler, address, port);

    print('servidor inicializado -> http://$address/$port');

  }


}