// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  final String? id;
  final String? jsonrpc;
  final List<Result>? result;

  PostModel({
    this.id,
    this.jsonrpc,
    this.result,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"].toString(),
        jsonrpc: json["jsonrpc"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jsonrpc": jsonrpc,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  final List<ActiveVote>? activeVotes;
  final String? author;
  final AuthorPayoutValue? authorPayoutValue;
  final double? authorReputation;
  final String? authorRole;
  final String? authorTitle;
  final List<Beneficiary>? beneficiaries;
  final List<dynamic>? blacklists;
  final String? body;
  final String? category;
  final int? children;
  final String? community;
  final String? communityTitle;
  final DateTime created;
  final AuthorPayoutValue? curatorPayoutValue;
  final int? depth;
  final bool? isPaidout;
  final JsonMetadata? jsonMetadata;
  final MaxAcceptedPayout? maxAcceptedPayout;
  final int? netRshares;
  final double? payout;
  final DateTime? payoutAt;
  final String? pendingPayoutValue;
  final int? percentHbd;
  final String? permlink;
  final int? postId;
  final AuthorPayoutValue? promoted;
  final int? reblogs;
  final List<dynamic>? replies;
  final Stats? stats;
  final String? title;
  final DateTime? updated;
  final String? url;

  Result({
    this.activeVotes,
    this.author,
    this.authorPayoutValue,
    this.authorReputation,
    this.authorRole,
    this.authorTitle,
    this.beneficiaries,
    this.blacklists,
    this.body,
    this.category,
    this.children,
    this.community,
    this.communityTitle,
    required this.created,
    this.curatorPayoutValue,
    this.depth,
    this.isPaidout,
    this.jsonMetadata,
    this.maxAcceptedPayout,
    this.netRshares,
    this.payout,
    this.payoutAt,
    this.pendingPayoutValue,
    this.percentHbd,
    this.permlink,
    this.postId,
    this.promoted,
    this.reblogs,
    this.replies,
    this.stats,
    this.title,
    this.updated,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        activeVotes: json["active_votes"] == null
            ? []
            : List<ActiveVote>.from(
                json["active_votes"]!.map((x) => ActiveVote.fromJson(x))),
        author: json["author"],
        authorPayoutValue:
            authorPayoutValueValues.map[json["author_payout_value"]]!,
        authorReputation: json["author_reputation"]?.toDouble(),
        authorRole: json["author_role"],
        authorTitle: json["author_title"],
        beneficiaries: json["beneficiaries"] == null
            ? []
            : List<Beneficiary>.from(
                json["beneficiaries"]!.map((x) => Beneficiary.fromJson(x))),
        blacklists: json["blacklists"] == null
            ? []
            : List<dynamic>.from(json["blacklists"]!.map((x) => x)),
        body: json["body"],
        category: json["category"],
        children: json["children"],
        community: json["community"],
        communityTitle: json["community_title"],
        created: DateTime.parse(json["created"]),
        curatorPayoutValue:
            authorPayoutValueValues.map[json["curator_payout_value"]]!,
        depth: json["depth"],
        isPaidout: json["is_paidout"],
        jsonMetadata: json["json_metadata"] == null
            ? null
            : JsonMetadata.fromJson(json["json_metadata"]),
        maxAcceptedPayout:
            maxAcceptedPayoutValues.map[json["max_accepted_payout"]]!,
        netRshares: json["net_rshares"],
        payout: json["payout"]?.toDouble(),
        payoutAt: json["payout_at"] == null
            ? null
            : DateTime.parse(json["payout_at"]),
        pendingPayoutValue: json["pending_payout_value"],
        percentHbd: json["percent_hbd"],
        permlink: json["permlink"],
        postId: json["post_id"],
        promoted: authorPayoutValueValues.map[json["promoted"]]!,
        reblogs: json["reblogs"],
        replies: json["replies"] == null
            ? []
            : List<dynamic>.from(json["replies"]!.map((x) => x)),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        title: json["title"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "active_votes": activeVotes == null
            ? []
            : List<dynamic>.from(activeVotes!.map((x) => x.toJson())),
        "author": author,
        "author_payout_value":
            authorPayoutValueValues.reverse[authorPayoutValue],
        "author_reputation": authorReputation,
        "author_role": authorRoleValues.reverse[authorRole],
        "author_title": authorTitle,
        "beneficiaries": beneficiaries == null
            ? []
            : List<dynamic>.from(beneficiaries!.map((x) => x.toJson())),
        "blacklists": blacklists == null
            ? []
            : List<dynamic>.from(blacklists!.map((x) => x)),
        "body": body,
        "category": category,
        "children": children,
        "community": community,
        "community_title": communityTitle,
        "created": created?.toIso8601String(),
        "curator_payout_value":
            authorPayoutValueValues.reverse[curatorPayoutValue],
        "depth": depth,
        "is_paidout": isPaidout,
        "json_metadata": jsonMetadata?.toJson(),
        "max_accepted_payout":
            maxAcceptedPayoutValues.reverse[maxAcceptedPayout],
        "net_rshares": netRshares,
        "payout": payout,
        "payout_at": payoutAt?.toIso8601String(),
        "pending_payout_value": pendingPayoutValue,
        "percent_hbd": percentHbd,
        "permlink": permlink,
        "post_id": postId,
        "promoted": authorPayoutValueValues.reverse[promoted],
        "reblogs": reblogs,
        "replies":
            replies == null ? [] : List<dynamic>.from(replies!.map((x) => x)),
        "stats": stats?.toJson(),
        "title": title,
        "updated": updated?.toIso8601String(),
        "url": url,
      };
}

class ActiveVote {
  final int? rshares;
  final String? voter;

  ActiveVote({
    this.rshares,
    this.voter,
  });

  factory ActiveVote.fromJson(Map<String, dynamic> json) => ActiveVote(
        rshares: json["rshares"],
        voter: json["voter"],
      );

  Map<String, dynamic> toJson() => {
        "rshares": rshares,
        "voter": voter,
      };
}

enum AuthorPayoutValue { THE_0000_HBD }

final authorPayoutValueValues =
    EnumValues({"0.000 HBD": AuthorPayoutValue.THE_0000_HBD});

enum AuthorRole { ADMIN, GUEST, MEMBER, MOD }

final authorRoleValues = EnumValues({
  "admin": AuthorRole.ADMIN,
  "guest": AuthorRole.GUEST,
  "member": AuthorRole.MEMBER,
  "mod": AuthorRole.MOD
});

class Beneficiary {
  final String? account;
  final int? weight;

  Beneficiary({
    this.account,
    this.weight,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        account: json["account"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "account": account,
        "weight": weight,
      };
}

class JsonMetadata {
  final String? app;
  final String? description;
  final String? format;
  final List<String>? image;
  final List<String>? imageRatios;
  final List<String>? tags;
  final List<String>? choices;
  final String? contentType;
  final int? endTime;
  final Filters? filters;
  final List<String>? links;
  final String? preferredInterpretation;
  final String? question;
  final bool? uiHideResUntilVoted;
  final List<String>? users;
  final double? version;
  final List<String>? thumbnails;
  final String? canonicalUrl;
  final Dimensions? dimensions;
  final List<String>? images;
  final bool? isPoll;
  final String? type;
  final Video? video;
  final String? author;
  final bool? portfolio;

  JsonMetadata({
    this.app,
    this.description,
    this.format,
    this.image,
    this.imageRatios,
    this.tags,
    this.choices,
    this.contentType,
    this.endTime,
    this.filters,
    this.links,
    this.preferredInterpretation,
    this.question,
    this.uiHideResUntilVoted,
    this.users,
    this.version,
    this.thumbnails,
    this.canonicalUrl,
    this.dimensions,
    this.images,
    this.isPoll,
    this.type,
    this.video,
    this.author,
    this.portfolio,
  });

  factory JsonMetadata.fromJson(Map<String, dynamic> json) => JsonMetadata(
        app: json["app"],
        description: json["description"],
        format: json["format"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        imageRatios: json["image_ratios"] == null
            ? []
            : List<String>.from(json["image_ratios"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        choices: json["choices"] == null
            ? []
            : List<String>.from(json["choices"]!.map((x) => x)),
        contentType: json["content_type"],
        endTime: json["end_time"],
        filters:
            json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        links: json["links"] == null
            ? []
            : List<String>.from(json["links"]!.map((x) => x)),
        preferredInterpretation: json["preferred_interpretation"],
        question: json["question"],
        uiHideResUntilVoted: json["ui_hide_res_until_voted"],
        users: json["users"] == null
            ? []
            : List<String>.from(json["users"]!.map((x) => x)),
        version: json["version"]?.toDouble(),
        thumbnails: json["thumbnails"] == null
            ? []
            : List<String>.from(json["thumbnails"]!.map((x) => x)),
        canonicalUrl: json["canonical_url"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        isPoll: json["isPoll"],
        type: json["type"],
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        author: json["author"],
        portfolio: json["portfolio"],
      );

  Map<String, dynamic> toJson() => {
        "app": app,
        "description": description,
        "format": formatValues.reverse[format],
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "image_ratios": imageRatios == null
            ? []
            : List<dynamic>.from(imageRatios!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "choices":
            choices == null ? [] : List<dynamic>.from(choices!.map((x) => x)),
        "content_type": contentType,
        "end_time": endTime,
        "filters": filters?.toJson(),
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x)),
        "preferred_interpretation": preferredInterpretation,
        "question": question,
        "ui_hide_res_until_voted": uiHideResUntilVoted,
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x)),
        "version": version,
        "thumbnails": thumbnails == null
            ? []
            : List<dynamic>.from(thumbnails!.map((x) => x)),
        "canonical_url": canonicalUrl,
        "dimensions": dimensions?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "isPoll": isPoll,
        "type": type,
        "video": video?.toJson(),
        "author": author,
        "portfolio": portfolio,
      };
}

class Dimensions {
  Dimensions();

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions();

  Map<String, dynamic> toJson() => {};
}

class Filters {
  final int? accountAge;

  Filters({
    this.accountAge,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        accountAge: json["account_age"],
      );

  Map<String, dynamic> toJson() => {
        "account_age": accountAge,
      };
}

enum Format { MARKDOWN, MARKDOWN_HTML }

final formatValues = EnumValues(
    {"markdown": Format.MARKDOWN, "markdown+html": Format.MARKDOWN_HTML});

class Video {
  final Content? content;
  final Info? info;

  Video({
    this.content,
    this.info,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
        "info": info?.toJson(),
      };
}

class Content {
  final String? description;
  final List<String>? tags;

  Content({
    this.description,
    this.tags,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: json["description"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class Info {
  final String? author;
  final double? duration;
  final String? file;
  final int? filesize;
  final bool? firstUpload;
  final dynamic ipfs;
  final dynamic ipfsThumbnail;
  final String? lang;
  final String? permlink;
  final String? platform;
  final List<SourceMap>? sourceMap;
  final String? title;
  final String? videoV2;

  Info({
    this.author,
    this.duration,
    this.file,
    this.filesize,
    this.firstUpload,
    this.ipfs,
    this.ipfsThumbnail,
    this.lang,
    this.permlink,
    this.platform,
    this.sourceMap,
    this.title,
    this.videoV2,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        author: json["author"],
        duration: json["duration"]?.toDouble(),
        file: json["file"],
        filesize: json["filesize"],
        firstUpload: json["firstUpload"],
        ipfs: json["ipfs"],
        ipfsThumbnail: json["ipfsThumbnail"],
        lang: json["lang"],
        permlink: json["permlink"],
        platform: json["platform"],
        sourceMap: json["sourceMap"] == null
            ? []
            : List<SourceMap>.from(
                json["sourceMap"]!.map((x) => SourceMap.fromJson(x))),
        title: json["title"],
        videoV2: json["video_v2"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "duration": duration,
        "file": file,
        "filesize": filesize,
        "firstUpload": firstUpload,
        "ipfs": ipfs,
        "ipfsThumbnail": ipfsThumbnail,
        "lang": lang,
        "permlink": permlink,
        "platform": platform,
        "sourceMap": sourceMap == null
            ? []
            : List<dynamic>.from(sourceMap!.map((x) => x.toJson())),
        "title": title,
        "video_v2": videoV2,
      };
}

class SourceMap {
  final String? format;
  final String? type;
  final String? url;

  SourceMap({
    this.format,
    this.type,
    this.url,
  });

  factory SourceMap.fromJson(Map<String, dynamic> json) => SourceMap(
        format: json["format"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "type": type,
        "url": url,
      };
}

enum MaxAcceptedPayout { THE_1000000000_HBD, THE_100000000_HBD }

final maxAcceptedPayoutValues = EnumValues({
  "1000000.000 HBD": MaxAcceptedPayout.THE_1000000000_HBD,
  "100000.000 HBD": MaxAcceptedPayout.THE_100000000_HBD
});

class Stats {
  final double? flagWeight;
  final bool? gray;
  final bool? hide;
  final int? totalVotes;
  final bool? isPinned;

  Stats({
    this.flagWeight,
    this.gray,
    this.hide,
    this.totalVotes,
    this.isPinned,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        flagWeight: json["flag_weight"],
        gray: json["gray"],
        hide: json["hide"],
        totalVotes: json["total_votes"],
        isPinned: json["is_pinned"],
      );

  Map<String, dynamic> toJson() => {
        "flag_weight": flagWeight,
        "gray": gray,
        "hide": hide,
        "total_votes": totalVotes,
        "is_pinned": isPinned,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
