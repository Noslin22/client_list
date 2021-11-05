import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts.dart';

class InputField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? formatters;
  final int focusNode;
  final Function? submit;
  final String? initialValue;
  final Function(String) changed;
  const InputField({
    Key? key,
    required this.label,
    this.formatters,
    required this.focusNode,
    this.submit,
    this.initialValue,
    required this.changed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: changed,
      initialValue: initialValue,
      inputFormatters: formatters,
      focusNode: nodes[focusNode],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Este campo é obrigatorio";
        } else if (formatters != null &&
            !RegExp(r"[0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2}")
                .hasMatch(value)) {
          return "Insira um CNPJ válido";
        }
        return null;
      },
      onFieldSubmitted: (_) {
        if (focusNode != 3) {
          FocusScope.of(context).requestFocus(nodes[focusNode + 1]);
        } else {
          submit!();
        }
      },
    );
  }
}
