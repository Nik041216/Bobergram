import 'package:flutter/material.dart';
import '../models/app_settings.dart';
import 'package:provider/provider.dart';
import '../widgets/color_picker.dart';


class EditableExpansionPanelList extends StatefulWidget {
  const EditableExpansionPanelList({super.key});

  @override
  State<EditableExpansionPanelList> createState() => _EditableExpansionPanelListState();
}

class _EditableExpansionPanelListState extends State<EditableExpansionPanelList> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);
    final isDarkMode = settings.isDarkTheme;


    Color colorMe, colorOther;
    if (isDarkMode) {
      colorMe = settings.myBubbleColorDark;
      colorOther = settings.otherMessageColorDark;
    } else {
      colorMe = settings.myBubbleColor;
      colorOther = settings.otherMessageColor;
    }

    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          if (index == 0) {
            _isExpanded1 = !_isExpanded1;
          } else if (index == 1) {
            _isExpanded2 = !_isExpanded2;
          }
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: const Text('Цвет ваших сообщений'),
              trailing: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: settings.myBubbleColor,
                      radius: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: settings.myBubbleColorDark,
                      radius: 15,
                    ),
                  ],
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(4),
            child: ColorPickerTile(startColor: colorMe, onColorChanged: (color) {})
          ),
          isExpanded: _isExpanded1,
          canTapOnHeader: true,
        ),
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: const Text('Цвет сообщений собеседника'),
              trailing: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: settings.otherMessageColor,
                      radius: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: settings.otherMessageColorDark,
                      radius: 15,
                    ),
                  ],
                ),
              )
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ColorPickerTile(startColor: colorOther, onColorChanged: (color) {})
          ),
          isExpanded: _isExpanded2,
          canTapOnHeader: true,
        ),
      ],
    );
  }
}
