import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final VoidCallback? onFilterPressed;

  const CustomSearchBar({super.key, this.onChanged, this.onFilterPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Search jobs...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          if (onFilterPressed != null)
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: onFilterPressed,
            ),
        ],
      ),
    );
  }
}
