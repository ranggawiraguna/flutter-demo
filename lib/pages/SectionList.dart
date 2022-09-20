import 'package:flutter/material.dart';
import 'package:flutter_demo/others/values.dart';
import 'package:flutter_demo/others/services.dart';
import 'package:flutter_demo/pages/ContentList.dart';
import 'package:flutter_demo/widgets/CardInfo.dart';
import 'package:flutter_demo/widgets/PageContainer.dart';

class SectionList extends StatefulWidget {
  const SectionList({Key? key}) : super(key: key);

  @override
  State<SectionList> createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  late final Services services;

  @override
  void initState() {
    services = Services(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Material Section",
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(bottom: services.getSize(50)),
        child: Column(
          children: [
            Container(
              width: services.getWidth(),
              padding: EdgeInsets.only(
                top: services.getSize(70),
                bottom: services.getSize(30),
                left: services.getSize(50),
                right: services.getSize(50),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CardInfo(
                      title: "Section\nAmount",
                      count: content.length,
                    ),
                  ),
                  SizedBox(width: services.getSize(25)),
                  Expanded(
                    child: CardInfo(
                      title: "Content\nAmount",
                      count: content
                          .map((e) =>
                              (e['list'] as List<Map<String, dynamic>>).length)
                          .reduce((value, element) => value + element),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: services.getSize(40),
                horizontal: services.getSize(60),
              ),
              itemCount: content.length,
              itemBuilder: (context, index) {
                void onClick() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContentList(
                        title: content[index]['title'],
                        color: content[index]['color'],
                        list: content[index]['list'],
                      ),
                    ),
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: services.getSize(20)),
                  child: SizedBox(
                    width: double.infinity,
                    height: services.getSize(150),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: onClick,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: content[index]['color'],
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            fixedSize: Size(
                              services.getSize(150),
                              services.getSize(150),
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Icon(
                            content[index]['icon'],
                            shadows: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.black.withOpacity(0.5),
                              )
                            ],
                            size: services.getSize(80),
                          ),
                        ),
                        SizedBox(width: services.getSize(30)),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: services.getSize(40),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 3,
                                        color: Colors.grey.withOpacity(0.1),
                                      )
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: onClick,
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        content[index]['title'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Folks',
                                          fontSize: services.getSize(42),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: onClick,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: content[index]['color'],
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              services.getSize(40))),
                                    ),
                                    fixedSize: Size(
                                      services.getSize(80),
                                      services.getSize(80),
                                    ),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    size: services.getSize(60),
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.black.withOpacity(0.5),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
