// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Leads extends Equatable {
  final String id;
  final String leadName;
  final String leadSource;
  final String leadStatus;
  final String contactInfo;
  final bool contacted;
  final String notes;

  const Leads({
    required this.id,
    required this.leadName,
    required this.leadSource,
    required this.leadStatus,
    required this.contactInfo,
    required this.contacted,
    required this.notes,
  });

  Leads copyWith({
    String? id,
    String? leadName,
    String? leadSource,
    String? leadStatus,
    String? contactInfo,
    bool? contacted,
    String? notes,
  }) {
    return Leads(
      id: id ?? this.id,
      leadName: leadName ?? this.leadName,
      leadSource: leadSource ?? this.leadSource,
      leadStatus: leadStatus ?? this.leadStatus,
      contactInfo: contactInfo ?? this.contactInfo,
      contacted: contacted ?? this.contacted,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'leadName': leadName,
      'leadSource': leadSource,
      'leadStatus': leadStatus,
      'contactInfo': contactInfo,
      'contacted': contacted,
      'notes': notes,
    };
  }

  factory Leads.fromMap(Map<String, dynamic> map) {
    return Leads(
      id: map['id'] as String,
      leadName: map['leadName'] as String,
      leadSource: map['leadSource'] as String,
      leadStatus: map['leadStatus'] as String,
      contactInfo: map['contactInfo'] as String,
      contacted: map['contacted'] as bool,
      notes: map['notes'] as String,
    );
  }

  @override
  String toString() {
    return 'Leads(id: $id, leadName: $leadName, leadSource: $leadSource, leadStatus: $leadStatus, contactInfo: $contactInfo, contacted: $contacted, notes: $notes)';
  }

  @override
  bool operator ==(covariant Leads other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.leadName == leadName &&
        other.leadSource == leadSource &&
        other.leadStatus == leadStatus &&
        other.contactInfo == contactInfo &&
        other.contacted == contacted &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        leadName.hashCode ^
        leadSource.hashCode ^
        leadStatus.hashCode ^
        contactInfo.hashCode ^
        contacted.hashCode ^
        notes.hashCode;
  }

  @override
  List<Object?> get props => [
        id,
        leadName,
        leadSource,
        leadStatus,
        contactInfo,
        contacted,
        notes,
      ];
}
