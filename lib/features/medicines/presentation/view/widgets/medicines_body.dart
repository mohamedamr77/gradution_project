import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_cubit.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';
import 'medicines_list_items.dart';

class MedicinesBody extends StatelessWidget {
  const MedicinesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicinesCubit, MedicinesState>(
      listener: (context, state) {
        // Implement listener if needed, or remove if not used
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomTextField(
                  hintText: "ابحث هنا ......",
                  title: "",
                  onChanged: (value) {
                    BlocProvider.of<MedicinesCubit>(context)
                        .getAllMedicines(search: value);
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
    if (state is GetAllMedicinesLoadingState) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state is GetAllMedicinesSuccessState) {
      final medications = state.medicineResponse.data?.rows ?? [];
      return medications.isEmpty
          ? const SliverToBoxAdapter(
        child: Center(child: Text('لا توجد نتائج')),
      )
          : MedicinesListItems(medications: medications);
    }

    if (state is GetAllMedicinesErrorState) {
      return SliverToBoxAdapter(
        child: Center(child: Text(state.error)),
      );
    }

    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }

}