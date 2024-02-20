import 'package:flutter/material.dart';

// Содержимое боттомшита с выбором источника картинки на экране создания мема
class EnterPictureLinkWidget extends StatefulWidget {
  const EnterPictureLinkWidget({super.key});

  @override
  State<EnterPictureLinkWidget> createState() => _EnterPictureLinkWidgetState();
}

class _EnterPictureLinkWidgetState extends State<EnterPictureLinkWidget> {
  late bool showLinkField;
  late final _linkController = TextEditingController();
  @override
  void initState() {
    showLinkField = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(
                  (true, 'No'),
                ),
                child: const Text(
                  'Gallery',
                  style: TextStyle(
                    fontFamily: 'Impact',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () => setState(() {
                  showLinkField = true;
                }),
                child: const Text(
                  'Link',
                  style: TextStyle(
                    fontFamily: 'Impact',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          AnimatedOpacity(
            opacity: showLinkField ? 1 : 0,
            duration: const Duration(
              milliseconds: 300,
            ),
            child: Column(
              children: [
                TextField(
                  controller: _linkController,
                  keyboardType: TextInputType.none,
                  style: const TextStyle(
                    fontFamily: 'Impact',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 17),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isCollapsed: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Paste your link here',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_linkController.text.isEmpty) {
                      return;
                    }
                    Navigator.of(context).pop(
                      (
                        false,
                        _linkController.text,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.done,
                    color: _linkController.text.isEmpty
                        ? Colors.grey
                        : Colors.green,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
