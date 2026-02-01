import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final int minQuantity;
  final int maxQuantity;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
    this.minQuantity = 1,
    this.maxQuantity = 99,
  });

  @override
  Widget build(BuildContext context) {
    final canDecrease = quantity > minQuantity;
    final canIncrease = quantity < maxQuantity;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          decreaseBtn(canDecrease),

          quantityDisplayer(),

          increaseBtn(canIncrease),
        ],
      ),
    );
  }

  InkWell decreaseBtn(bool canDecrease) {
    return InkWell(
      onTap: canDecrease ? onDecrease : null,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.remove,
          size: 20,
          color: canDecrease ? Colors.black87 : Colors.grey[400],
        ),
      ),
    );
  }

  Container quantityDisplayer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey[300]!),
          right: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Text(
        '$quantity',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  InkWell increaseBtn(bool canIncrease) {
    return InkWell(
      onTap: canIncrease ? onIncrease : null,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.add,
          size: 20,
          color: canIncrease ? Colors.black87 : Colors.grey[400],
        ),
      ),
    );
  }
}
