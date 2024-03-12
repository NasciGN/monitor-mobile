class Graph {
  final String graphid;
  final String name;

  Graph({
    required this.graphid,
    required this.name,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        graphid: json["graphid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "graphid": graphid,
        "name": name,
      };
}
