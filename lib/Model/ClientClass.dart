

class ClientList {
  int? clientId;
  String? clientName;
  String? phone;
  String? address;
  String? gst;
  String? website;
  String? email;
  String? contactPerson;
  String? phoneNumber;
  Null? removedOn;
  Null? removedRemarks;
  int? createdBy;

  ClientList(
      {
        this.clientId,
        this.clientName,
        this.phone,
        this.address,
        this.gst,
        this.website,
        this.email,
        this.contactPerson,
        this.phoneNumber,
        this.removedOn,
        this.removedRemarks,
        this.createdBy});

  ClientList.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    clientName = json['clientName'];
    phone = json['phone'];
    address = json['address'];
    gst = json['gst'];
    website = json['website'];
    email = json['email'];
    contactPerson = json['contactPerson'];
    phoneNumber = json['phoneNumber'];
    removedOn = json['removedOn'];
    removedRemarks = json['removedRemarks'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['clientName'] = this.clientName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['gst'] = this.gst;
    data['website'] = this.website;
    data['email'] = this.email;
    data['contactPerson'] = this.contactPerson;
    data['phoneNumber'] = this.phoneNumber;
    data['removedOn'] = this.removedOn;
    data['removedRemarks'] = this.removedRemarks;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
