import 'dart:ui';

import 'package:cpf_validator/home/controller/validator_controller.dart';
import 'package:cpf_validator/home/model/validate_cpf.dart';
import 'package:cpf_validator/home/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

import 'widgets/validator_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ValidatorController(ValidateCPFImpl());
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "CPF VALIDATOR",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          SizedBox(height: size.height * .15),
          CustomField(
            controller: textController,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Text CPF here",
              labelStyle: const TextStyle(color: Colors.white),
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              helperStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                controller.setCPF(value!);
              });
            },
          ),
          ValidatorButton(
            enabled: controller.buttonEnable,
            onPressed: () {
              setState(() {
                controller.validate(controller.cpf);
                textController.clear();
              });
            },
          ),
          SizedBox(height: size.height * .08),
          Visibility(
            visible: controller.validateMessage.isNotEmpty,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                controller.validateMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
