
import 'package:card/feature/class_car.dart';
import 'package:flutter/material.dart';

 Column buildResultCard(String message, dynamic nameController ) {
    return Column(
      children: [
        Center(
                child: Text(
                  "Bienvenue : ${nameController.text}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              //const SizedBox(height: 10),
              Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
             message,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(14) ),
            height: 130,
            width: double.infinity,
            child: Image.asset(
               Car.urlString,
             //height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
              )
      ],
    );
    
  }
