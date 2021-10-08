class DocumentConstants{
  static const List<DocumentType> personGener = [
    DocumentType(label: 'Masculini', value: 0),
    DocumentType(label: 'Femenino', value: 1),
    DocumentType(label: 'Otro', value: 2),
  ];
}

class DocumentType {
  const DocumentType({this.label, this.value});

  final String? label;
  final int? value;
}