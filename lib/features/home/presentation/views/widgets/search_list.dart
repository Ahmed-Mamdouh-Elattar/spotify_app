import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/helper/check_if_new_record_and_load_it.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/features/home/presentation/managers/search_cubit/search_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/record_view.dart';
import 'package:spotify_app/features/home/presentation/views/widgets/profile_view_body_item.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSucceeded) {
          return ListView.builder(
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              return MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  checkIfNewRecordAndLoadIt(state.records[index], context);
                  AppNavigation.push(
                    context: context,
                    view: RecordView(
                      record: state.records[index],
                    ),
                  );
                },
                child: ProfileViewBodyItem(
                  recordModel: state.records[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
