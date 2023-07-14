import 'package:flutter/material.dart';

class ClientTab extends StatefulWidget {
  const ClientTab({Key? key}) : super(key: key);

  @override
  State<ClientTab> createState() => _ClientTabState();
}

class _ClientTabState extends State<ClientTab> with SingleTickerProviderStateMixin{
  late TabController _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  // labelPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  // isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Text("Overview"),
                    Text("Profile"),
                    Text("Loans")
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("RECENT INTERACTIONS"),
                            Container(
                              width: MediaQuery.of(context).size.width * .07,
                              height: MediaQuery.of(context).size.width * .07,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2D88D8)
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .2,
                              height: MediaQuery.of(context).size.width * .068,
                              decoration: BoxDecoration(
                                  color: const Color(0x222D88D8),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Text("Tab 2"),
                  Text("Tab 3"),
                ],
              ),
            )
          ]),
    );
  }
}
