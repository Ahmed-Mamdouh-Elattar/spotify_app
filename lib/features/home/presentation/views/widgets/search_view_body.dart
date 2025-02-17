import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/features/home/presentation/managers/general_data_cubit/home_view_cubit.dart';
import 'package:spotify_app/features/home/presentation/managers/search_cubit/search_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/search_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var records = BlocProvider.of<GeneralDataCubit>(context).records;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (recordTitle) {
              BlocProvider.of<SearchCubit>(context)
                  .searchRecords(recordTitle: recordTitle, records: records);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SearchList()),
        ],
      ),
    );
  }
}
