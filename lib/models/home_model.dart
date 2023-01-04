class HomeModel {
  String? name;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? url;
  List<String>? fileValidations;
  Icons? icons;
  Icons? greyIcons;

  HomeModel(
      {this.name,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.url,
      this.fileValidations,
      this.icons});

  HomeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    type = json['type'];
    url = json['url'];
    fileValidations = json['file_validations'].cast<String>();
    if (json['icon']['data'] != null) {
      json['icon']['data']['attributes']['id'] = json['icon']['data']['id'];
      icons = Icons.fromJson(json['icon']['data']['attributes']);
    } else {
      icons = null;
    }
    if (json['grey_icon']['data'] != null) {
      json['grey_icon']['data']['attributes']['id'] =
          json['grey_icon']['data']['id'];
      icons = Icons.fromJson(json['grey_icon']['data']['attributes']);
    } else {
      icons = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['url'] = url;
    data['file_validations'] = fileValidations;
    if (icons != null) {
      data['icon'] = icons!.toJson();
    }
    return data;
  }
}

class Icons {
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  dynamic size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Icons(
      {this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  Icons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    if (json['formats']['thumbnail'] != null) {
      json['formats']['thumbnail'] = json['formats']['thumbnail'];
      formats = Formats.fromJson(json['formats']['thumbnail']);
    } else {
      formats = null;
    }
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    data['previewUrl'] = previewUrl;
    data['provider'] = provider;
    data['provider_metadata'] = providerMetadata;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Formats {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  String? path;
  dynamic size;
  int? width;
  int? height;

  Formats(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height});

  Formats.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext'] = ext;
    data['url'] = url;
    data['hash'] = hash;
    data['mime'] = mime;
    data['name'] = name;
    data['path'] = path;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class IconsCard {
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  dynamic size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  String? createdAt;
  String? updatedAt;

  IconsCard(
      {this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  IconsCard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    if (json['formats']['thumbnail'] != null) {
      json['formats']['thumbnail'] = json['formats']['thumbnail'];
      formats = Formats.fromJson(json['formats']['thumbnail']);
    } else {
      formats = null;
    }
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    data['previewUrl'] = previewUrl;
    data['provider'] = provider;
    data['provider_metadata'] = providerMetadata;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Formats1 {
  Small? small;
  Small? thumbnail;

  Formats1({this.small, this.thumbnail});

  Formats1.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    thumbnail =
        json['thumbnail'] != null ? Small.fromJson(json['thumbnail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class Small {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  String? path;
  dynamic size;
  int? width;
  int? height;

  Small(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height});

  Small.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext'] = ext;
    data['url'] = url;
    data['hash'] = hash;
    data['mime'] = mime;
    data['name'] = name;
    data['path'] = path;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
