import '../../entities/common/permission_enum.dart';
import '../../entities/common/permission_status_enum.dart';
import '../../repositories/permission_repository.dart';
import '../use_case_base.dart';

class RequestPermissionUseCase extends UseCaseWithArgument<PermissionStatus,
    RequestPermissionUseCaseArguments> {
  RequestPermissionUseCase({
    required this.permissionRepository,
  });

  final PermissionRepository permissionRepository;

  @override
  Future<PermissionStatus> handle(
    RequestPermissionUseCaseArguments argument,
  ) async {
    var status = await permissionRepository.getStatus(
      argument.permission,
    );
    if (status == PermissionStatus.granted) {
      return status;
    }
    return await permissionRepository.request(
      argument.permission,
    );
  }
}

class RequestPermissionUseCaseArguments {
  RequestPermissionUseCaseArguments({
    required this.permission,
  });
  final Permission permission;
}