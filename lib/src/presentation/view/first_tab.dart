import 'package:challenge/src/presentation/widget/first_tab/person_page.dart';
import 'package:flutter/material.dart';
import '../../core/bloc/person_bloc_interface.dart';
import '../../core/resource/data_state.dart';
import '../../domain/entity/person/persons_list_entity.dart';
import '../bloc/person_bloc.dart';
import '../widget/widget_text.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final PersonBlocInterface _blocInterface = PersonBloc();

  @override
  void initState() {
    super.initState();
    _blocInterface.initialize();
    _blocInterface.getPersonsList();
  }

  @override
  void dispose() {
    _blocInterface.dispose();
    super.dispose();
  }

  Widget _getPage(DataState<PersonsListEntity> personsList) {
    switch (personsList.type) {
      case DataStateType.success:
        return PersonPage(
          personName: personsList.data!.results.first.name,
          posterPath: personsList.data!.results.first.profilePath,
          popularity: personsList.data!.results.first.popularity,
          movies: personsList.data!.results.first.knownFor,
        );
      case DataStateType.empty:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.account_circle_outlined,
              size: 100.0,
            ),
            WidgetText(
              text: 'No persons to show',
            ),
          ],
        );
      case DataStateType.error:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 100.0,
            ),
            WidgetText(
              text: personsList.error!,
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<PersonsListEntity>>(
      stream: _blocInterface.personsListStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<DataState<PersonsListEntity>> snapshot,
      ) {
        if (snapshot.hasData) {
          return _getPage(snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
