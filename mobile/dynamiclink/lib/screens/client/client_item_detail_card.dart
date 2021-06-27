import 'package:dynamiclink/screens/client/client_order_detail_item.dart';
import 'package:dynamiclink/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CLientItemDetailCard extends StatefulWidget {
  const CLientItemDetailCard({Key? key}) : super(key: key);

  @override
  _CLientItemDetailCardState createState() => _CLientItemDetailCardState();
}

class _CLientItemDetailCardState extends State<CLientItemDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: AppTheme.buildLightTheme(),
        child: Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Detalle del pedido',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0)),
                    SizedBox(height: 18.0),
                    Expanded(
                        child: ListView.builder(
                            itemCount: 200,
                            itemBuilder: (BuildContext context, int index) {
                              return new ClientOrderDetailItem();
                            })),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.cyan,
                      height: 50.0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.9)),
                      child: Text(
                        'Realizar Pedido',
                        style: TextStyle(
                            color: AppTheme.buildLightTheme().backgroundColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    )
                  ],
                ),
              ),
            )));
  }
}

// Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text('Detalle del pedido',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)),
//             SizedBox(height: 18.0),
//             CardItem(),
//             CardItem(),
//             CardItem(),
//             SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Total',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
//                 Text('Bs 480,00',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
//               ],
//             ),
//             SizedBox(height: 4.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Delivery charge',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
//                 Text('Bs 15,00',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
//               ],
//             ),
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('SubTotal',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
//                 Text('Bs 150,00',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
//               ],
//             ),
//             Spacer(),
//             MaterialButton(
//               onPressed: () {},
//               color: Colors.cyan,
//               height: 50.0,
//               minWidth: double.infinity,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.9)),
//               child: Text(
//                 'Realizar Pedido',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 18,
//             )
//           ],
//         ),
//       ),
// class CardItem extends StatefulWidget {
//   const CardItem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _CardItemState createState() => _CardItemState();
// }

// class _CardItemState extends State<CardItem> {
//   List _cities = [
//     "Cluj-Napoca",
//     "Bucuresti",
//     "Timisoara",
//     "Brasov",
//     "Constanta"
//   ];

//   late List<DropdownMenuItem<String>> _dropDownMenuItems;
//   late String _currentCity;

//   @override
//   void initState() {
//     _dropDownMenuItems = getDropDownMenuItems();
//     _currentCity = _dropDownMenuItems[0].value!;
//     super.initState();
//   }

//   List<DropdownMenuItem<String>> getDropDownMenuItems() {
//     List<DropdownMenuItem<String>> items = [];
//     for (String city in _cities) {
//       items.add(new DropdownMenuItem(value: city, child: new Text(city)));
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: <Widget>[
//           Container(
//             width: 80.0,
//             height: 80.0,
//             decoration: BoxDecoration(
//                 color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
//             child: Center(
//               child: Container(
//                 width: 60.0,
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(
//                             'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg')),
//                     borderRadius: BorderRadius.circular(20.0)),
//               ),
//             ),
//           ),
//           SizedBox(width: 12.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                     width: 100.0,
//                     child: Text(
//                       'Pechuga sdfdsf',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )),
//                 SizedBox(height: 8.0),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                             width: 20.0,
//                             height: 20.0,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(4.0)),
//                             child: Icon(
//                               Icons.add,
//                               color: Colors.white,
//                               size: 15.0,
//                             )),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             '1',
//                             style: TextStyle(
//                                 fontSize: 16.0, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Container(
//                             width: 20.0,
//                             height: 20.0,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue[300],
//                                 borderRadius: BorderRadius.circular(4.0)),
//                             child: Icon(
//                               Icons.add,
//                               color: Colors.white,
//                               size: 15.0,
//                             )),
//                         Spacer(),
//                         Text(
//                           '\u20b9 12,000',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       color: Colors.white,
//                       child: new Center(
//                           child: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           new Text("Please choose your city: "),
//                           new Container(
//                             padding: new EdgeInsets.all(16.0),
//                           ),
//                           new DropdownButton(
//                             value: "simple",
//                             items: _dropDownMenuItems,
//                             // onChanged: changedDropDownItem,
//                           )
//                         ],
//                       )),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );

//     void changedDropDownItem(String selectedCity) {
//       setState(() {
//         _currentCity = selectedCity;
//       });
//     }
//   }
// }
