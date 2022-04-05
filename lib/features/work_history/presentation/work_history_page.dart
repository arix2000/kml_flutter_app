import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kml_flutter_app/core/dependency_injection.dart';
import 'package:kml_flutter_app/core/widgets/default_scaffold.dart';
import 'package:kml_flutter_app/features/work_history/data/work_model.dart';
import 'package:kml_flutter_app/features/work_history/presentation/bloc/work_history_bloc.dart';
import 'package:kml_flutter_app/features/work_history/presentation/widgets/work_history_details_dialog.dart';
import 'package:kml_flutter_app/features/work_history/presentation/widgets/work_history_item.dart';
import 'package:kml_flutter_app/core/extensions/context_ext.dart';

class WorkHistoryPage extends StatelessWidget {
  final List<Widget> widgets = [];
  static final route = "workHistoryPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WorkHistoryBloc>(),
      child: DrawerScaffold(
        body: SampleAppPage(),
      ),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<WorkHistoryBloc, WorkHistoryState>(
        builder: (context, state) {
          if (state is InitialWorkHistoryState) {
            _fetchWorks();
          } else if (state is Loading) {
            return CircularProgressIndicator();
          } else if (state is Loaded) {
            if (state.works.isNotEmpty) {
              return Scrollbar(radius: Radius.circular(10),
                  child: ListView(children: _getListData(state.works)));
            } else {
              return Text(context.getString('no_results'));
            }
          } else if (state is Failed) {
            Fluttertoast.showToast(msg: state.message);
          }
          return SizedBox();
        },
      ),
    );
  }

  List<Widget> _getListData(List<WorkModel> works) {
    List<Widget> widgets = [];
    for (WorkModel work in works) {
      widgets.add(WorkHistoryItem(
        workData: work,
        onClick: () {
          showDialog(
              context: context,
              builder: (context) => WorkHistoryDetailsDialog(work: work));
        },
      ));
    }
    return widgets;
  }

  void _fetchWorks() {
    BlocProvider.of<WorkHistoryBloc>(context).add(DataInitEvent());
  }
}
