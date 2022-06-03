class ImagesPath {
  static const String pathOfResources = 'assets/images/';

  static String pathImageNamed(String name) => '$pathOfResources$name.png';

  static String pathImageNamedAndType(String name, String type) =>
      '$pathOfResources$name.$type';

  static const email = '${pathOfResources}email.png';

  static const warning = '${pathOfResources}warning.png';

  static const sms = '${pathOfResources}sms.png';

  static const uploading = '${pathOfResources}uploading.png';

  static const upload = '${pathOfResources}upload.png';

  static const success = '${pathOfResources}success.png';

  static const delete = '${pathOfResources}delete.png';

  static const analysis = '${pathOfResources}analysis.png';

  static const danger = '${pathOfResources}danger.png';

  static const defaultCheckbox = '${pathOfResources}default_checkbox.png';

  static const checkedCheckbox = '${pathOfResources}checked_checkbox.png';

  static const indeterminateCheckbox =
      '${pathOfResources}indeterminate_checkbox.png';

  static const disableCheckbox = '${pathOfResources}disabled_checkbox.png';

  static const checkedDisableCheckbox =
      '${pathOfResources}checked_disabled_checkbox.png';

  static const indeterminateDisableCheckbox =
      '${pathOfResources}indeterminate_disabled_checkbox.png';

  static const invalidCheckbox = '${pathOfResources}invalid_checkbox.png';
  static const check = '${pathOfResources}check.png';
  static const cross = '${pathOfResources}cross.png';
  static const confirmation = '${pathOfResources}confirmation.png';
  static const icWarning = '${pathOfResources}ic_warning.png';
  static const icDanger = '${pathOfResources}ic_danger.png';
  static const information = '${pathOfResources}information.png';

  static const logoNavigation= '${pathOfResources}logo.png';
  static const userDemoAvatar='${pathOfResources}avatar.png';
  static const waterPointLogo='${pathOfResources}finger_print.png';
}
