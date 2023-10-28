import 'package:flutter/material.dart';

class DragAndDropLists extends StatefulWidget {
  @override
  _DragAndDropListsState createState() => _DragAndDropListsState();
}

class _DragAndDropListsState extends State<DragAndDropLists> {
  List<Icon> sourceList = [
    Icon(Icons.star),
    Icon(Icons.favorite),
    Icon(Icons.send)
  ];
  List<Icon> targetList = [];

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Not in Use:'),
          // Source List
          Expanded(
            child: DragTarget<Icon>(
              onAccept: (icon) {
                setState(() {
                  sourceList.remove(icon);
                });
              },
              builder: (context, candidateData, rejectedData) {
                return SizedBox(
                  width: 150, // Set a fixed width for the ReorderableListView
                  child: IntrinsicWidth(
                    child: ReorderableListView(
                      scrollDirection: Axis.horizontal,
                      children: sourceList
                          .map((icon) => Draggable<Icon>(
                                key: ValueKey(icon),
                                child: Container(
                                  height: 100,
                                  width: 60,
                                  child: ListTile(
                                    key: ValueKey(icon),
                                    title: icon,
                                  ),
                                ),
                                feedback: Material(
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    child: ListTile(
                                      title: icon,
                                    ),
                                  ),
                                ),
                                childWhenDragging: Container(),
                                // Set a non-empty container here
                                data: icon,
                              ))
                          .toList(),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final icon = sourceList.removeAt(oldIndex);
                          sourceList.insert(newIndex, icon);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Text('In Use'),
          // Target List
          SizedBox(
            width: 150, // Set a fixed width for the ListView
            child: DragTarget<Icon>(
              onAccept: (icon) {
                setState(() {
                  targetList.add(icon);
                });
              },
              builder: (context, candidateData, rejectedData) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: targetList
                      .map((icon) => Container(
                            height: 100,
                            width: 100,
                            child: ListTile(
                              title: icon,
                              trailing: IconButton(
                                onPressed: () {
                                  targetList.remove(icon);
                                },
                                icon: Icon(Icons.delete,size:20,),
                              ),
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ],
      );
  }
}
