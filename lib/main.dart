import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = ScrollController();
  IconData _currentIcon = Icons.list;
  double screenHeight = 0;

  void _scrollToList() {
    _scrollController.animateTo(
      _currentIcon == Icons.list
          ? _scrollController.position.maxScrollExtent
          : 0,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double scrollThreshold = screenHeight / 2;
    if (_scrollController.offset >= scrollThreshold &&
        _currentIcon != Icons.map) {
      setState(() => _currentIcon = Icons.map);
    } else if (_scrollController.offset < scrollThreshold &&
        _currentIcon != Icons.list) {
      setState(() => _currentIcon = Icons.list);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // Get the height of the screen
    screenHeight = screenSize.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Sidebar'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.network(
                        'https://pbs.twimg.com/media/GFRq6WOWIAAjQS3?format=jpg&name=medium',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: screenHeight,
                      ),
                    ),
                    Container(
                      height: screenHeight,
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) => ListTile(
                          title: Text('Item $index'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Material(
                elevation: 4.0, // Add elevation for shadow
                borderRadius: BorderRadius.circular(
                    10), // Optional: if you want rounded corners
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: AppBar(
                    title: Text("My App"),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      AnimatedSwitcher(
                          duration: Duration(
                              milliseconds: 500), // مدت زمان انیمیشن فید
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation,
                                child: child); // انیمیشن فید
                          },
                          child: IconButton(
                            key: ValueKey(
                                _currentIcon), // کلید منحصر به فرد برای هر آیکن
                            icon: Icon(_currentIcon),
                            onPressed: () {
                              _scrollToList();
                            },
                          )),
                      IconButton(
                        icon: Icon(Icons.notifications_none),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
