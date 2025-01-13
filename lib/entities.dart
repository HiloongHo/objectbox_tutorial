import 'package:objectbox/objectbox.dart';

/// 购物订单实体类
/// 用于存储订单相关信息
@Entity()
class ShopOrder {
  /// 订单唯一标识符
  int id;
  
  /// 订单金额
  int price;
  
  /// 关联的客户信息
  /// 使用 ToOne 建立与 Customer 的一对一关系
  final customer = ToOne<Customer>();

  ShopOrder({this.id = 0, required this.price});
}

/// 客户实体类
/// 用于存储客户相关信息
@Entity()
class Customer {
  /// 客户唯一标识符
  int id;
  
  /// 客户姓名
  String name;
  
  /// 客户的所有订单
  /// 使用 @Backlink 和 ToMany 建立与 ShopOrder 的一对多反向关系
  @Backlink()
  final orders = ToMany<ShopOrder>();
  
  Customer({this.id = 0, required this.name});
}
