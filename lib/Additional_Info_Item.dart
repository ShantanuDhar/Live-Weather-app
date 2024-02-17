
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Additional_Info_Item extends StatelessWidget {
  final IconData icon;
  final String data;
  final String val;
  const Additional_Info_Item({
    super.key,
    required this.icon,
    required this.data,
    required this.val
  });

  @override
  Widget build(BuildContext context) {
    return     Column(
      children: [
        Icon(
                                icon,
                                size: 32,
                              ),
          const SizedBox(height: 8,),     
          Text(data),
          const SizedBox(height: 8,), 
          Text(val,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),)
    
    
      ],
    );
  }
}

