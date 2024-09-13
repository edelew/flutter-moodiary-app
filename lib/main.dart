import 'package:flutter/material.dart';
import 'package:moodiary/core/theme/theme.dart';
import 'package:moodiary/features/diary/diary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DiaryScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Tags Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//       ),
//       home: MyHomePage(title: 'Flutter Tags'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   List<TagModel> _tags = [];
//   TextEditingController _searchTextEditingController =
//       new TextEditingController();

//   String get _searchText => _searchTextEditingController.text.trim();

//   final List<TagModel> _tagsToSelect = [
//     TagModel(id: '1', title: 'JavaScript'),
//     TagModel(id: '2', title: 'Python'),
//     TagModel(id: '3', title: 'Java'),
//     TagModel(id: '4', title: 'PHP'),
//     TagModel(id: '5', title: 'C#'),
//     TagModel(id: '6', title: 'C++'),
//     TagModel(id: '7', title: 'Dart'),
//     TagModel(id: '8', title: 'DataFlex'),
//     TagModel(id: '9', title: 'Flutter'),
//     TagModel(id: '10', title: 'Flutter Selectable Tags'),
//     TagModel(id: '11', title: 'Android Studio developer'),
//   ];
//   refreshState(VoidCallback fn) {
//     if (mounted) setState(fn);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _searchTextEditingController.addListener(() => refreshState(() {}));
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _searchTextEditingController.dispose();
//   }

//   List<TagModel> _filterSearchResultList() {
//     if (_searchText.isEmpty) return _tagsToSelect;

//     List<TagModel> _tempList = [];
//     for (int index = 0; index < _tagsToSelect.length; index++) {
//       TagModel tagModel = _tagsToSelect[index];
//       if (tagModel.title
//           .toLowerCase()
//           .trim()
//           .contains(_searchText.toLowerCase())) {
//         _tempList.add(tagModel);
//       }
//     }

//     return _tempList;
//   }

//   _addTags(tagModel) async {
//     if (!_tags.contains(tagModel))
//       setState(() {
//         _tags.add(tagModel);
//       });
//   }

//   _removeTag(tagModel) async {
//     if (_tags.contains(tagModel)) {
//       setState(() {
//         _tags.remove(tagModel);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Tags'),
//         backgroundColor: Colors.deepOrangeAccent,
//       ),
//       body: _tagIcon(),
//     );
//   }

//   Widget _tagIcon() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           Icons.local_offer_outlined,
//           color: Colors.deepOrangeAccent,
//           size: 25.0,
//         ),
//         _tagsWidget(),
//       ],
//     );
//   }

//   _displayTagWidget() {
//     return Padding(
//         padding: const EdgeInsets.all(8.0), child: _buildSuggestionWidget());
//   }

//   Widget _buildSuggestionWidget() {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text('Suggestions'),
//       Wrap(
//         alignment: WrapAlignment.start,
//         children: _tagsToSelect
//             .where((tagModel) => !_tags.contains(tagModel))
//             .map((tagModel) => tagChip(
//                   tagModel: tagModel,
//                   onTap: () => _addTags(tagModel),
//                   action: 'Add',
//                 ))
//             .toList(),
//       ),
//     ]);
//   }

//   Widget tagChip({
//     tagModel,
//     onTap,
//     action,
//   }) {
//     return InkWell(
//         onTap: onTap,
//         child: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: 5.0,
//                 horizontal: 5.0,
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                   vertical: 10.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.deepOrangeAccent,
//                   borderRadius: BorderRadius.circular(100.0),
//                 ),
//                 child: Text(
//                   '${tagModel.title}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15.0,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 0,
//               child: CircleAvatar(
//                 backgroundColor: Colors.orange.shade600,
//                 radius: 8.0,
//                 child: Icon(
//                   Icons.clear,
//                   size: 10.0,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ));
//   }

//   Widget _tagsWidget() {
//     return Flexible(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Tags',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           _tags.length > 0
//               ? Column(children: [
//                   Wrap(
//                     alignment: WrapAlignment.start,
//                     children: _tags
//                         .map((tagModel) => tagChip(
//                               tagModel: tagModel,
//                               onTap: () => _removeTag(tagModel),
//                               action: 'Remove',
//                             ))
//                         .toSet()
//                         .toList(),
//                   ),
//                 ])
//               : Container(),
//           _displayTagWidget(),
//         ],
//       ),
//     );
//   }
// }

// class TagModel {
//   String id;
//   String title;

//   TagModel({
//     required this.id,
//     required this.title,
//   });
// }
