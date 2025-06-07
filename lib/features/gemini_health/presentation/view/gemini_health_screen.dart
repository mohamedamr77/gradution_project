import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/gemini_health_cubit.dart';
import '../../data/repo/chat_repo_impl.dart';
import 'widgets/gemini_health_body.dart';

class GeminiHealthScreen extends StatelessWidget {
  static String id = 'gemini_health_screen';
  const GeminiHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeminiHealthCubit(ChatRepositoryImpl()),
      child: const _GeminiHealthView(),
    );
  }
}

class _GeminiHealthView extends StatelessWidget {
  const _GeminiHealthView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'المساعد الطبي للأطفال',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20,
            color: const Color(0xff3640CE),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<GeminiHealthCubit>().clearChat(),
          ),
        ],
      ),
      body: const GeminiHealthBody(),
    );
  }
}
