import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostInvetoryFormController extends GetxController {
  bool isEdit = false;
  TextEditingController type = TextEditingController();
  TextEditingController typeFull = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController alias = TextEditingController();
  TextEditingController os = TextEditingController();
  TextEditingController osFull = TextEditingController();
  TextEditingController osShort = TextEditingController();
  TextEditingController serialnoA = TextEditingController();
  TextEditingController serialnoB = TextEditingController();
  TextEditingController tag = TextEditingController();
  TextEditingController assetTag = TextEditingController();
  TextEditingController macaddressA = TextEditingController();
  TextEditingController macaddressB = TextEditingController();
  TextEditingController hardware = TextEditingController();
  TextEditingController hardwareFull = TextEditingController();
  TextEditingController software = TextEditingController();
  TextEditingController softwareFull = TextEditingController();
  TextEditingController softwareAppA = TextEditingController();
  TextEditingController softwareAppB = TextEditingController();
  TextEditingController softwareAppC = TextEditingController();
  TextEditingController softwareAppD = TextEditingController();
  TextEditingController softwareAppE = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController locationLat = TextEditingController();
  TextEditingController locationLon = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController chassis = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController hwArch = TextEditingController();
  TextEditingController vendor = TextEditingController();
  TextEditingController contractNumber = TextEditingController();
  TextEditingController installerName = TextEditingController();
  TextEditingController deploymentStatus = TextEditingController();
  TextEditingController urlA = TextEditingController();
  TextEditingController urlB = TextEditingController();
  TextEditingController urlC = TextEditingController();
  TextEditingController hostNetworks = TextEditingController();
  TextEditingController hostNetmask = TextEditingController();
  TextEditingController hostRouter = TextEditingController();
  TextEditingController oobIp = TextEditingController();
  TextEditingController oobNetmask = TextEditingController();
  TextEditingController oobRouter = TextEditingController();
  TextEditingController dateHwPurchase = TextEditingController();
  TextEditingController dateHwInstall = TextEditingController();
  TextEditingController dateHwExpiry = TextEditingController();
  TextEditingController dateHwDecomm = TextEditingController();
  TextEditingController siteAddressA = TextEditingController();
  TextEditingController siteAddressB = TextEditingController();
  TextEditingController siteAddressC = TextEditingController();
  TextEditingController siteCity = TextEditingController();
  TextEditingController siteState = TextEditingController();
  TextEditingController siteCountry = TextEditingController();
  TextEditingController siteZip = TextEditingController();
  TextEditingController siteRack = TextEditingController();
  TextEditingController siteNotes = TextEditingController();
  TextEditingController poc_1Name = TextEditingController();
  TextEditingController poc_1Email = TextEditingController();
  TextEditingController poc_1PhoneA = TextEditingController();
  TextEditingController poc_1PhoneB = TextEditingController();
  TextEditingController poc_1Cell = TextEditingController();
  TextEditingController poc_1Screen = TextEditingController();
  TextEditingController poc_1Notes = TextEditingController();
  TextEditingController poc_2Name = TextEditingController();
  TextEditingController poc_2Email = TextEditingController();
  TextEditingController poc_2PhoneA = TextEditingController();
  TextEditingController poc_2PhoneB = TextEditingController();
  TextEditingController poc_2Cell = TextEditingController();
  TextEditingController poc_2Screen = TextEditingController();
  TextEditingController poc_2Notes = TextEditingController();

  @override
  onClose() {
    type.dispose();
    typeFull.dispose();
    name.dispose();
    alias.dispose();
    os.dispose();
    osFull.dispose();
    osShort.dispose();
    serialnoA.dispose();
    serialnoB.dispose();
    tag.dispose();
    assetTag.dispose();
    macaddressA.dispose();
    macaddressB.dispose();
    hardware.dispose();
    hardwareFull.dispose();
    software.dispose();
    softwareFull.dispose();
    softwareAppA.dispose();
    softwareAppB.dispose();
    softwareAppC.dispose();
    softwareAppD.dispose();
    softwareAppE.dispose();
    contact.dispose();
    location.dispose();
    locationLat.dispose();
    locationLon.dispose();
    notes.dispose();
    chassis.dispose();
    model.dispose();
    hwArch.dispose();
    vendor.dispose();
    contractNumber.dispose();
    installerName.dispose();
    deploymentStatus.dispose();
    urlA.dispose();
    urlB.dispose();
    urlC.dispose();
    hostNetworks.dispose();
    hostNetmask.dispose();
    hostRouter.dispose();
    oobIp.dispose();
    oobNetmask.dispose();
    oobRouter.dispose();
    dateHwPurchase.dispose();
    dateHwInstall.dispose();
    dateHwExpiry.dispose();
    dateHwDecomm.dispose();
    siteAddressA.dispose();
    siteAddressB.dispose();
    siteAddressC.dispose();
    siteCity.dispose();
    siteState.dispose();
    siteCountry.dispose();
    siteZip.dispose();
    siteRack.dispose();
    siteNotes.dispose();
    poc_1Name.dispose();
    poc_1Email.dispose();
    poc_1PhoneA.dispose();
    poc_1PhoneB.dispose();
    poc_1Cell.dispose();
    poc_1Screen.dispose();
    poc_1Notes.dispose();
    poc_2Name.dispose();
    poc_2Email.dispose();
    poc_2PhoneA.dispose();
    poc_2PhoneB.dispose();
    poc_2Cell.dispose();
    poc_2Screen.dispose();
    poc_2Notes.dispose();
  }
}
