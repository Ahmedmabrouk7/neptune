1 - Add dependencies
    * dependencies:
      hive: ^2.2.3
      hive_flutter: ^1.1.0

    *  dev_dependencies:
       hive_generator:
       build_runner:
    
    * run (flutter pub get )
/////////////////////////////////////////////////////////////////////

2 - Create class (generate adapter)
  * part 'person.g.dart';
/////////////////////////////////////////////////////////////////////
3 - Aouto generate class.g
  * run ( flutter packages pub run build_runner build )
////////////////////////////////////////////////////////////////////
4- initFlutter
  * import 'package:hive_flutter/hive_flutter.dart';
    
  * void main() async {
      await Hive.initFlutter();

      runApp(const MyApp());
    }
///////////////////////////////////////////////////////////////////
5- Register adapter
  * import 'package:use_hive/person.dart';

  * Hive.registerAdapter(PersonAdapter());

//////////////////////////////////////////////////////////////////
6- Openbox & Create box file

//////////////////////////////////////////////////////////////////
7- .put
8- .get
9- .deleteAt
10-. clear
