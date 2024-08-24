import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomTabScreen(),
    );
  }
}

class CustomTabScreen extends StatelessWidget {
  const CustomTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Tab Layout'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TabContainer(
              color: Theme.of(context).colorScheme.secondary,
              tabEdge: TabEdge.right,
              childPadding: const EdgeInsets.all(20.0),
              tabs: _getTabs3(context),
              children: _getChildren3(context),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _getTabs3(BuildContext context) => <Widget>[
      const Icon(
        Icons.info,
      ),
      const Icon(
        Icons.text_snippet,
      ),
      const Icon(
        Icons.person,
      ),
      const Icon(
        Icons.settings,
      ),
    ];

List<Widget> _getChildren3(BuildContext context) => <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Info', style: Theme.of(context).textTheme.headlineSmall),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non ex ac metus facilisis pulvinar. In id nulla tellus. Donec vehicula iaculis lacinia. Fusce tincidunt viverra nisi non ultrices. Donec accumsan metus sed purus ullamcorper tincidunt. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Documents', style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(flex: 2),
          const Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Divider(thickness: 1),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('Document 1'),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('Document 2'),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text('Document 3'),
                ),
                Divider(thickness: 1),
              ],
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(flex: 3),
          const Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('username:'),
                      Text('email:'),
                      Text('birthday:'),
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('John Doe'),
                      Text('john.doe@email.com'),
                      Text('1/1/1985'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Settings', style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SwitchListTile(
                  title: const Text('Darkmode'),
                  value: false,
                  onChanged: (v) {},
                  secondary: const Icon(Icons.nightlight_outlined),
                ),
                SwitchListTile(
                  title: const Text('Analytics'),
                  value: false,
                  onChanged: (v) {},
                  secondary: const Icon(Icons.analytics),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
