import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    required this.options,
    required this.onChange,
    required this.value,
    required this.label,
    Key? key,
  }) : super(key: key);
  final List<String?> options;
  final String label;
  final String? value;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: false,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: Container(),
          value: value,
          elevation: 10,
          onChanged: (String? v) => onChange(v),
          dropdownColor: Colors.grey[50],
          items: options.map<DropdownMenuItem<String>>((String? value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value!),
            );
          }).toList(),
        ),
      ),
    );
  }
}