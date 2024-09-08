class Bus {
  String make;
  String model;
  String registrationNumber;
  int seatingCapacity;
  String ownerName;
  String documentId;

  Bus({
    required this.make,
    required this.model,
    required this.registrationNumber,
    required this.seatingCapacity,
    required this.ownerName,
    this.documentId = '',
  });

  // Convert Bus object to a Map
  Map<String, dynamic> toMap() {
    return {
      'Make': make,
      'Model': model,
      'RegNo': registrationNumber,
      'seat': seatingCapacity,
      'own': ownerName,
    };
  }

  // Create a Bus object from Firestore data
  Bus.fromMap(String id, Map<String, dynamic> map)
      : this(
    make: map['Make'] ?? '',
    model: map['Model'] ?? '',
    registrationNumber: map['RegNo'] ?? '',
    seatingCapacity: map['seat'] ?? 0,
    ownerName: map['own'] ?? '',
    documentId: id,
  );

  // Convert list of Bus objects to a JSON array
  static String listToJson(List<Bus> buses) {
    return buses.map((bus) => bus.toMap()).toList().toString();
  }

  // Create a list of Bus objects from a JSON array
  static List<Bus> listFromJson(String json) {
    List<Map<String, dynamic>> dataList =
    List<Map<String, dynamic>>.from(eval(json));

    return dataList.map((data) {
      String id = data['documentId'] ?? '';
      return Bus.fromMap(id, data);
    }).toList();
  }

  // Helper function to safely evaluate JSON
  static dynamic eval(String input) {
    if (input == null || input.isEmpty) return [];
    try {
      return Function.apply(Function.apply(eval, []), [input]);
    } catch (e) {
      return [];
    }
  }
}
