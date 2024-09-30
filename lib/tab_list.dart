// ignore_for_file: library_private_types_in_public_api, duplicate_ignore

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'laptop_details.dart';
import 'tab_new.dart';

class TabList extends StatefulWidget {
  final List<LaptopDetails> laptopList;
  final Function(int) onDelete;

  const TabList({
    super.key,
    required this.laptopList,
    required this.onDelete,
  });

  @override
  _TabListState createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = List.generate(widget.laptopList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return widget.laptopList.isEmpty
        ? const Center(child: Text("No laptops added yet"))
        : SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _isExpanded[index] = !_isExpanded[index];
                });
              },
              children: widget.laptopList.asMap().entries.map((entry) {
                int index = entry.key;
                LaptopDetails laptop = entry.value;

                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return _buildDismissibleHeader(context, index, laptop);
                  },
                  body: _buildExpansionPanelBody(laptop),
                  isExpanded: _isExpanded[index],
                );
              }).toList(),
            ),
          );
  }

  Widget _buildDismissibleHeader(
      BuildContext context, int index, LaptopDetails laptop) {
    return Dismissible(
      key: Key(laptop.brand + index.toString()),
      direction: DismissDirection.horizontal,
      background:
          _buildSwipeBackground(Colors.blue, 'Edit', Alignment.centerLeft),
      secondaryBackground:
          _buildSwipeBackground(Colors.red, 'Delete', Alignment.centerRight),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          await _handleEdit(context, laptop);
          return false;
        } else if (direction == DismissDirection.endToStart) {
          return await _confirmDelete(context, index);
        }
        return false;
      },
      child: ListTile(
        title: Text(laptop.brand),
        subtitle: Text('CPU: ${laptop.cpu}'),
      ),
    );
  }

  Widget _buildSwipeBackground(Color color, String text, Alignment alignment) {
    return Container(
      color: color,
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Future<void> _handleEdit(BuildContext context, LaptopDetails laptop) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TabNew(
          laptop: laptop,
          onAdd: (newLaptop) {
            setState(() {
              // Update the laptop list with the new laptop
              final index = widget.laptopList.indexOf(laptop);
              widget.laptopList[index] = newLaptop;
            });
          },
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context, int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Laptop'),
          content: const Text('Are you sure you want to delete this laptop?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      widget.onDelete(index);
      return true;
    }
    return false;
  }

  Widget _buildExpansionPanelBody(LaptopDetails laptop) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('GPU: ${laptop.gpu}'),
          Text('RAM: ${laptop.ram}GB'),
          Text('Weight: ${laptop.mass}kg'),
          Text('Screen: ${laptop.screenSize} inches'),
          Text('Storage: ${laptop.isHdSsd ? "SSD" : "HDD"}'),
          Text('OS Installed: ${laptop.isWindowsInstalled ? "Yes" : "No"}'),
          Text('Manufacturing Date: ${laptop.manufacturingDate}'),
        ],
      ),
    );
  }
}
