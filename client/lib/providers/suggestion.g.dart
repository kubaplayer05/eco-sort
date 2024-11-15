// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSuggestionsHash() => r'3f138125acb7c88a198eed1e003bf8e9a052da09';

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

/// See also [getSuggestions].
@ProviderFor(getSuggestions)
const getSuggestionsProvider = GetSuggestionsFamily();

/// See also [getSuggestions].
class GetSuggestionsFamily extends Family<AsyncValue<List<Suggestion>>> {
  /// See also [getSuggestions].
  const GetSuggestionsFamily();

  /// See also [getSuggestions].
  GetSuggestionsProvider call(
    String productName,
  ) {
    return GetSuggestionsProvider(
      productName,
    );
  }

  @override
  GetSuggestionsProvider getProviderOverride(
    covariant GetSuggestionsProvider provider,
  ) {
    return call(
      provider.productName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getSuggestionsProvider';
}

/// See also [getSuggestions].
class GetSuggestionsProvider
    extends AutoDisposeFutureProvider<List<Suggestion>> {
  /// See also [getSuggestions].
  GetSuggestionsProvider(
    String productName,
  ) : this._internal(
          (ref) => getSuggestions(
            ref as GetSuggestionsRef,
            productName,
          ),
          from: getSuggestionsProvider,
          name: r'getSuggestionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSuggestionsHash,
          dependencies: GetSuggestionsFamily._dependencies,
          allTransitiveDependencies:
              GetSuggestionsFamily._allTransitiveDependencies,
          productName: productName,
        );

  GetSuggestionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productName,
  }) : super.internal();

  final String productName;

  @override
  Override overrideWith(
    FutureOr<List<Suggestion>> Function(GetSuggestionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSuggestionsProvider._internal(
        (ref) => create(ref as GetSuggestionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productName: productName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Suggestion>> createElement() {
    return _GetSuggestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSuggestionsProvider && other.productName == productName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSuggestionsRef on AutoDisposeFutureProviderRef<List<Suggestion>> {
  /// The parameter `productName` of this provider.
  String get productName;
}

class _GetSuggestionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Suggestion>>
    with GetSuggestionsRef {
  _GetSuggestionsProviderElement(super.provider);

  @override
  String get productName => (origin as GetSuggestionsProvider).productName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
