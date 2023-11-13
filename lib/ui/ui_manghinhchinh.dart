import 'package:flutter/material.dart';
import 'package:flutter_study_english/model/category.dart';
import 'package:flutter_study_english/provider/provider_search.dart';
import 'package:flutter_study_english/ui/ui_question.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class mainManghinhchinh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderSearch(),
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE5F7FF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      "Choose a topic",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        onChanged: (value) {
                          Provider.of<ProviderSearch>(context, listen: false)
                              .search(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Consumer<ProviderSearch>(
                        builder: (context, provider, _) {
                          List<category> danhSachDaTimKiem =
                              provider.danhSachDaTimKiem;
                          return ListView.builder(
                            itemCount: danhSachDaTimKiem.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => uiQuestion(
                                                id_cate:
                                                    danhSachDaTimKiem[index]
                                                        .id)));
                                  },
                                  title: Text(
                                    danhSachDaTimKiem[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Color(0xFFE5F7FF),
              padding: EdgeInsets.all(10),
              child: Text(
                "TRUONG TH&THCS VINH KHUONG",
                style: TextStyle(fontSize: 10, color: Color(0xFF09569a)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
