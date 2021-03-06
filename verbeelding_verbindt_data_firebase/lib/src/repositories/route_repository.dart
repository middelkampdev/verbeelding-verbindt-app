import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

class RouteRepositoryImpl implements RouteRepository {
  RouteRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _routeCollection =
            firestore.collection('routes').withConverter<RouteDataModel>(
          fromFirestore: (snapshot, _) {
            final json = snapshot.data()!;
            return RouteDataModel.fromJson(json).copyWith(
              id: snapshot.id,
            );
          },
          toFirestore: (value, _) {
            return value.toJson();
          },
        );

  final CollectionReference<RouteDataModel> _routeCollection;

  @override
  Future<void> createRoute(
    Route data,
  ) async {
    await _routeCollection.doc(data.id).set(data.toDataModel());
  }

  @override
  Stream<Route?> getRouteStream(
    String id,
  ) async* {
    yield* _routeCollection.doc(id).snapshots().map((snapshot) {
      return snapshot.data()?.toEntity();
    });
  }

  @override
  Future<Route?> getRoute(
    String id,
  ) async {
    final docSnap = await _routeCollection.doc(id).get();
    return docSnap.data()?.toEntity();
  }

  @override
  Future<void> completeRouteStop({
    required String routeId,
    required int stopIndex,
  }) async {
    final snapshot = await _routeCollection.doc(routeId).get();
    if (!snapshot.exists) {
      return;
    }
    final route = snapshot.data()!.copyWith(
          id: snapshot.id,
        );
    final updatedRoute = route.copyWith(
      stops: route.stops
          .asMap()
          .map((index, routeStop) {
            return _completeMap(
              indexToComplete: stopIndex,
              index: index,
              routeStop: routeStop,
            );
          })
          .values
          .toList(),
    );
    await _routeCollection.doc(routeId).set(updatedRoute);
  }

  MapEntry<int, RouteStopDataModel> _completeMap({
    required int indexToComplete,
    required int index,
    required RouteStopDataModel routeStop,
  }) {
    return MapEntry(
      index,
      routeStop.copyWith(
        completed: index == indexToComplete ? true : routeStop.completed,
      ),
    );
  }

  @override
  Future<bool> routeExists(
    String id,
  ) async {
    final snapshot = await _routeCollection.doc(id).get();
    return snapshot.exists;
  }

  @override
  Future<void> delete(
    String id,
  ) async {
    await _routeCollection.doc(id).delete();
  }
}
