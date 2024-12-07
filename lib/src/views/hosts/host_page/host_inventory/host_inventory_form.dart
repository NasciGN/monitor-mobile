import 'package:flutter/material.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:monitor_mobile/src/views/hosts/host_page/host_inventory/form/form.dart';

class HostInventoryForm extends StatelessWidget {
  HostInventoryForm({super.key, required this.host});

  final Host host;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomInventoryTypeForm(type: host.inventory!.type),
          CustomInventoryTypeFullForm(typeFull: host.inventory!.typeFull),
          CustomInventoryNameForm(name: host.inventory!.name),
          CustomInventoryAliasForm(alias: host.inventory!.alias),
          CustomInventoryOsForm(os: host.inventory!.os),
          CustomInventoryOsFullForm(osFull: host.inventory!.osFull),
          CustomInventoryOsShortForm(osShort: host.inventory!.osShort),
          CustomInventorySerialnoAForm(serialnoA: host.inventory!.serialnoA),
          CustomInventorySerialnoBForm(serialnoB: host.inventory!.serialnoB),
          CustomInventoryTagForm(tag: host.inventory!.tag),
          CustomInventoryAssetTagForm(assetTag: host.inventory!.assetTag),
          CustomInventoryMacaddressAForm(
              macaddressA: host.inventory!.macaddressA),
          CustomInventoryMacaddressBForm(
              macaddressB: host.inventory!.macaddressB),
          CustomInventoryHardwareForm(hardware: host.inventory!.hardware),
          CustomInventoryHardwareFullForm(
              hardwareFull: host.inventory!.hardwareFull),
          CustomInventorySoftwareForm(software: host.inventory!.software),
          CustomInventorySoftwareFullForm(
              softwareFull: host.inventory!.softwareFull),
          CustomInventorySoftwareAppAForm(
              softwareAppA: host.inventory!.softwareAppA),
          CustomInventorySoftwareAppBForm(
              softwareAppB: host.inventory!.softwareAppB),
          CustomInventorySoftwareAppCForm(
              softwareAppC: host.inventory!.softwareAppC),
          CustomInventorySoftwareAppDForm(
              softwareAppD: host.inventory!.softwareAppD),
          CustomInventorySoftwareAppEForm(
              softwareAppE: host.inventory!.softwareAppE),
          CustomInventoryContactForm(contact: host.inventory!.contact),
          CustomInventoryLocationForm(location: host.inventory!.location),
          CustomInventoryLocationLatForm(
              locationLat: host.inventory!.locationLat),
          CustomInventoryLocationLonForm(
              locationLon: host.inventory!.locationLon),
          CustomInventoryNotesForm(notes: host.inventory!.notes),
          CustomInventoryChassisForm(chassis: host.inventory!.chassis),
          CustomInventoryModelForm(model: host.inventory!.model),
          CustomInventoryHwArchForm(hwArch: host.inventory!.hwArch),
          CustomInventoryVendorForm(vendor: host.inventory!.vendor),
          CustomInventoryContractNumberForm(
              contractNumber: host.inventory!.contractNumber),
          CustomInventoryInstallerNameForm(
              installerName: host.inventory!.installerName),
          CustomInventoryDeploymentStatusForm(
              deploymentStatus: host.inventory!.deploymentStatus),
          CustomInventoryUrlAForm(urlA: host.inventory!.urlA),
          CustomInventoryUrlBForm(urlB: host.inventory!.urlB),
          CustomInventoryUrlCForm(urlC: host.inventory!.urlC),
          CustomInventoryHostNetworksForm(
              hostNetworks: host.inventory!.hostNetworks),
          CustomInventoryHostNetmaskForm(
              hostNetmask: host.inventory!.hostNetmask),
          CustomInventoryHostRouterForm(hostRouter: host.inventory!.hostRouter),
          CustomInventoryOobIpForm(oobIp: host.inventory!.oobIp),
          CustomInventoryOobNetmaskForm(oobNetmask: host.inventory!.oobNetmask),
          CustomInventoryOobRouterForm(oobRouter: host.inventory!.oobRouter),
          CustomInventoryDateHwPurchaseForm(
              dateHwPurchase: host.inventory!.dateHwPurchase),
          CustomInventoryDateHwInstallForm(
              dateHwInstall: host.inventory!.dateHwInstall),
          CustomInventoryDateHwExpiryForm(
              dateHwExpiry: host.inventory!.dateHwExpiry),
          CustomInventoryDateHwDecommForm(
              dateHwDecomm: host.inventory!.dateHwDecomm),
          CustomInventorySiteAddressAForm(
              siteAddressA: host.inventory!.siteAddressA),
          CustomInventorySiteAddressBForm(
              siteAddressB: host.inventory!.siteAddressB),
          CustomInventorySiteAddressCForm(
              siteAddressC: host.inventory!.siteAddressC),
          CustomInventorySiteCityForm(siteCity: host.inventory!.siteCity),
          CustomInventorySiteStateForm(siteState: host.inventory!.siteState),
          CustomInventorySiteCountryForm(
              siteCountry: host.inventory!.siteCountry),
          CustomInventorySiteZipForm(siteZip: host.inventory!.siteZip),
          CustomInventorySiteRackForm(siteRack: host.inventory!.siteRack),
          CustomInventorySiteNotesForm(siteNotes: host.inventory!.siteNotes),
          CustomInventoryPoc1Name1nameForm(
              poc_1Name: host.inventory!.poc_1Name),
          CustomInventoryPoc1Email1emailForm(
              poc_1Email: host.inventory!.poc_1Email),
          CustomInventoryPoc1PhoneA1phoneaForm(
              poc_1PhoneA: host.inventory!.poc_1PhoneA),
          CustomInventoryPoc1PhoneB1phonebForm(
              poc_1PhoneB: host.inventory!.poc_1PhoneB),
          CustomInventoryPoc1Cell1cellForm(
              poc_1Cell: host.inventory!.poc_1Cell),
          CustomInventoryPoc1Screen1screenForm(
              poc_1Screen: host.inventory!.poc_1Screen),
          CustomInventoryPoc1Notes1notesForm(
              poc_1Notes: host.inventory!.poc_1Notes),
          CustomInventoryPoc2Name2nameForm(
              poc_2Name: host.inventory!.poc_2Name),
          CustomInventoryPoc2Email2emailForm(
              poc_2Email: host.inventory!.poc_2Email),
          CustomInventoryPoc2PhoneA2phoneaForm(
              poc_2PhoneA: host.inventory!.poc_2PhoneA),
          CustomInventoryPoc2PhoneB2phonebForm(
              poc_2PhoneB: host.inventory!.poc_2PhoneB),
          CustomInventoryPoc2Cell2cellForm(
              poc_2Cell: host.inventory!.poc_2Cell),
          CustomInventoryPoc2Screen2screenForm(
              poc_2Screen: host.inventory!.poc_2Screen),
          CustomInventoryPoc2Notes2notesForm(
              poc_2Notes: host.inventory!.poc_2Notes),
        ]),
      ),
    );
  }
}
