import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewmodel;
  final Function(T viewmodel) onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {super.key, required this.viewmodel, required this.onModelReady, this.onDispose, required this.onPageBuilder});

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  
  @override
  void initState() {
    super.initState();
    model = widget.viewmodel;
    widget.onModelReady(model);
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
