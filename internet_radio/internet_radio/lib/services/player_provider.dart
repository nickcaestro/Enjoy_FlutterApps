import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:internet_radio/models/radio.dart';
import 'package:internet_radio/services/db_download_service.dart';
import 'package:internet_radio/utils/db_service.dart';

enum RadioPlayerState { LOADING, STOPPED, PLAYING, PAUSED, COMPLETED }

class PlayerProvider with ChangeNotifier {
  List<RadioModel> _radiosFetcher;
  List<RadioModel> get allRadio => _radiosFetcher;
  int get totalRecords => _radiosFetcher != null ? _radiosFetcher.length : 0;

  getPlayerState() => _playerState;

  RadioPlayerState _playerState = RadioPlayerState.STOPPED;

  PlayerProvider() {
    _radiosFetcher = List<RadioModel>();
  }

  fetchAllRadios(
      {String searchQuery = "", bool isFavouriteOnly = false}) async {
    _radiosFetcher = await DBDownloadService.fetchLocalDB(
        searchQuery: searchQuery, isFavouriteOnly: isFavouriteOnly);
    notifyListeners();
  }

  Future<void> radioBookmarked(
    int radioID,
    bool isFavourite, {
    bool isFavouriteOnly = false,
  }) async {
    int isFavouriteVal = isFavourite ? 1 : 0;

    await DB.init();
    await DB.rawInsert(
        "INSERT OR REPLACE INTO radio_bookmarks (id, isFavourite) values($radioID, $isFavouriteVal)");

    fetchAllRadios(isFavouriteOnly: isFavouriteOnly);
  }

  void updatePlayerState(RadioPlayerState state) {
    _playerState = state;
    notifyListeners();
  }
/*
  static Future<RadioAPIModel> fetchAllRadios() async {
    final serviceResponse =
        await WebService().getData(Config.api_URL, new RadioAPIModel());
    return serviceResponse;
  }

  static Future<List<RadioModel>> fetchLocalDB() async {
    if (!await isLocalDBAvailable()) {
      RadioAPIModel radioAPIModel = await fetchAllRadios();

      if (radioAPIModel.data.length > 0) {
        await DB.init();

        radioAPIModel.data.forEach((RadioModel radioModel) {
          DB.insert(RadioModel.table, radioModel);
        });
      }
    }

    List<Map<String, dynamic>> _results = await DB.query(RadioModel.table);

    List<RadioModel> radioModel = new List<RadioModel>();
    radioModel = _results.map((item) => RadioModel.fromMap(item)).toList();

    return radioModel;
  }*/
}
