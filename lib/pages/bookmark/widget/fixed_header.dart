import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../common/redux/states/theme_state.dart';
import '../../../common/redux/store/index.dart';

class FixedHeader extends StatelessWidget {
    const FixedHeader({super.key});

    @override
    Widget build(BuildContext context) {
        return SliverPersistentHeader(
            pinned: true,
            delegate: FixedHeaderDelegate(
                height: MediaQuery.of(context).padding.top
            )
        );
    }
}

class FixedHeaderDelegate extends SliverPersistentHeaderDelegate {

    double height;

    FixedHeaderDelegate({
        required this.height
    });

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
        return StoreProvider(
            store: store,
            child: StoreBuilder<ThemeState>(
                builder: (BuildContext context, Store<ThemeState> store){
                    return Container(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
                        height: MediaQuery.of(context).padding.top,
                    );
                }
            )
        );
    }

    @override
    // TODO: implement maxExtent
    double get maxExtent => height;

    @override
    // TODO: implement minExtent
    double get minExtent => height;

    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
        return false;
    }
}