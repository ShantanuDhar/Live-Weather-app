
import 'package:flutter/material.dart';


class HourlyForecastItem extends StatelessWidget {
  final String hval1;
  final String hval2;
  final IconData icon;

  const HourlyForecastItem({super.key,
  required this.hval1,
  required this.hval2, 
  required this.icon

  });

  @override
  Widget build(BuildContext context) {
    return  Card(
                  elevation: 6,
          
                  child:Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:   Column(children: [
                              Text(hval1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              const SizedBox(height: 8),
                               Icon(icon,
                              size:32),
                               const SizedBox(height: 8),
                               Text(hval2)
                    ],
                    ),
                  ) 
                );
  }
}