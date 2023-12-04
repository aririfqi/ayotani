// ignore_for_file: unused_import

import 'package:ayotani/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:ayotani/common/styles/color_scheme.dart';
import '../../../data/models/tani_pedia_models/tani_pedia.dart';

class TaniPediaListPage extends StatelessWidget {
  const TaniPediaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [primaryColor, primaryColor])),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTaniPedia',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(children: const [
                Text(
                  'Daftar Artikel',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final TaniPediaModel pediaModel = pedia[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailPediaPage(
                                taniPediaModel: pediaModel,
                              );
                            }));
                          },
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10,
                                        left: 10,
                                        top: 10,
                                        bottom: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Hero(
                                        tag: pediaModel.pictureId,
                                        child: Image.network(
                                          pediaModel.pictureId,
                                          width: 170,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 10,
                                          bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            pediaModel.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_rounded,
                                                size: 12,
                                                color: primaryColor,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(pediaModel.city),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 12,
                                                color: Colors.orange,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(pediaModel.rating),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: pedia.length,
                    ),
                  ),
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
