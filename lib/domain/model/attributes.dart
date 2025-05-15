// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:genius_shop/domain/model/default_attributes.dart';
import 'package:genius_shop/domain/model/product_attribute.dart';

class ProductAttribute {
  Attribute? attribute;
  List<DefaultAttribute>? listAttribute;
  ProductAttribute({this.attribute, this.listAttribute});
}
