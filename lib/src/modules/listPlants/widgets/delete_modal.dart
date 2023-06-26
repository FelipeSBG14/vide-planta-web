import 'package:flutter/material.dart';

import '../../../models/plants_model.dart';
import '../../home/home_controller.dart';
import '../../home/home_page.dart';

class DeleteModal extends StatefulWidget {
  final HomeController controller;
  final PlantsModel plant;
  const DeleteModal({super.key, required this.plant, required this.controller});

  @override
  State<DeleteModal> createState() => _DeleteModalState();
}

class _DeleteModalState extends State<DeleteModal> {
  void _closeModal() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      title: Text(
        widget.plant.popularName,
      ),
      icon: const Icon(
        Icons.warning,
        color: Colors.red,
      ),
      content: const Text(
        'Tem certeza que deseja remover essa planta ?',
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () async {
                await controller.plantDelete(widget.plant.id);

                _closeModal();
              },
              child: const Text(
                'Remover',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: _closeModal,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
