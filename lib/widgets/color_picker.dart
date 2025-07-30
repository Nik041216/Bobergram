import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerTile extends StatefulWidget{
  final Color startColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerTile({
    super.key,
    required this.startColor,
    required this.onColorChanged,
  });

  @override
  State<ColorPickerTile> createState() => _ColorPickerState(); 
}

class _ColorPickerState extends State<ColorPickerTile> {
  late Color _currentColor;

  @override
  void initState(){
    super.initState();
    _currentColor = widget.startColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12,),
        ColorPicker(
          paletteType: PaletteType.hslWithHue,
          pickerColor: _currentColor, 
          onColorChanged: (color) {
            setState(() {
              _currentColor = color;
            });
            widget.onColorChanged(color);
          },
          enableAlpha: false,
          labelTypes: const [ColorLabelType.hex, ColorLabelType.rgb],
          pickerAreaHeightPercent: 0.6,
        ),

      ],
    );
  }
}