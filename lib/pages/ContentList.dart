import 'package:flutter/material.dart';
import 'package:flutter_demo/others/services.dart';
import 'package:flutter_demo/widgets/PageContainer.dart';
import 'package:flutter_demo/widgets/TextOutlined.dart';

class ContentList extends StatefulWidget {
  final String title;
  final Color color;
  final List<Map<String, dynamic>> list;

  const ContentList({
    Key? key,
    required this.title,
    required this.list,
    required this.color,
  }) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  late final Services services;

  @override
  void initState() {
    services = Services(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: widget.title,
      withBackButton: true,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: services.getSize(40),
          horizontal: services.getSize(60),
        ),
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: services.getSize(5)),
            child: ElevatedButton(
              onPressed: () {
                if (widget.list[index].containsKey('route')) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => widget.list[index]['route'],
                    ),
                  );
                }
              },
              clipBehavior: Clip.hardEdge,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: widget.color,
                      width: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      bottom: 10,
                      right: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextOutlined(
                            text: widget.list[index]['name'],
                            color: Colors.black87,
                            strokeColor: Colors.black87,
                            strokeWidth: 0.5,
                            letterSpacing: 0.5,
                            fontSize: services.getSize(42),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black87,
                          size: services.getSize(60),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
