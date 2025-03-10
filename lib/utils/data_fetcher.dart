import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:core';

// Fetch data from Supabase and cache it in Hive
Future<void> fetchDataAndCache(String tableName) async {
  final box = Hive.box<Map<String, dynamic>>(tableName);

  if (box.isNotEmpty) {
    print('$tableName data is already cached.');
    return;
  }

  final response = await Supabase.instance.client
      .from(tableName)
      .select()
      .execute();

  // if (response.error != null) {
  //   throw Exception('Failed to load data: ${response.error!.message}');
  // }

  final data = response.data as List<dynamic>;

  final typedData = data.map((item) {
    if (item is Map<String, dynamic>) {
      return item;
    } else if (item is Map) {
      return Map<String, dynamic>.from(item as Map<dynamic, dynamic>);
    } else {
      print('Unexpected data type: ${item.runtimeType}');
      return <String, dynamic>{}; // Return an empty map if unexpected type
    }
  }).toList();

  for (var item in typedData) {
    await box.add(item);
  }
}

// Retrieve cached data from Hive with type handling
Future<List<Map<String, dynamic>>> getCachedData(String tableName) async {
  final box = Hive.box(tableName);

  final cachedData = box.values.map((item) {
    return item as Map<String, dynamic>;
  }).toList();

  return cachedData;
}

// Fetch and cache data for all tables
Future<bool> fetchAndCacheAllData() async {
  final tableNames = [
    "common_expressions",
    "colors",
    "commerce",
    "domestic_environment",
    "education",
    "food_processing",
    "foods",
    "interpersonal_actions",
    "medical",
    "number",
    "order",
    "relationship",
    "plants",
    "professions",
    "social",
    "sports",
    "animals",
    "dimension",
    "emotions",
    "household_items",
    "music",
    "physical_features",
    "religion",
    "symbols",
    "time",
    "transport",
    "weather",
    "body_process",
    "external_part",
    "internal_part",
    "body_wears",
    "physical_actions",
    "feel",
    "mental_actions",
    "speech",
    "stage_life",
  ];

  bool dataFetched = false;

  for (var tableName in tableNames) {
    final box = Hive.box<Map<String, dynamic>>(tableName);
    if (box.isEmpty) {
      await fetchDataAndCache(tableName);
      dataFetched = true;
    }
  }

  return dataFetched;
}

// Initialize Hive boxes for all tables
Future<void> initializeHive() async {
  final tableNames = [
    "common_expressions",
    "colors",
    "commerce",
    "domestic_environment",
    "education",
    "food_processing",
    "foods",
    "interpersonal_actions",
    "medical",
    "number",
    "order",
    "relationship",
    "plants",
    "professions",
    "social",
    "sports",
    "animals",
    "dimension",
    "emotions",
    "household_items",
    "music",
    "physical_features",
    "religion",
    "symbols",
    "time",
    "transport",
    "weather",
    "body_process",
    "external_part",
    "internal_part",
    "body_wears",
    "physical_actions",
    "feel",
    "mental_actions",
    "speech",
    "stage_life",
  ];

  for (var tableName in tableNames) {
    if (!Hive.isBoxOpen(tableName)) {
      await Hive.openBox<Map<String, dynamic>>(tableName);
    }
  }
}