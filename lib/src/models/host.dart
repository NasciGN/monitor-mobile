import 'host_interface.dart';
import 'group.dart';
import 'template.dart';
import 'host_inventory.dart';

class Host {
  String id, host, name, description, status, inventoryMode, activeAvailable;
  List<Template> parentTemplates;
  List<Group> hostGroups;
  List<Interface> hostInterfaces;
  Interface? mainInterface;
  Inventory? inventory;
  Host({
    required this.id,
    required this.host,
    this.name = '',
    this.description = '',
    required this.status,
    required this.inventoryMode,
    required this.activeAvailable,
    this.parentTemplates = const [],
    this.hostGroups = const [],
    this.hostInterfaces = const [],
    this.mainInterface,
    this.inventory,
  });

  Map<String, dynamic> toMap() {
    return {
      'hostid': id,
      'host': host,
      'name': name,
      'description': description,
      'status': status,
      'inventory_mode': inventoryMode,
      'active_available': activeAvailable,
      'parent_templates':
          parentTemplates.map((template) => template.toMap()).toList(),
      'host_groups': hostGroups.map((group) => group.toMap()).toList(),
    };
  }

  factory Host.fromJson(Map<String, dynamic>? json) {
    if (json!.isNotEmpty) {
      List<Template> parentTemplates =
          (json['parentTemplates'] as List<dynamic>)
              .map((templateJson) => Template.fromJson(templateJson))
              .toList();
      List<Group> hostGroups = (json['hostgroups'] as List<dynamic>)
          .map((groupJson) => Group.fromJson(groupJson))
          .toList();

      Inventory? inventory;
      final dynamic inventoryJson = json['inventory'];

      if (inventoryJson is Map<String, dynamic>) {
        inventory = Inventory.fromJson(inventoryJson);
      } else {
        inventory = Inventory();
      }

      var host = Host(
        id: json['hostid'],
        host: json['host'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        status: json['status'] ?? '',
        inventoryMode: json['inventory_mode'] ?? '',
        activeAvailable: json['active_available'] ?? '',
        parentTemplates: parentTemplates,
        hostGroups: hostGroups,
        inventory: inventory,
      );

      return host;
    } else {
      return Host(
        id: '',
        host: '',
        status: '',
        inventoryMode: '',
        activeAvailable: '',
        parentTemplates: [],
        hostGroups: [],
      );
    }
  }
}
