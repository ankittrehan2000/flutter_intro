import 'package:flutter/material.dart';
import 'quote.dart';
import 'Quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', quote: 'Live your best life'),
    Quote(author: 'James Bond', quote: 'Where there is a will there is a way'),
    Quote(author: 'Abc Person', quote: 'Be strong'),
    Quote(author: 'Xyz Person', quote: 'We will be victorious')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Great Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: (){
              setState(() {
                quotes.remove(quote);
              });
            }
        )).toList(),   //returns an iterable and hence need to be changed to a list
      )
    );
  }
}

