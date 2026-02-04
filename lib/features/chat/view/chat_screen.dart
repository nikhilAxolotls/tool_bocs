import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tool_bocs/features/chat/model/chat_model.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final String chatId = "demo_chat_id";
  final String currentUserId = "user_1";
  late Stream<List<MessageModel>> _messageStream;

  @override
  void initState() {
    super.initState();
    _messageStream = context.read<ChatController>().getMessages(chatId);
  }

  @override
  Widget build(BuildContext context) {
    final chatController = context.read<ChatController>();

    return Scaffold(
      backgroundColor: context.scaffoldBg,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: _messageStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!;

                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  itemCount: messages.length,
                  itemBuilder: (_, i) {
                    final msg = messages[i];
                    return _buildMessageBubble(msg);
                  },
                );
              },
            ),
          ),
          _buildInput(chatController),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: context.scaffoldBg,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: IconButton(
          icon:
              Icon(Icons.arrow_back_ios, color: context.textColor, size: 22.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Message',
        style: TextStyle(
          color: context.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          fontFamily: FontFamily.openSans,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Padding(
          padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 15.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: AssetImage('assets/profile3.png'),
              ),
              //   backgroundImage: NetworkImage(
              //       'https://i.pravatar.cc/150?img=12'), // Demo image

              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'David Wayne',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        fontFamily: FontFamily.openSans,
                        color: context.textColor,
                      ),
                    ),
                    Text(
                      '(+44) 50 9285 3022',
                      style: TextStyle(
                        color: context.subTextColor,
                        fontSize: 12.sp,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.videocam_outlined, color: context.textColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.phone_outlined, color: context.textColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel msg) {
    final bool isMe = msg.senderId == currentUserId;
    final String time = DateFormat('HH:mm').format(msg.createdAt);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF1D5CBB) : context.surfaceColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              msg.text,
              style: TextStyle(
                color: isMe ? Colors.white : context.textColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: isMe ? Colors.white70 : context.subTextColor,
                    fontSize: 10,
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 14,
                    color: msg.isRead ? Colors.lightBlueAccent : Colors.white70,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(ChatController controller) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.lightBlue, size: 28),
            onPressed: _showAttachmentMenu,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.white10
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Type a message ...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1D5CBB),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 20),
              onPressed: () {
                if (_messageController.text.isEmpty) return;

                controller.sendMessage(
                  chatId: chatId,
                  message: MessageModel(
                    senderId: currentUserId,
                    text: _messageController.text,
                    createdAt: DateTime.now(),
                  ),
                );

                _messageController.clear();
              },
            ),
          )
        ],
      ),
    );
  }

  void _showAttachmentMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            _attachmentItem(Icons.camera_alt, 'Camera', Colors.lightBlue),
            _attachmentItem(Icons.mic, 'Record', Colors.lightBlue),
            _attachmentItem(Icons.person, 'Contact', Colors.lightBlue),
            _attachmentItem(Icons.image, 'Gallery', Colors.lightBlue),
            _attachmentItem(Icons.location_on, 'My Location', Colors.lightBlue),
            _attachmentItem(
                Icons.insert_drive_file, 'Document', Colors.lightBlue),
          ],
        ),
      ),
    );
  }

  Widget _attachmentItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.textColor),
        ),
      ],
    );
  }
}
