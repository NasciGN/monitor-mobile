class Inventory {
  String type,
      typeFull,
      name,
      alias,
      os,
      osFull,
      osShort,
      serialnoA,
      serialnoB,
      tag,
      assetTag,
      macaddressA,
      macaddressB,
      hardware,
      hardwareFull,
      software,
      softwareFull,
      softwareAppA,
      softwareAppB,
      softwareAppC,
      softwareAppD,
      softwareAppE,
      contact,
      location,
      locationLat,
      locationLon,
      notes,
      chassis,
      model,
      hwArch,
      vendor,
      contractNumber,
      installerName,
      deploymentStatus,
      urlA,
      urlB,
      urlC,
      hostNetworks,
      hostNetmask,
      hostRouter,
      oobIp,
      oobNetmask,
      oobRouter,
      dateHwPurchase,
      dateHwInstall,
      dateHwExpiry,
      dateHwDecomm,
      siteAddressA,
      siteAddressB,
      siteAddressC,
      siteCity,
      siteState,
      siteCountry,
      siteZip,
      siteRack,
      siteNotes,
      poc_1Name,
      poc_1Email,
      poc_1PhoneA,
      poc_1PhoneB,
      poc_1Cell,
      poc_1Screen,
      poc_1Notes,
      poc_2Name,
      poc_2Email,
      poc_2PhoneA,
      poc_2PhoneB,
      poc_2Cell,
      poc_2Screen,
      poc_2Notes;

  Inventory(
      {this.type = '',
      this.typeFull = '',
      this.name = '',
      this.alias = '',
      this.os = '',
      this.osFull = '',
      this.osShort = '',
      this.serialnoA = '',
      this.serialnoB = '',
      this.tag = '',
      this.assetTag = '',
      this.macaddressA = '',
      this.macaddressB = '',
      this.hardware = '',
      this.hardwareFull = '',
      this.software = '',
      this.softwareFull = '',
      this.softwareAppA = '',
      this.softwareAppB = '',
      this.softwareAppC = '',
      this.softwareAppD = '',
      this.softwareAppE = '',
      this.contact = '',
      this.location = '',
      this.locationLat = '',
      this.locationLon = '',
      this.notes = '',
      this.chassis = '',
      this.model = '',
      this.hwArch = '',
      this.vendor = '',
      this.contractNumber = '',
      this.installerName = '',
      this.deploymentStatus = '',
      this.urlA = '',
      this.urlB = '',
      this.urlC = '',
      this.hostNetworks = '',
      this.hostNetmask = '',
      this.hostRouter = '',
      this.oobIp = '',
      this.oobNetmask = '',
      this.oobRouter = '',
      this.dateHwPurchase = '',
      this.dateHwInstall = '',
      this.dateHwExpiry = '',
      this.dateHwDecomm = '',
      this.siteAddressA = '',
      this.siteAddressB = '',
      this.siteAddressC = '',
      this.siteCity = '',
      this.siteState = '',
      this.siteCountry = '',
      this.siteZip = '',
      this.siteRack = '',
      this.siteNotes = '',
      this.poc_1Name = '',
      this.poc_1Email = '',
      this.poc_1PhoneA = '',
      this.poc_1PhoneB = '',
      this.poc_1Cell = '',
      this.poc_1Screen = '',
      this.poc_1Notes = '',
      this.poc_2Name = '',
      this.poc_2Email = '',
      this.poc_2PhoneA = '',
      this.poc_2PhoneB = '',
      this.poc_2Cell = '',
      this.poc_2Screen = '',
      this.poc_2Notes = ''});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'typeFull': typeFull,
      'name': name,
      'alias': alias,
      'os': os,
      'osFull': osFull,
      'osShort': osShort,
      'serialnoA': serialnoA,
      'serialnoB': serialnoB,
      'tag': tag,
      'assetTag': assetTag,
      'macaddressA': macaddressA,
      'macaddressB': macaddressB,
      'hardware': hardware,
      'hardwareFull': hardwareFull,
      'software': software,
      'softwareFull': softwareFull,
      'softwareAppA': softwareAppA,
      'softwareAppB': softwareAppB,
      'softwareAppC': softwareAppC,
      'softwareAppD': softwareAppD,
      'softwareAppE': softwareAppE,
      'contact': contact,
      'location': location,
      'locationLat': locationLat,
      'locationLon': locationLon,
      'notes': notes,
      'chassis': chassis,
      'model': model,
      'hwArch': hwArch,
      'vendor': vendor,
      'contractNumber': contractNumber,
      'installerName': installerName,
      'deploymentStatus': deploymentStatus,
      'urlA': urlA,
      'urlB': urlB,
      'urlC': urlC,
      'hostNetworks': hostNetworks,
      'hostNetmask': hostNetmask,
      'hostRouter': hostRouter,
      'oobIp': oobIp,
      'oobNetmask': oobNetmask,
      'oobRouter': oobRouter,
      'dateHwPurchase': dateHwPurchase,
      'dateHwInstall': dateHwInstall,
      'dateHwExpiry': dateHwExpiry,
      'dateHwDecomm': dateHwDecomm,
      'siteAddressA': siteAddressA,
      'siteAddressB': siteAddressB,
      'siteAddressC': siteAddressC,
      'siteCity': siteCity,
      'siteState': siteState,
      'siteCountry': siteCountry,
      'siteZip': siteZip,
      'siteRack': siteRack,
      'siteNotes': siteNotes,
      'poc_1Name': poc_1Name,
      'poc_1Email': poc_1Email,
      'poc_1PhoneA': poc_1PhoneA,
      'poc_1PhoneB': poc_1PhoneB,
      'poc_1Cell': poc_1Cell,
      'poc_1Screen': poc_1Screen,
      'poc_1Notes': poc_1Notes,
      'poc_2Name': poc_2Name,
      'poc_2Email': poc_2Email,
      'poc_2PhoneA': poc_2PhoneA,
      'poc_2PhoneB': poc_2PhoneB,
      'poc_2Cell': poc_2Cell,
      'poc_2Screen': poc_2Screen,
      'poc_2Notes': poc_2Notes,
    };
  }

  factory Inventory.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return Inventory(
        type: json["type"] ?? '',
        typeFull: json["type_full"] ?? '',
        name: json["name"] ?? '',
        alias: json["alias"] ?? '',
        os: json["os"] ?? '',
        osFull: json["os_full"] ?? '',
        osShort: json["os_short"] ?? '',
        serialnoA: json["serialno_a"] ?? '',
        serialnoB: json["serialno_b"] ?? '',
        tag: json["tag"] ?? '',
        assetTag: json["asset_tag"] ?? '',
        macaddressA: json["macaddress_a"] ?? '',
        macaddressB: json["macaddress_b"] ?? '',
        hardware: json["hardware"] ?? '',
        hardwareFull: json["hardware_full"] ?? '',
        software: json["software"] ?? '',
        softwareFull: json["software_full"] ?? '',
        softwareAppA: json["software_app_a"] ?? '',
        softwareAppB: json["software_app_b"] ?? '',
        softwareAppC: json["software_app_c"] ?? '',
        softwareAppD: json["software_app_d"] ?? '',
        softwareAppE: json["software_app_e"] ?? '',
        contact: json["contact"] ?? '',
        location: json["location"] ?? '',
        locationLat: json["location_lat"] ?? '',
        locationLon: json["location_lon"] ?? '',
        notes: json["notes"] ?? '',
        chassis: json["chassis"] ?? '',
        model: json["model"] ?? '',
        hwArch: json["hw_arch"] ?? '',
        vendor: json["vendor"] ?? '',
        contractNumber: json["contract_number"] ?? '',
        installerName: json["installer_name"] ?? '',
        deploymentStatus: json["deployment_status"] ?? '',
        urlA: json["url_a"] ?? '',
        urlB: json["url_b"] ?? '',
        urlC: json["url_c"] ?? '',
        hostNetworks: json["host_networks"] ?? '',
        hostNetmask: json["host_netmask"] ?? '',
        hostRouter: json["host_router"] ?? '',
        oobIp: json["oob_ip"] ?? '',
        oobNetmask: json["oob_netmask"] ?? '',
        oobRouter: json["oob_router"] ?? '',
        dateHwPurchase: json["date_hw_purchase"] ?? '',
        dateHwInstall: json["date_hw_install"] ?? '',
        dateHwExpiry: json["date_hw_expiry"] ?? '',
        dateHwDecomm: json["date_hw_decomm"] ?? '',
        siteAddressA: json["site_address_a"] ?? '',
        siteAddressB: json["site_address_b"] ?? '',
        siteAddressC: json["site_address_c"] ?? '',
        siteCity: json["site_city"] ?? '',
        siteState: json["site_state"] ?? '',
        siteCountry: json["site_country"] ?? '',
        siteZip: json["site_zip"] ?? '',
        siteRack: json["site_rack"] ?? '',
        siteNotes: json["site_notes"] ?? '',
        poc_1Name: json["poc_1_name"] ?? '',
        poc_1Email: json["poc_1_email"] ?? '',
        poc_1PhoneA: json["poc_1_phone_a"] ?? '',
        poc_1PhoneB: json["poc_1_phone_b"] ?? '',
        poc_1Cell: json["poc_1_cell"] ?? '',
        poc_1Screen: json["poc_1_screen"] ?? '',
        poc_1Notes: json["poc_1_notes"] ?? '',
        poc_2Name: json["poc_2_name"] ?? '',
        poc_2Email: json["poc_2_email"] ?? '',
        poc_2PhoneA: json["poc_2_phone_a"] ?? '',
        poc_2PhoneB: json["poc_2_phone_b"] ?? '',
        poc_2Cell: json["poc_2_cell"] ?? '',
        poc_2Screen: json["poc_2_screen"] ?? '',
        poc_2Notes: json["poc_2_notes"] ?? '',
      );
    } else {
      return Inventory();
    }
  }
}
