import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedRoleText extends StatefulWidget {
  final List<String> roles;
  final TextStyle style;
  final Duration typingSpeed;
  final Duration pauseDuration;

  const AnimatedRoleText({
    super.key,
    required this.roles,
    required this.style,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.pauseDuration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedRoleText> createState() => _AnimatedRoleTextState();
}

class _AnimatedRoleTextState extends State<AnimatedRoleText> {
  int _currentRoleIndex = 0;
  String _displayedText = '';
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      setState(() {
        final String currentRole = widget.roles[_currentRoleIndex];
        if (!_isDeleting) {
          if (_displayedText.length < currentRole.length) {
            _displayedText = currentRole.substring(0, _displayedText.length + 1);
          } else {
            _timer?.cancel();
            Future.delayed(widget.pauseDuration, () {
              _isDeleting = true;
              _startAnimation();
            });
          }
        } else {
          if (_displayedText.isNotEmpty) {
            _displayedText = _displayedText.substring(0, _displayedText.length - 1);
          } else {
            _isDeleting = false;
            _currentRoleIndex = (_currentRoleIndex + 1) % widget.roles.length;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_displayedText, style: widget.style),
          Container(
            width: 2,
            height: 30,
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: widget.style.color,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}
