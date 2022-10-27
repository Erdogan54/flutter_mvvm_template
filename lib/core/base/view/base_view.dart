import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewmodel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const BaseView({super.key, required this.viewmodel,required this.onModelReady, this.onDispose, required this.onPageBuilder});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
   
    widget.onModelReady(widget.viewmodel);
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewmodel);
  }
}


