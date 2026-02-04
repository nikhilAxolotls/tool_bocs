import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tool_bocs/features/chat/model/chat_model.dart';
import 'package:tool_bocs/util/colors.dart';
import 'package:tool_bocs/util/font_family.dart';
import 'package:tool_bocs/core/widgets/user_review_dialog.dart';

class DummyChatScreen extends StatefulWidget {
  const DummyChatScreen({super.key});

  @override
  State<DummyChatScreen> createState() => _DummyChatScreenState();
}

class _DummyChatScreenState extends State<DummyChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final String currentUserId = "user_1";
  final String otherUserId = "driver_1";

  final List<MessageModel> _messages = [
    MessageModel(
      senderId: "driver_1",
      text: "Hey there! 👋",
      createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    MessageModel(
      senderId: "driver_1",
      text:
          "This is your delivery driver from Speedy Chow. I'm just around the corner from your place. 😊",
      createdAt: DateTime.now().subtract(const Duration(minutes: 14)),
    ),
    MessageModel(
      senderId: "user_1",
      text: "Hi!",
      createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
      isRead: true,
    ),
    MessageModel(
      senderId: "user_1",
      text:
          "Awesome, thanks for letting me know! Can't wait for my delivery. 🎉",
      createdAt: DateTime.now().subtract(const Duration(minutes: 11)),
      isRead: true,
    ),
    MessageModel(
      senderId: "driver_1",
      text: "No problem at all! I'll be there in about 15 minutes.",
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    MessageModel(
      senderId: "driver_1",
      text: "I'll text you when I arrive.",
      createdAt: DateTime.now().subtract(const Duration(minutes: 9)),
    ),
    MessageModel(
      senderId: "user_1",
      text: "Great! 😊",
      createdAt: DateTime.now().subtract(const Duration(minutes: 8)),
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final msg = _messages[i];
                return _buildMessageBubble(msg);
              },
            ),
          ),
          _buildInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 22.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 16.w),
          icon: const Icon(Icons.more_vert),
          color: blackColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const UserReviewDialog(),
            );
          },
        ),
      ],
      centerTitle: true,
      title: Text(
        'Message',
        style: TextStyle(
          color: blackColor,
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
                backgroundImage: const AssetImage('assets/profile3.png'),
              ),
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
                      ),
                    ),
                    Text(
                      '(+44) 50 9285 3022',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.sp,
                        fontFamily: FontFamily.openSans,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.videocam_outlined, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.phone_outlined, color: Colors.black),
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
          color: isMe ? const Color(0xFF1D5CBB) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              msg.text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: isMe ? Colors.white70 : Colors.grey.shade400,
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

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file, color: appColor, size: 28),
            onPressed: _showAttachmentMenu,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
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
            decoration: BoxDecoration(
              color: appColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 20),
              onPressed: () {
                if (_messageController.text.isEmpty) return;

                setState(() {
                  _messages.add(
                    MessageModel(
                      senderId: currentUserId,
                      text: _messageController.text,
                      createdAt: DateTime.now(),
                      isRead: false,
                    ),
                  );
                });

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
          color: Colors.white,
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
