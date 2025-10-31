import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime)? onDateSelected;
  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateField({
    super.key,
    this.initialDate,
    this.onDateSelected,
    this.labelText,
    this.hintText,
    this.readOnly = true,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late TextEditingController _controller;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: widget.initialDate != null
          ? DateFormat.yMMMd().format(widget.initialDate!)
          : '',
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _controller.text = DateFormat.yMMMd().format(pickedDate);
      });
      widget.onDateSelected?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        labelText: widget.labelText ?? 'Fecha',
        hintText: widget.hintText ?? 'Selecciona una fecha',
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
      ),
      onTap: widget.readOnly ? () => _selectDate(context) : null,
    );
  }
}
