String parseDjangoError(dynamic errorData) {
  if (errorData == null) {
    return 'Unknown error occurred';
  }

  if (errorData is String) {
    return errorData;
  }

  if (errorData is List) {
    if (errorData.isNotEmpty) {
      var firstItem = errorData.first;
      if (firstItem is String) {
        return firstItem;
      } else if (firstItem is Map) {
        return parseDjangoError(firstItem);
      }
    }
    return 'Unexpected error list format';
  }

  if (errorData is Map) {
    for (var entry in errorData.entries) {
      final key = entry.key.toString();
      final value = entry.value;

      if (value is String) {
        if (value.toLowerCase().contains('this field is required')) {
          return '$key: $value';
        }
        return value;
      } else if (value is List && value.isNotEmpty) {
        return parseDjangoError({key: value.first});
      } else if (value is Map) {
        return parseDjangoError(value);
      }
    }
    return 'Unexpected error map format';
  }

  if (errorData is List && errorData.isNotEmpty) {
    return parseDjangoError(errorData.first);
  }

  if (errorData is String) {
    return errorData;
  }

  return 'Unknown error format';
}
