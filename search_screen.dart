import 'package:blog_bud/models/user.dart';
import 'package:blog_bud/provider/user_provider.dart';
import 'package:blog_bud/widgets/custom_full_length_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isShowUsers = false;
  bool isCrossed = false;
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Search for a user',
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        isShowUsers = false;
                      });
                    },
                  )
                : null,
          ),
          onFieldSubmitted: (String _) {
            setState(() {
              isShowUsers = true;
            });
          },
        ),
        elevation: 0,
      ),
      body: isShowUsers
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('username',
                      isGreaterThanOrEqualTo: _searchController.text)
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            (snapshot.data! as dynamic).docs[index]['photoUrl'],
                          ),
                          radius: 20,
                        ),
                        title: Text(
                          (snapshot.data! as dynamic).docs[index]['username'],
                        ),
                      );
                    });
              },
            )
          : FutureBuilder(
              future: FirebaseFirestore.instance.collection('post').get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.5,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      child: Image.network(
                        (snapshot.data as dynamic).docs[index]['postUrl'],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FullLengthPost(
                                title: (snapshot.data! as dynamic).docs[index]
                                    ['blogTitle'],
                                postUrl: (snapshot.data! as dynamic).docs[index]
                                    ['postUrl'],
                                profilepicUrl: (snapshot.data! as dynamic)
                                    .docs[index]['profileImg'],
                                username: (snapshot.data! as dynamic)
                                    .docs[index]['username'],
                                date: DateFormat.yMMMd().format(
                                  (snapshot.data! as dynamic)
                                      .docs[index]['datePublished']
                                      .toDate(),
                                ),
                                content: (snapshot.data! as dynamic).docs[index]
                                    ['blogContent'],
                                likes: (snapshot.data! as dynamic).docs[index]
                                    ['likes'],
                                postId: (snapshot.data! as dynamic).docs[index]
                                    ['postId'],
                                uid: user.uid),
                          ),
                        );
                      },
                    ),
                    itemCount: (snapshot.data as dynamic).docs.length,
                  ),
                );
              },
            ),
    );
  }
}
