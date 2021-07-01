part of 'products.dart';

Widget product(BuildContext context) => Padding(
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
                  height: context.heightPct(.15),
                ),
                SizedBox(width: context.widthPct(.1)),
                RichText(
                  maxLines: 5,
                  text: TextSpan(
                    text: 'Top Auction ',
                    style: TextStyle(
                        fontSize: context.diagonalPx / 60, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n\$2000\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.diagonalPx / 30,
                              color: const Color(0xFF48A7F3))),
                      const TextSpan(
                          text: 'Time:30 ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: 'min left'),
                    ],
                  ),
                ),
                SizedBox(width: context.widthPct(.1)),
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
                        fontSize: context.diagonalPx / 60, color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '\n59642',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'No. Auctions ',
                    style: TextStyle(
                        fontSize: context.diagonalPx / 60, color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '\n569',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'MRP ',
                    style: TextStyle(
                        fontSize: context.diagonalPx / 60, color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: '\n\$ 200',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
