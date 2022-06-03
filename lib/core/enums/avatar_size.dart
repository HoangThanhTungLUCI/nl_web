enum AvatarSize { large, medium, small, superSmall }

extension AvatarByType on AvatarSize {
  double toSizeAvatarBySize() {
    double result = 0;
    switch (this) {
      case AvatarSize.large:
        result = 40;
        break;
      case AvatarSize.medium:
        result = 32;
        break;
      case AvatarSize.small:
        result = 24;
        break;
      case AvatarSize.superSmall:
        result = 16;
        break;
    }

    return result;
  }
}
