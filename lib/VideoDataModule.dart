/// data : [{"id":1,"attributes":{"name":"Osees - Funeral Solution","createdAt":"2022-07-20T11:53:24.520Z","updatedAt":"2022-07-20T11:55:18.625Z","publishedAt":"2022-07-20T11:55:18.624Z"}},{"id":2,"attributes":{"name":"Bill Evans - Waltz For Debby","createdAt":"2022-07-20T11:54:11.363Z","updatedAt":"2022-07-20T11:55:13.356Z","publishedAt":"2022-07-20T11:55:13.352Z"}},{"id":3,"attributes":{"name":"Blur - Coffee And TV","createdAt":"2022-07-20T11:54:46.545Z","updatedAt":"2022-07-20T11:55:23.124Z","publishedAt":"2022-07-20T11:55:23.123Z"}}]
/// meta : {"pagination":{"page":1,"pageSize":25,"pageCount":1,"total":3}}

class VideoDataModule {
  VideoDataModule({
      List<Data>? data, 
      Meta? meta,}){
    _data = data;
    _meta = meta;
}

  VideoDataModule.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Data>? _data;
  Meta? _meta;
VideoDataModule copyWith({  List<Data>? data,
  Meta? meta,
}) => VideoDataModule(  data: data ?? _data,
  meta: meta ?? _meta,
);
  List<Data>? get data => _data;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// pagination : {"page":1,"pageSize":25,"pageCount":1,"total":3}

class Meta {
  Meta({
      Pagination? pagination,}){
    _pagination = pagination;
}

  Meta.fromJson(dynamic json) {
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  Pagination? _pagination;
Meta copyWith({  Pagination? pagination,
}) => Meta(  pagination: pagination ?? _pagination,
);
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

/// page : 1
/// pageSize : 25
/// pageCount : 1
/// total : 3

class Pagination {
  Pagination({
      int? page, 
      int? pageSize, 
      int? pageCount, 
      int? total,}){
    _page = page;
    _pageSize = pageSize;
    _pageCount = pageCount;
    _total = total;
}

  Pagination.fromJson(dynamic json) {
    _page = json['page'];
    _pageSize = json['pageSize'];
    _pageCount = json['pageCount'];
    _total = json['total'];
  }
  int? _page;
  int? _pageSize;
  int? _pageCount;
  int? _total;
Pagination copyWith({  int? page,
  int? pageSize,
  int? pageCount,
  int? total,
}) => Pagination(  page: page ?? _page,
  pageSize: pageSize ?? _pageSize,
  pageCount: pageCount ?? _pageCount,
  total: total ?? _total,
);
  int? get page => _page;
  int? get pageSize => _pageSize;
  int? get pageCount => _pageCount;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['pageSize'] = _pageSize;
    map['pageCount'] = _pageCount;
    map['total'] = _total;
    return map;
  }

}

/// id : 1
/// attributes : {"name":"Osees - Funeral Solution","createdAt":"2022-07-20T11:53:24.520Z","updatedAt":"2022-07-20T11:55:18.625Z","publishedAt":"2022-07-20T11:55:18.624Z"}

class Data {
  Data({
      int? id, 
      Attributes? attributes,}){
    _id = id;
    _attributes = attributes;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  int? _id;
  Attributes? _attributes;
Data copyWith({  int? id,
  Attributes? attributes,
}) => Data(  id: id ?? _id,
  attributes: attributes ?? _attributes,
);
  int? get id => _id;
  Attributes? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    return map;
  }

}

/// name : "Osees - Funeral Solution"
/// createdAt : "2022-07-20T11:53:24.520Z"
/// updatedAt : "2022-07-20T11:55:18.625Z"
/// publishedAt : "2022-07-20T11:55:18.624Z"

class Attributes {
  Attributes({
      String? name, 
      String? createdAt, 
      String? updatedAt, 
      String? publishedAt,}){
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _publishedAt = publishedAt;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _publishedAt = json['publishedAt'];
  }
  String? _name;
  String? _createdAt;
  String? _updatedAt;
  String? _publishedAt;
Attributes copyWith({  String? name,
  String? createdAt,
  String? updatedAt,
  String? publishedAt,
}) => Attributes(  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  publishedAt: publishedAt ?? _publishedAt,
);
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get publishedAt => _publishedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['publishedAt'] = _publishedAt;
    return map;
  }

}