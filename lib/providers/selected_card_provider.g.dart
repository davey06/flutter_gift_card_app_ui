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

String $SelectedCardHash() => r'cf709f21a2822a41f3e82f730dfcbf8df5d14d6d';

/// See also [SelectedCard].
class SelectedCardProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SelectedCard, CardModel> {
  SelectedCardProvider(
    this.cardId,
  ) : super(
          () => SelectedCard()..cardId = cardId,
          from: selectedCardProvider,
          name: r'selectedCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $SelectedCardHash,
        );

  final int cardId;

  @override
  bool operator ==(Object other) {
    return other is SelectedCardProvider && other.cardId == cardId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cardId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<CardModel> runNotifierBuild(
    covariant _$SelectedCard notifier,
  ) {
    return notifier.build(
      cardId,
    );
  }
}

typedef SelectedCardRef = AutoDisposeAsyncNotifierProviderRef<CardModel>;

/// See also [SelectedCard].
final selectedCardProvider = SelectedCardFamily();

class SelectedCardFamily extends Family<AsyncValue<CardModel>> {
  SelectedCardFamily();

  SelectedCardProvider call(
    int cardId,
  ) {
    return SelectedCardProvider(
      cardId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<SelectedCard, CardModel>
      getProviderOverride(
    covariant SelectedCardProvider provider,
  ) {
    return call(
      provider.cardId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'selectedCardProvider';
}

abstract class _$SelectedCard
    extends BuildlessAutoDisposeAsyncNotifier<CardModel> {
  late final int cardId;

  FutureOr<CardModel> build(
    int cardId,
  );
}
