class Product {
  final int? prd_id;
  final int grp_id;
  final String prd_code;
  final String prd_name;
  final String prd_shortname;
  final int rate;
  int quantity;
  final int sequence;
  final int unit_type;
  final String prd_image;
  final int isFavourite;
  final int status;

  Product({
    this.prd_id,
    required this.grp_id,
    required this.prd_code,
    required this.prd_name,
    required this.prd_shortname,
    required this.rate,
    required this.quantity,
    required this.sequence,
    required this.unit_type,
    required this.prd_image,
    required this.isFavourite,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'prd_id': prd_id,
      'grp_id': grp_id,
      'prd_code': prd_code,
      'prd_name': prd_name,
      'prd_shortname': prd_shortname,
      'rate': rate,
      'quantity': quantity,
      'sequence': sequence,
      'unit_type': unit_type,
      'prd_image': prd_image,
      'isFavourite': isFavourite,
      'status': status,
    };
  }

  static Product fromJson(Map<String, Object?> first) => Product(
      prd_id: first['prd_id'] as int,
      grp_id: first['grp_id'] as int,
      prd_code: first['prd_code'] as String,
      prd_name: first['prd_name'] as String,
      prd_shortname: first['prd_shortname'] as String,
      rate: first['rate'] as int,
      quantity: first['quantity'] as int,
      sequence: first['sequence'] as int,
      unit_type: first['unit_type'] as int,
      prd_image: first['prd_image'] as String,
      isFavourite: first['isFavourite'] as int,
      status: first['status'] as int);

  set addQuantity(int x) {
    quantity = quantity + 1;
  }

  set minusQuantity(int x) {
    quantity = quantity - 1;
  }

  get getQuantity {
    return quantity;
  }
}
