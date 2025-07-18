extension StringExtension on String? {
  T? toEnum<T extends Enum?>(
    final List<T?>? values, [
    final Map<T, dynamic>? map,
  ]) => values?.firstWhere(
    (final e) => e?.name == this || map?[e] == this,
    orElse: () => throw ArgumentError(
      'No enum value found for $this in '
      '${values.map((final e) => e?.name).join(', ')}',
    ),
  );
}
