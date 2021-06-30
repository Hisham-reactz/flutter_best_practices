import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height(BuildContext context, double height) =>
        context.heightPct(height);
    double width(BuildContext context, double width) => context.widthPct(width);
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: const Color(0xFF1A3B68),
                    height: height(context, .10),
                    child: Padding(
                        padding: EdgeInsets.only(left: width(context, .01)),
                        child: ListTile(
                          title: const Text(
                            'Leading',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Upcoming Auctions',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: context.diagonalInches * 3),
                          ),
                          trailing: const IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        )),
                  )),
              const Padding(
                  child: SizedBox.shrink(), padding: EdgeInsets.all(0))
            ] +
            ['A', 'B', 'C', 'D']
                .map<Padding>((e) => Padding(
                      padding: const EdgeInsets.all(13),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Product Name'),
                              subtitle: Text('Subtitle'),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/gadgets.png',
                                  height: height(context, .15),
                                ),
                                SizedBox(width: width(context, .1)),
                                RichText(
                                  maxLines: 5,
                                  text: TextSpan(
                                    text: 'Top Auction ',
                                    style: TextStyle(
                                        fontSize: context.diagonalPx / 60,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '\n\$2000\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: context.diagonalPx / 30,
                                              color: const Color(0xFF48A7F3))),
                                      const TextSpan(
                                          text: 'Time:30 ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const TextSpan(text: 'min left'),
                                    ],
                                  ),
                                ),
                                SizedBox(width: width(context, .01)),
                              ],
                            ),
                            const Divider(),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Auction ID ',
                                    style: TextStyle(
                                        fontSize: context.diagonalPx / 60,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '\n59642',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'No. Auctions ',
                                    style: TextStyle(
                                        fontSize: context.diagonalPx / 60,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '\n569',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'MRP ',
                                    style: TextStyle(
                                        fontSize: context.diagonalPx / 60,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '\n\$ 200',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: const Text('WATCH'),
                                  onPressed: () {/* ... */},
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: const Text('BID'),
                                  onPressed: () {/* ... */},
                                ),
                                const SizedBox(width: 1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList());
  }
}
