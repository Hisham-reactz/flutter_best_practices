import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';
part 'product.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height(BuildContext context, double height) =>
        context.heightPct(height);
    double width(BuildContext context, double width) => context.widthPct(width);
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: const Color(0xFF1A3B68),
                    height: height(context, .13),
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
                                fontSize: context.diagonalPx / 35),
                          ),
                          trailing: const IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        )),
                  )),
            ] +
            ['A', 'B', 'C', 'D'].map<Widget>((e) => product(context)).toList());
  }
}
