import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onSelectionChanged;

  MultiSelectDropdown({
    required this.items,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Items',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: widget.items.map((item) {
            return DropdownMenuItem(
              value: item,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        isSelected ? selectedItems.remove(item) : selectedItems.add(item);
                      });
                      widget.onSelectionChanged(selectedItems); // Call the onSelectionChanged method
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          if (isSelected)
                            const Icon(Icons.check_box_outlined)
                          else
                            const Icon(Icons.check_box_outline_blank),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
          value: selectedItems.isEmpty ? null : selectedItems.last,
          onChanged: (value) {},
          selectedItemBuilder: (context) {
            return [
              Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  selectedItems.join(', '),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
            ];
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 16, right: 8),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
