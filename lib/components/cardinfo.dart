import 'package:flutter/material.dart';

class Cardinfo extends StatefulWidget {
  late String titleCard;
  late String valueCard;
  late Icon iconCard;
  Cardinfo({
    super.key,
    required this.titleCard,
    required this.valueCard,
    required this.iconCard,
  });

  @override
  State<Cardinfo> createState() => _CardinfoState();
}

class _CardinfoState extends State<Cardinfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 100,
            width: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.titleCard,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.iconCard,
                    Container(
                      child: Text(
                        widget.valueCard,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}