import 'package:flutter/material.dart';

class MyAsyncButton<T> extends StatefulWidget {
  const MyAsyncButton({super.key, required this.child, this.onPressed});

  final Widget child;
  final Future<T> Function()? onPressed;

  @override
  State<MyAsyncButton> createState() => _MyAsyncButtonState();
}

class _MyAsyncButtonState extends State<MyAsyncButton> {
  bool _isLoading = false;

  Future<void> _onPressed() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await widget.onPressed?.call();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: _isLoading
          ? const CircularProgressIndicator.adaptive()
          : widget.child,
    );
  }
}
