import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_cubit.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/debouncer.dart';
import '../../../data/model/list/list_dummy_data_medicines.dart';
import 'medicines_list_items.dart';

class MedicinesBody extends StatelessWidget {
  const MedicinesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(delay: const Duration(milliseconds: 500));
    return BlocConsumer<MedicinesCubit, MedicinesState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomTextField(
                  hintText:LocaleKeys.searchHere.tr(),
                  title: "",
                  onChanged: (value) {
                    debouncer.run(() {
                      context.read<MedicinesCubit>().getAllMedicines(search: value);
                    });
                  },
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              _buildContent(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, MedicinesState state) {
    if (state is GetAllMedicinesSuccessState ||
        state is GetAllMedicinesLoadingState) {
      final medications = state is GetAllMedicinesSuccessState
          ? state.medicineResponse.data?.rows ?? []
          : listDummyDataMedicines;
      return medications.isEmpty
          ? const SliverToBoxAdapter(
              child: Center(child: Text('لا توجد نتائج')),
            )
          : SliverToBoxAdapter(
              child: Skeletonizer(
                  enabled: state is GetAllMedicinesLoadingState,
                  effect: ShimmerEffect(
                    baseColor: Colors.grey[400]!,
                    highlightColor: const Color(0xff3640CE).withOpacity(0.2), //// Primary color
                    duration: const Duration(seconds: 2),
                  ),
                  child: MedicinesListItems(medications: medications)),
            );
    }

    if (state is GetAllMedicinesErrorState) {
      return SliverToBoxAdapter(
        child: Center(child: Text(state.error)),
      );
    }

    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }
}





