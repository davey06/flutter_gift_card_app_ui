// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $SelectedCardHash() => r'394a80cb091502dad288c9dcad8b4b2d4648c832';

/// See also [SelectedCard].
final selectedCardProvider =
    AutoDisposeAsyncNotifierProvider<SelectedCard, CardModel>(
  SelectedCard.new,
  name: r'selectedCardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $SelectedCardHash,
);
typedef SelectedCardRef = AutoDisposeAsyncNotifierProviderRef<CardModel>;

abstract class _$SelectedCard extends AutoDisposeAsyncNotifier<CardModel> {
  @override
  FutureOr<CardModel> build();
}

String $SelectedCardIdHash() => r'2ec71341b7c1dcd494209db7970e4423f6bf7700';

/// See also [SelectedCardId].
final selectedCardIdProvider = AutoDisposeNotifierProvider<SelectedCardId, int>(
  SelectedCardId.new,
  name: r'selectedCardIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $SelectedCardIdHash,
);
typedef SelectedCardIdRef = AutoDisposeNotifierProviderRef<int>;

abstract class _$SelectedCardId extends AutoDisposeNotifier<int> {
  @override
  int build();
}
