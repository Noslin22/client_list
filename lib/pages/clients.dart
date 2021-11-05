import 'package:client_list/consts.dart';
import 'package:client_list/models/client_model.dart';
import 'package:client_list/pages/new_client.dart';
import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  @override
  Widget build(BuildContext context) {
    clientes = prefs
            .getStringList("clientes")
            ?.map((e) => ClientModel.fromJson(e))
            .toList() ??
        [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clients"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            ClientModel cliente = clientes[index];
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Loja: ${cliente.loja}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Nome: ${cliente.nome}",
                          ),
                          Text(
                            "CNPJ: ${cliente.cnpj}",
                          ),
                          Text(
                            "Email: ${cliente.email}",
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          clientes.removeAt(index);
                          
                    prefs.setStringList(
                      "clientes",
                      clientes.map((e) => e.toJson()).toList(),
                    );
                          setState(() {});
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => NewClient(
                                client: cliente,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: clientes.length,
        ),
      ),
    );
  }
}
