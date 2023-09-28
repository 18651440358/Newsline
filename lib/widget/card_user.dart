import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/modal/user_modal.dart';
import 'follow_button.dart';

class UserCard extends StatefulWidget {
    final User user;
    const UserCard({
        super.key,
        required this.user
    });

    @override
    UserCardState createState() => UserCardState();
}

class UserCardState extends State<UserCard> {

    // 渲染头像
    Widget handleRenderPortrait(){
        return Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(72.w),
                color: const Color(0xFFD9D9D9)
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
                widget.user.portrait ?? 'Error',
                width: 72.w,
                height: 72.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                        'static/portrait/portrait.png',
                        width: 72.w,
                        height: 72.w,
                        fit: BoxFit.cover,
                    );
                },
            ),
        );
    }

    // 渲染昵称
    Widget handleRenderNickName() {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            child: Center(
                child: Text(
                    '${widget.user.nickName}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            child: Container(
                width: 90.w,
                color: Colors.transparent,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        handleRenderPortrait(),
                        handleRenderNickName(),
                        FollowButton(
                            following: widget.user.following ?? 0,
                            onTap: () {},
                        )
                    ],
                ),
            ),
        );
    }
}