import 'package:flutter/material.dart';
import 'package:flutter_learning/shared/styles/colors.dart';
import 'package:flutter_learning/shared/styles/icon_broken.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const Image(
                    width: double.infinity,
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1649682025~exp=1649682625~hmac=c65a912c0f5c188993b4580551d0186e9ab18b83cad5b8f8402310c97d43b23c&w=740'),
                    fit: BoxFit.cover,
                    height: 200.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Communicate with firends',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                ],
              ),
            ),
            // Card(
            //   elevation: 10.0,
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       children: [
            //         // user photo with date
            //         Row(
            //           children: [
            //             const CircleAvatar(
            //               radius: 25.0,
            //               backgroundImage: NetworkImage(
            //                   'https://scontent.faly8-2.fna.fbcdn.net/v/t39.30808-6/275243662_5158194894204502_209307285870367149_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeE6Hn5TJF8FUfBanJm_YLxZxPMmJHcTYavE8yYkdxNhqxqok0p0Qe8cH8vwzgffzUZLmFlzvYIjDSagwKPKzkOB&_nc_ohc=oDUOLSKFGcwAX9b7Um2&_nc_ht=scontent.faly8-2.fna&oh=00_AT9zhfS78q06Rm595EhJ-MKBV3vJbdY-u99VeyzyLOUfOA&oe=625936B0'),
            //             ),
            //             const SizedBox(
            //               width: 15.0,
            //             ),
            //             Expanded(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Row(
            //                     children: const [
            //                       Text(
            //                         'Mostafa Mahmoud',
            //                         style: TextStyle(height: 1.4),
            //                       ),
            //                       SizedBox(
            //                         width: 5.0,
            //                       ),
            //                       Icon(
            //                         Icons.check_circle,
            //                         color: defaultColor,
            //                         size: 16.0,
            //                       )
            //                     ],
            //                   ),
            //                   Text('January 25, 2022 at 11:00 pm',
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .caption!
            //                           .copyWith(height: 1.4)),
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(
            //               width: 15.0,
            //             ),
            //             IconButton(
            //                 onPressed: () {},
            //                 icon: const Icon(
            //                   Icons.more_horiz,
            //                   size: 16.0,
            //                 )),
            //           ],
            //         ),
            //         // Divider
            //         Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 15.0),
            //           child: Container(
            //             width: double.infinity,
            //             height: 1.0,
            //             color: Colors.grey[300],
            //           ),
            //         ),
            //         // User Text post
            //         Text(
            //           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that. like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.',
            //           style: Theme.of(context).textTheme.subtitle1,
            //         ),
            //         //hashTag
            //         Container(
            //           padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
            //           width: double.infinity,
            //           child: Wrap(children: [
            //             SizedBox(
            //               height: 25,
            //               child: MaterialButton(
            //                 minWidth: 1.0,
            //                 padding: EdgeInsets.zero,
            //                 onPressed: () {},
            //                 child: Text(
            //                   '#flutter',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .caption!
            //                       .copyWith(color: defaultColor),
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               height: 25,
            //               child: MaterialButton(
            //                 minWidth: 1.0,
            //                 padding: EdgeInsets.zero,
            //                 onPressed: () {},
            //                 child: Text(
            //                   '#flutter',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .caption!
            //                       .copyWith(color: defaultColor),
            //                 ),
            //               ),
            //             ),
            //           ]),
            //         ),
            //         //user photo post
            //         Container(
            //           height: 140.0,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(4.0),
            //             image: const DecorationImage(
            //               image: NetworkImage(
            //                   'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1649682025~exp=1649682625~hmac=c65a912c0f5c188993b4580551d0186e9ab18b83cad5b8f8402310c97d43b23c&w=740'),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         // user likes & comments count
            //         Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 5.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               // user likes
            //               Expanded(
            //                 child: InkWell(
            //                   onTap: () {},
            //                   child: Padding(
            //                     padding:
            //                         const EdgeInsets.symmetric(vertical: 5.0),
            //                     child: Row(
            //                       children: [
            //                         const Icon(
            //                           IconBroken.heart,
            //                           size: 16.0,
            //                           color: Colors.red,
            //                         ),
            //                         const SizedBox(
            //                           width: 5.0,
            //                         ),
            //                         Text(
            //                           '120',
            //                           style:
            //                               Theme.of(context).textTheme.caption,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               // user comments
            //               Expanded(
            //                 child: InkWell(
            //                   onTap: () {},
            //                   child: Padding(
            //                     padding:
            //                         const EdgeInsets.symmetric(vertical: 5.0),
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         const Icon(
            //                           IconBroken.chat,
            //                           size: 16.0,
            //                           color: Colors.amber,
            //                         ),
            //                         const SizedBox(
            //                           width: 5.0,
            //                         ),
            //                         Text(
            //                           '120',
            //                           style:
            //                               Theme.of(context).textTheme.caption,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         //Divider
            //         Padding(
            //           padding: const EdgeInsets.only(bottom: 10.0),
            //           child: Container(
            //             width: double.infinity,
            //             height: 1.0,
            //             color: Colors.grey[300],
            //           ),
            //         ),
            //         Row(
            //           children: [
            //             //write a comment
            //             Expanded(
            //               child: InkWell(
            //                 onTap: () {},
            //                 child: Row(
            //                   children: [
            //                     const CircleAvatar(
            //                       radius: 18.0,
            //                       backgroundImage: NetworkImage(
            //                           'https://scontent.faly8-2.fna.fbcdn.net/v/t39.30808-6/275243662_5158194894204502_209307285870367149_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeE6Hn5TJF8FUfBanJm_YLxZxPMmJHcTYavE8yYkdxNhqxqok0p0Qe8cH8vwzgffzUZLmFlzvYIjDSagwKPKzkOB&_nc_ohc=oDUOLSKFGcwAX9b7Um2&_nc_ht=scontent.faly8-2.fna&oh=00_AT9zhfS78q06Rm595EhJ-MKBV3vJbdY-u99VeyzyLOUfOA&oe=625936B0'),
            //                     ),
            //                     const SizedBox(
            //                       width: 15.0,
            //                     ),
            //                     Text('write a comment',
            //                         style: Theme.of(context).textTheme.caption),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             InkWell(
            //               onTap: () {},
            //               child: Row(
            //                 children: [
            //                   const Icon(
            //                     IconBroken.heart,
            //                     size: 16.0,
            //                     color: Colors.red,
            //                   ),
            //                   const SizedBox(
            //                     width: 5.0,
            //                   ),
            //                   Text(
            //                     'Like',
            //                     style: Theme.of(context).textTheme.caption,
            //                   )
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(
            //               width: 10.0,
            //             ),
            //             InkWell(
            //               onTap: () {},
            //               child: Row(
            //                 children: [
            //                   const Icon(
            //                     Icons.share_outlined,
            //                     size: 16.0,
            //                     color: Colors.red,
            //                   ),
            //                   const SizedBox(
            //                     width: 5.0,
            //                   ),
            //                   Text(
            //                     'share',
            //                     style: Theme.of(context).textTheme.caption,
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
              return buildPostItem(context);
            }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8.0,),),
            const SizedBox(
              height: 8.0,
            )
          ],
        ),
      ),
    );
  }
  Widget buildPostItem(context )=> Card(
    elevation: 5.0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // user photo with date
          Row(
            children: [
              const CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly8-2.fna.fbcdn.net/v/t39.30808-6/275243662_5158194894204502_209307285870367149_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeE6Hn5TJF8FUfBanJm_YLxZxPMmJHcTYavE8yYkdxNhqxqok0p0Qe8cH8vwzgffzUZLmFlzvYIjDSagwKPKzkOB&_nc_ohc=oDUOLSKFGcwAX9b7Um2&_nc_ht=scontent.faly8-2.fna&oh=00_AT9zhfS78q06Rm595EhJ-MKBV3vJbdY-u99VeyzyLOUfOA&oe=625936B0'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Mostafa Mahmoud',
                          style: TextStyle(height: 1.4),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 16.0,
                        )
                      ],
                    ),
                    Text('January 25, 2022 at 11:00 pm',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.4)),
                  ],
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 16.0,
                  )),
            ],
          ),
          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          // User Text post
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that. like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          //hashTag
          Container(
            padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
            width: double.infinity,
            child: Wrap(children: [
              SizedBox(
                height: 25,
                child: MaterialButton(
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    '#flutter',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: defaultColor),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                child: MaterialButton(
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    '#flutter',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: defaultColor),
                  ),
                ),
              ),
            ]),
          ),
          //user photo post
          Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1649682025~exp=1649682625~hmac=c65a912c0f5c188993b4580551d0186e9ab18b83cad5b8f8402310c97d43b23c&w=740'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // user likes & comments count
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // user likes
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          const Icon(
                            IconBroken.heart,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '120',
                            style:
                            Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // user comments
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            IconBroken.chat,
                            size: 16.0,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '120',
                            style:
                            Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Divider
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              //write a comment
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                            'https://scontent.faly8-2.fna.fbcdn.net/v/t39.30808-6/275243662_5158194894204502_209307285870367149_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeE6Hn5TJF8FUfBanJm_YLxZxPMmJHcTYavE8yYkdxNhqxqok0p0Qe8cH8vwzgffzUZLmFlzvYIjDSagwKPKzkOB&_nc_ohc=oDUOLSKFGcwAX9b7Um2&_nc_ht=scontent.faly8-2.fna&oh=00_AT9zhfS78q06Rm595EhJ-MKBV3vJbdY-u99VeyzyLOUfOA&oe=625936B0'),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text('write a comment',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      IconBroken.heart,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.share_outlined,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'share',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
