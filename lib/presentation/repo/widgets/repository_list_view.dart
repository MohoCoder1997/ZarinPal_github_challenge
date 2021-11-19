

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_challenge/application/repo/bloc/repo_bloc.dart';
import 'package:github_challenge/domain/entities/user.dart';
import 'package:github_challenge/presentation/core/load_fail_view.dart';
import 'package:github_challenge/presentation/core/localization/app_localizations.dart';
import 'package:github_challenge/presentation/core/localization/lang/lang_keys.dart';
import 'package:github_challenge/presentation/core/size_config.dart';
import 'package:github_challenge/presentation/repo/widgets/repo_card.dart';

class RepositoryListView extends StatefulWidget {
  const RepositoryListView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  _RepositoryListViewState createState() => _RepositoryListViewState();
}

class _RepositoryListViewState extends State<RepositoryListView> {
  final _scrollController = ScrollController();
  late final _repoBloc;
  @override
  Widget build(BuildContext context) {
    _repoBloc = BlocProvider.of<RepoBloc>(context);
    return Expanded(
      child: BlocBuilder<RepoBloc, RepoState>(
        builder: (context, state) {
          if (state is RepoLoadSuccess) return _loadSuccessView(state);
          if (state is RepoLoadFailure) return _loadFailureView(state);
          if (state is RepoIsEmpty) return _dataIsEmptyView();
          return _loadInProgressView();
        },
      ),
    );
  }

  Center _loadInProgressView() => Center(child: CircularProgressIndicator());

  Center _dataIsEmptyView() => Center(
        child: Text(AppLocalizations.of(context)!.translate(LangKeys.NO_REPOSITORY)),
      );

  LoadFailureView _loadFailureView(RepoLoadFailure state) => LoadFailureView(
        message: state.fail.message ?? AppLocalizations.of(context)!.translate(LangKeys.LOAD_FAILED),
        onTapTryAgain: () {
          _repoBloc.add(RepoFetchedData(
       
          ));
        },
      );

  Container _loadSuccessView(RepoLoadSuccess state) => Container(
        width: SC.blockHorizontal * 90,
        child: NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: _calculateListItemCount(state),
            controller: _scrollController,
            itemBuilder: (context, index) {
              return index >= state.repos.length
                  ? _buildLoaderListItem(state)
                  : RepoCard(
                      item: state.repos[index],
                    );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: SC.blockHorizontal * 3,
            ),
          ),
        ),
      );

  bool _handleScrollNotification(ScrollNotification notification) {
    final _state = _repoBloc.state as RepoLoadSuccess;
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0 &&
        !_state.isEndOfPage) {
      _repoBloc.add(
        RepoFetchedNextPage(
       
        ),
      );
    }

    return false;
  }

  int _calculateListItemCount(RepoLoadSuccess state) {
    if (state.isEndOfPage) {
      return state.repos.length;
    } else {
      return state.repos.length + 1;
    }
  }

  Widget _buildLoaderListItem(RepoLoadSuccess state) {
    return state.fail == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          )
        : LoadFailureView(
            message: state.fail!.message ?? AppLocalizations.of(context)!.translate(LangKeys.LOAD_FAILED),
            onTapTryAgain: () {
              _repoBloc
                  .add(RepoFetchedNextPage());
            },
          );
  }
}

