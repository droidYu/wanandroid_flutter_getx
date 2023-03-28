import 'package:get/get.dart';

class TransList extends Translations{



  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN':{
      'hello': '你好',
      'chinese':'中文',
      'english':'英文',
      'setting':'设置',
      'theme':'主题',
    },
    'en_US':{
      'hello': 'Hello',
      'chinese':'Chinese',
      'english':'English',
      'setting':'Setting',
      'theme':'Theme',
    },
  };
}