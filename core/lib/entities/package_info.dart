class PackageInfoEntity {
  const PackageInfoEntity({
    required this.packageName,
    required this.buildNumber,
    required this.version,
  });

  final String packageName;
  final String buildNumber;
  final String version;
}