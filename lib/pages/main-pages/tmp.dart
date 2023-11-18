// import 'package:chess/chess.dart' as chess;
// import 'package:core_control_panel/helpers/http/http_client.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chess_board/flutter_chess_board.dart';
// import 'package:core_control_panel/constants/url.dart';

// class MyChess extends StatefulWidget {
//   const MyChess({super.key});

//   @override
//   State<MyChess> createState() => _MyChessState();
// }

// class _MyChessState extends State<MyChess> {
//   chess.Chess ch = chess.Chess();
//   ChessBoardController chessBoardController = ChessBoardController();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ChessBoard(
//         controller: chessBoardController,
//         boardColor: BoardColor.darkBrown,
//         size: 600,
//         onMove: () {
//           sendMove(chessBoardController.game.fen);
//         },
//       ),
//     );
//   }

//   sendMove(String fen) {
//     HttpClient(context).send(
//       fullUrl: "$URL_MAIN/",
//       method: "post",
//       data: {
//         "fen": fen,
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:chess/chess.dart' as chess;
import 'package:flutter_chess_board/flutter_chess_board.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8001/ws'),
  );

  chess.Chess ch = chess.Chess();
  ChessBoardController chessBoardController = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  chessBoardController.loadFen(snapshot.data);
                }
                return ChessBoard(
                  size: 400,
                  controller: chessBoardController,
                  onMove: () {
                    List<dynamic> history =
                        chessBoardController.game.getHistory();
                    for (var element in history) {
                      print(element);
                    }
                    _sendMessage();
                  },
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    _channel.sink.add(chessBoardController.getFen());
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    chessBoardController.dispose();
    super.dispose();
  }
}
