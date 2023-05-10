import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
class EnderecoCard extends StatelessWidget {
  const EnderecoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 149),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Endereço',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Rua:',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Nº',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Complemento:',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'CEP:',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    
                  ),
                  Text(
                          'Cidade/Estado:',
                          style: TextStyle(fontSize: 12),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}