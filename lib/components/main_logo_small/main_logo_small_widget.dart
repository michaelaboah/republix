import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'main_logo_small_model.dart';
export 'main_logo_small_model.dart';

class MainLogoSmallWidget extends StatefulWidget {
  const MainLogoSmallWidget({super.key});

  @override
  State<MainLogoSmallWidget> createState() => _MainLogoSmallWidgetState();
}

class _MainLogoSmallWidgetState extends State<MainLogoSmallWidget> {
  late MainLogoSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainLogoSmallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SvgPicture.asset(
      Theme.of(context).brightness == Brightness.dark
          ? 'assets/images/ResPublix_Logo.svg'
          : 'assets/images/ResPublix_Logo.svg',
      width: 170.0,
      height: 44.0,
      fit: BoxFit.fitWidth,
    );
  }
}
