class Id<Owner> {
  final String id;

  const Id({required this.id});

  @override
  String toString() => id;
}

extension ChangeOwner<Owner> on Id<Owner> {
  Id<Other> changeOwner<Other>() => Id(id: id);
}
