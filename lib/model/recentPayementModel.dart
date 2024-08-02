class RecentePayementModel {
	int? id;
	Station? station;
	Owner? owner;
	String? reference;
	String? methodTransaction;
	double? amount;
	String? country;
	String? provider;
	double? feeAmount;
	String? currency;
	String? recipientContact;
	String? recipientName;
	String? description;
	String? status;
	String? createdAt;
	Statistique? statistique;

	RecentePayementModel({this.id, this.station, this.owner, this.reference, this.methodTransaction, this.amount, this.country, this.provider, this.feeAmount, this.currency, this.recipientContact, this.recipientName, this.description, this.status, this.createdAt, this.statistique});

	RecentePayementModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		station = json['station'] != null ? new Station.fromJson(json['station']) : null;
		owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
		reference = json['reference'];
		methodTransaction = json['method_transaction'];
		amount = json['amount'];
		country = json['country'];
		provider = json['provider'];
		feeAmount = json['fee_amount'];
		currency = json['currency'];
		recipientContact = json['number'];
		recipientName = json['recipient_name'];
		description = json['description'];
		status = json['status'];
		createdAt = json['created_at'];
		statistique = json['statistique'] != null ? new Statistique.fromJson(json['statistique']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		if (this.station != null) {
      data['station'] = this.station!.toJson();
    }
		if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
		data['reference'] = this.reference;
		data['method_transaction'] = this.methodTransaction;
		data['amount'] = this.amount;
		data['country'] = this.country;
		data['provider'] = this.provider;
		data['fee_amount'] = this.feeAmount;
		data['currency'] = this.currency;
		data['number'] = this.recipientContact;
		data['recipient_name'] = this.recipientName;
		data['description'] = this.description;
		data['status'] = this.status;
		data['created_at'] = this.createdAt;
		if (this.statistique != null) {
      data['statistique'] = this.statistique!.toJson();
    }
		return data;
	}
}

class Station {
	String? code;
	String? name;
	bool? isActive;

	Station({this.code, this.name, this.isActive});

	Station.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		name = json['name'];
		isActive = json['is_active'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['name'] = this.name;
		data['is_active'] = this.isActive;
		return data;
	}
}

class Owner {
	String? serialNumber;
	String? fullName;
	String? contact;

	Owner({this.serialNumber, this.fullName, this.contact});

	Owner.fromJson(Map<String, dynamic> json) {
		serialNumber = json['serial_number'];
		fullName = json['full_name'];
		contact = json['contact'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['serial_number'] = this.serialNumber;
		data['full_name'] = this.fullName;
		data['contact'] = this.contact;
		return data;
	}
}

class Statistique {




	Statistique.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}
