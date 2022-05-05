import 'dart:convert';

class NoteModel {
  int id;
  String title;
  String description;
  String date;
  String time;
  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  NoteModel copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    String? time,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'date': date});
    result.addAll({'time': time});
  
    return result;
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, description: $description, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NoteModel &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.date == date &&
      other.time == time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      date.hashCode ^
      time.hashCode;
  }
}
