import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:newsline_app/common/modal/user_modal.dart';
import '../modal/new_modal.dart';
import '../modal/type_modal.dart';

final List<News> newsList = [
    News(
        id: mock.guid(),
        title: 'Unmasking the Truth: Investigative Report Exposes Widespread Political Corruption',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/Rectangle.png',
        authorInfo: userList[0]
    ),
    News(
        id: mock.guid(),
        title: 'Breaking News: Political Agreement Reached, Aims to Reshape the Nation',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/premium_photo-1661604042122-2851 1.png',
        authorInfo: userList[1]
    ),
    News(
        id: mock.guid(),
        title: 'Artificial Intelligence Revolution: How AI is Shaping Our Lives',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/premium_photo-1683121426841-a2d6 1.png',
        authorInfo: userList[2]
    ),
    News(
        id: mock.guid(),
        title: 'Unleashing Entrepreneurial Spirit: Inspiring Stories of Startup Success',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/neom-4AADxUsnufQ-unsplash 1.png',
        authorInfo: userList[3]
    ),
    News(
        id: mock.guid(),
        title: 'Athletic Legends: Inspiring Stories of Triumph and Perseverance',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/richard-stachmann-eVhh7cI4A04-unsplash 1.png',
        authorInfo: userList[4]
    ),
    News(
        id: mock.guid(),
        title: 'Revolutionizing the Future: Breakthrough Technology Set to Transform Industries',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/richard-stachmann-GgmZ23grWNY-unsplash 1.png',
        authorInfo: userList[5]
    ),
    News(
        id: mock.guid(),
        title: 'Economic Boom on the Horizon: Experts Predict Record Growth in Key Sectors',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/chinh-le-duc-VGaXLW6axSQ-unsplash 1.png',
        authorInfo: userList[6]
    ),
    News(
        id: mock.guid(),
        title: 'Breakthrough Discovery: Promising Treatment Shows Potential in Cancer Battle',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/chris-lawton-vBA-JNHAraI-unsplash 1.png',
        authorInfo: userList[7]
    ),
    News(
        id: mock.guid(),
        title: 'Innovation Unleashed: Groundbreaking Tech Unveiled at Global Summit',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/john-thomas-LtE6W_JVTGc-unsplash 1.png',
        authorInfo: userList[8]
    ),
    News(
        id: mock.guid(),
        title: 'Runway Extravaganza: Highlights from the Latest Fashion Week',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/leon-elldot-C8Q_zR8PDlA-unsplash 1.png',
        authorInfo: userList[9]
    ),
    News(
        id: mock.guid(),
        title: 'Breaking: Explosive Political Scandal Sends Shockwaves Through the Nation',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/leon-elldot-C8Q_zR8PDlA-unsplash 1.png',
        authorInfo: userList[10]
    ),
    News(
        id: mock.guid(),
        title: 'Power Play Unveiled: Inside the Intricate Strategies of Political Titans',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/joseph-sharp-w0oooJfpIy0-unsplash 1.png',
        authorInfo: userList[11]
    ),
    News(
        id: mock.guid(),
        title: 'Game-Changing Reforms Proposed: Political Leader Aims to Redefine the Future',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/benoit-debaix-c-HGZNddplw-unsplash 1.png',
        authorInfo: userList[12]
    ),
    News(
        id: mock.guid(),
        title: 'Exclusive: Insider Insights Expose the Hidden Agendas of Political Powerhouses',
        status: 1,
        visitsNum: mock.integer(min: 100, max: 500000),
        reviewNum: mock.integer(min: 100, max: 500000),
        creation: mock.dateTime(start: DateTime(2023), end: DateTime.now()),
        cover: 'static/news/ehimetalor-akhere-unuabona-DFDY2xIog1g-unsplash 1.png',
        authorInfo: userList[0]
    )
];

final List<User> userList = [
    User(
        official: 1,
        id: mock.guid(),
        code: 'bbcnews',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse.png',
        nickName: 'BBC News',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'cbsnews',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (2).png',
        nickName: 'CBS News',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        id: mock.guid(),
        code: 'edgar_t',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse 213.png',
        nickName: 'Edgar T.',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        id: mock.guid(),
        code: 'jenny_wilson',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (1).png',
        nickName: 'Jenny Wilson',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'cnnnews',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (3).png',
        nickName: 'CNN News',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        id: mock.guid(),
        code: 'rodolfo_goode',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (4).png',
        nickName: 'Rodolfo Goode',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'usatoday',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (5).png',
        nickName: 'USA Today',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        id: mock.guid(),
        code: 'roselle_ehrman',
        email: mock.email(),
        portrait: 'static/portrait/Type=Default, Component=Avatar.png',
        nickName: 'Roselle Ehrman',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'nbcnews',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (6).png',
        nickName: 'NBC News',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        id: mock.guid(),
        code: 'krishna_barbe',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (7).png',
        nickName: 'Krishna Barbe',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'fox_news',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (11).png',
        nickName: 'Fox News',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'abc_news',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (9).png',
        nickName: 'ABC News',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
    User(
        official: 1,
        id: mock.guid(),
        code: 'the_new_york_times',
        email: mock.email(),
        portrait: 'static/portrait/Ellipse (10).png',
        nickName: 'The New York Times',
        phone: '${mock.integer(min: 13000000000, max: 19000000000)}',
        birthday: mock.dateTime(start: DateTime(1930), end: DateTime(2000)),
        following: mock.pick([0 ,1])
    ),
];

final List<NewsType> typeList = [
    NewsType(
        title: '政治',
        id: mock.guid(),
    ),
    NewsType(
        title: '科技',
        id: mock.guid(),
    ),
    NewsType(
        title: '商业',
        id: mock.guid(),
    ),
    NewsType(
        title: '经济',
        id: mock.guid(),
    ),
    NewsType(
        title: '军事',
        id: mock.guid(),
    ),
    NewsType(
        title: '体育',
        id: mock.guid(),
    )
];