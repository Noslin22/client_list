import 'package:brasil_fields/brasil_fields.dart';
import 'package:client_list/pages/clients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:client_list/models/client_model.dart';
import 'package:client_list/widgets/input_field.dart';

import '../consts.dart';

class NewClient extends StatelessWidget {
  ClientModel? client;
  NewClient({
    Key? key,
    this.client,
  }) : super(key: key);
  bool empty = true;
  int id = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    empty = client == null;
    client ??= ClientModel.empty();
    id = client!.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Client"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputField(
                label: "Nome",
                focusNode: 0,
                changed: (value) => client!.nome = value,
                initialValue: client!.nome.isEmpty ? null : client!.nome,
              ),
              const SizedBox(height: 10),
              InputField(
                label: "Loja",
                focusNode: 1,
                changed: (value) => client!.loja = value,
                initialValue: client!.loja.isEmpty ? null : client!.loja,
              ),
              const SizedBox(height: 10),
              InputField(
                label: "CNPJ",
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter(),
                ],
                focusNode: 2,
                changed: (value) => client!.cnpj = value,
                initialValue: client!.cnpj.isEmpty ? null : client!.cnpj,
              ),
              const SizedBox(height: 10),
              InputField(
                label: "Email",
                focusNode: 3,
                submit: () {
                  if (formKey.currentState!.validate()) {
                    if (empty) {
                      client!.id = clientes.isEmpty ? 0 : clientes.last.id + 1;
                      clientes.add(client!);
                    } else {
                      clientes[id] = client!;
                    }
                    prefs.setStringList(
                      "clientes",
                      clientes.map((e) => e.toJson()).toList(),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const Clients(),
                      ),
                    );
                  }
                },
                changed: (value) => client!.email = value,
                initialValue: client!.email.isEmpty ? null : client!.email,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (empty) {
                      client!.id = clientes.isEmpty ? 0 : clientes.last.id + 1;
                      clientes.add(client!);
                    } else {
                      clientes[id] = client!;
                    }
                    prefs.setStringList(
                      "clientes",
                      clientes.map((e) => e.toJson()).toList(),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const Clients(),
                      ),
                    );
                  }
                },
                child: Text(empty ? "Save" : "Edit"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  maximumSize: const Size.fromHeight(50),
                  primary: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
