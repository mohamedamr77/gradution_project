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
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetAllMedicinesLoadingState
            ? const Center(child: CircularProgressIndicator())
            : state is GetAllMedicinesErrorState
                ? Center(child: Text(state.error))
                : state is GetAllMedicinesSuccessState
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.04.w, vertical: 0.02.h),
                        child:  CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(child: CustomTextField(hintText: "ابحث هنا ......", title: "",
                             onChanged: (p0) {
                              BlocProvider.of<MedicinesCubit>(context).getAllMedicines(search: p0);
                             },
                            )),
                             SliverToBoxAdapter(child: SizedBox(height: 20,),),
                            MedicinesListItems(medications:state.medicineResponse.data?.rows??[],),
                          ],
                        ),
                      )
                    : const SizedBox();
      },
    );
  }
}
