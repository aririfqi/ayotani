import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ayotani/common/styles/color_scheme.dart';
import 'package:ayotani/common/utils/enum_state.dart';
import 'package:ayotani/common/utils/routes.dart';
import 'package:ayotani/presentation/providers/user_notifiers/user_firestore_notifiers/user_data_notifier.dart';
import 'package:ayotani/presentation/widgets/custom_network_image.dart';
import 'package:ayotani/presentation/widgets/loading_indicator.dart';

import '../../../data/models/tani_pedia_models/tani_pedia.dart';
import '../../widgets/icon_menu.dart';
import '../tani_pedia/detail_pedia_screen.dart';

class HomePage extends StatefulWidget {
  final String uid;
  final PageController pageController;

  const HomePage({
    Key? key,
    required this.uid,
    required this.pageController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<UserDataNotifier>(context, listen: false)
          .readUserData(widget.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<UserDataNotifier>(
        builder: (context, result, child) {
          if (result.state == UserState.success) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _buildHeaderHomePage(context, result),
                _buildContentHomePage(context),
              ],
            );
          }

          return Container(
            color: primaryBackgroundColor,
            child: const LoadingIndicator(),
          );
        },
      ),
    );
  }

  Stack _buildHeaderHomePage(
    BuildContext context,
    UserDataNotifier userDataNotifier,
  ) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      clipBehavior: Clip.none,
      children: <Widget>[
        SvgPicture.asset(
          'assets/svg/header_background.svg',
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: userDataNotifier.userData.imgUrl.isEmpty
                            ? Image.asset(
                                'assets/img/default_user_pict.png',
                                fit: BoxFit.cover,
                              )
                            : CustomNetworkImage(
                                imgUrl: userDataNotifier.userData.imgUrl,
                                fit: BoxFit.cover,
                                placeHolderSize: 30,
                                errorIcon: Icons.person_off_rounded,
                              ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Hai, ${userDataNotifier.userData.name}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: primaryBackgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Selamat Datang',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: primaryBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pushNamed(context, profileRoute),
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: primaryBackgroundColor,
                    ),
                    tooltip: 'Settings',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _buildContentHomePage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 132),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        color: scaffoldBackgroundColor,
      ),
      clipBehavior: Clip.hardEdge,
      child: RefreshIndicator(
        onRefresh: () {
          return Future.microtask(() {
            context.read<UserDataNotifier>().readUserData(
                  widget.uid,
                  refresh: true,
                );
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 24),
              _buildCardNutriTime(context),
              const SizedBox(height: 15),
              _buildCardSummary(context),
              const SizedBox(height: 15),
              _buildCardSummaryPedia(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCardSummary(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Consumer(
          builder: (context, result, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Apa yang kamu butuhkan ?',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconMenu(
                            path: 'assets/icons/tanya-tani.png',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                coomingSoonPage,
                              );
                            },
                          ),
                          IconMenu(
                            path: 'assets/icons/tani-pedia.png',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                listTaniPedia,
                              );
                            },
                          ),
                          IconMenu(
                            path: 'assets/icons/tani-invest.png',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                coomingSoonPage,
                              );
                            },
                          ),
                          IconMenu(
                            path: 'assets/icons/tani-trend.png',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                coomingSoonPage,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildCardSummaryPedia(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Consumer(
          builder: (context, result, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Artikel Terbaru untukmu',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 40)),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, listTaniPedia),
                      child: Text(
                        'Lihat Semua',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: primaryColor,
                              letterSpacing: 0.5,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
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
                          itemCount: pedia.length - 3,
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
            );
          },
        ),
      ),
    );
  }

  Container _buildCardNutriTime(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 200,
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/img/slide1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
          ),
          SizedBox(
            width: 300,
            height: 200,
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/img/slide2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
          ),
          SizedBox(
            width: 300,
            height: 200,
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/img/slide3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
