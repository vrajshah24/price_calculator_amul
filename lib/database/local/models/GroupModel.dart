class GroupModel {
  final int? grp_id;
  final String grp_code;
  final String grp_name;

  GroupModel({this.grp_id, required this.grp_code, required this.grp_name});

  Map<String, dynamic> toJson() {
    return {'grp_id': grp_id, 'grp_code': grp_code, 'grp_name': grp_name};
  }

  static GroupModel fromJson(Map<String, Object?> first) => GroupModel(
      grp_id: first['grp_id'] as int,
      grp_code: first['grp_code'] as String,
      grp_name: first['grp_name'] as String);
}
