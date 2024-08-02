class UserInfoModel {
  String? serialNumber;
  String? companyId;
  String? stationId;
  String? email;
  String? fullName;
  String? contact;
  String? pinTransaction;
  bool? isConnected;
  bool? isActive;
  String? firstConnection;
  String? lastConnection;
  bool? isVerified;
  String? verifiedAt;
  String? registeredAt;
  bool? isFocalPoint;
  bool? isAdmin;
  bool? isSuperadmin;
  Group? group;

  UserInfoModel(
      {this.serialNumber,
      this.companyId,
      this.stationId,
      this.email,
      this.fullName,
      this.contact,
      this.pinTransaction,
      this.isConnected,
      this.isActive,
      this.firstConnection,
      this.lastConnection,
      this.isVerified,
      this.verifiedAt,
      this.registeredAt,
      this.isFocalPoint,
      this.isAdmin,
      this.isSuperadmin,
      this.group});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    serialNumber = json['serial_number'];
    companyId = json['company_id'];
    stationId = json['station_id'];
    email = json['email'];
    fullName = json['full_name'];
    contact = json['contact'];
    pinTransaction = json['pin_transaction'];
    isConnected = json['is_connected'];
    isActive = json['is_active'];
    firstConnection = json['first_connection'];
    lastConnection = json['last_connection'];
    isVerified = json['is_verified'];
    verifiedAt = json['verified_at'];
    registeredAt = json['registered_at'];
    isFocalPoint = json['is_focal_point'];
    isAdmin = json['is_admin'];
    isSuperadmin = json['is_superadmin'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serial_number'] = this.serialNumber;
    data['company_id'] = this.companyId;
    data['station_id'] = this.stationId;
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['contact'] = this.contact;
    data['pin_transaction'] = this.pinTransaction;
    data['is_connected'] = this.isConnected;
    data['is_active'] = this.isActive;
    data['first_connection'] = this.firstConnection;
    data['last_connection'] = this.lastConnection;
    data['is_verified'] = this.isVerified;
    data['verified_at'] = this.verifiedAt;
    data['registered_at'] = this.registeredAt;
    data['is_focal_point'] = this.isFocalPoint;
    data['is_admin'] = this.isAdmin;
    data['is_superadmin'] = this.isSuperadmin;
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    return data;
  }
}

class Group {
  int? id;
  String? libelle;
  bool? isActive;


  Group({this.id, this.libelle, this.isActive,});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    isActive = json['is_active'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    data['is_active'] = this.isActive;
   
    return data;
  }
}
