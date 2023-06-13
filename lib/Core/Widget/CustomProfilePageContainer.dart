import 'package:flutter/material.dart';

class ProfilePageCustomContainer extends StatefulWidget {
  const ProfilePageCustomContainer({super.key, required this.titleText, required this.messageField});
  final String titleText;
  final String messageField;

  @override
  State<ProfilePageCustomContainer> createState() => _ProfilePageCustomContainerState();
}

class _ProfilePageCustomContainerState extends State<ProfilePageCustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 17, bottom: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleText,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 16),
                ),
                Text(
                  widget.messageField,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            Icon(
              Icons.navigate_next,
              size: 30,
              color: Colors.grey.shade700,
            )
          ],
        ),
      ),
    );
  }
}
