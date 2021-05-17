.class public Lcom/playhaven/android/req/OpenRequest;
.super Lcom/playhaven/android/req/PlayHavenRequest;
.source "OpenRequest.java"


# static fields
.field private static final SCOUNT:Ljava/lang/String; = "scount"

.field private static final SSTART:Ljava/lang/String; = "sstart"

.field private static final SSUM:Ljava/lang/String; = "ssum"

.field private static final STIME:Ljava/lang/String; = "stime"


# instance fields
.field private cache:Lcom/playhaven/android/cache/Cache;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/playhaven/android/req/PlayHavenRequest;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 14
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-super {p0, p1}, Lcom/playhaven/android/req/PlayHavenRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    .line 56
    .local v0, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    const-string v10, "tz"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {}, Lcom/playhaven/android/util/TimeZoneFormatter;->getDefaultTimezone()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v0, v10, v11}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 58
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 59
    .local v3, "pref":Landroid/content/SharedPreferences;
    const-string v10, "scount"

    const/4 v11, 0x0

    invoke-interface {v3, v10, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 60
    .local v5, "scount":I
    const-string v10, "ssum"

    const-wide/16 v11, 0x0

    invoke-interface {v3, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 61
    .local v6, "ssum":J
    const-string v10, "stime"

    const-wide/16 v11, 0x0

    invoke-interface {v3, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 62
    .local v8, "stime":J
    add-long/2addr v6, v8

    .line 64
    const-string v10, "scount"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v0, v10, v11}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 65
    const-string v10, "ssum"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v0, v10, v11}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 67
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 69
    .local v2, "edit":Landroid/content/SharedPreferences$Editor;
    add-int/lit8 v5, v5, 0x1

    .line 70
    const-string v10, "scount"

    invoke-interface {v2, v10, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 72
    const-string v10, "stime"

    const-wide/16 v11, 0x0

    invoke-interface {v2, v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 75
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    .line 76
    .local v4, "rightNow":Ljava/util/Calendar;
    invoke-virtual {v4}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 77
    .local v1, "date":Ljava/util/Date;
    const-string v10, "sstart"

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    invoke-interface {v2, v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 79
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 81
    return-object v0
.end method

.method protected getApiPath(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 132
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/OpenRequest;->getCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->string:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    const-string v2, "playhaven_request_open_v3"

    invoke-virtual {v0, p1, v1, v2}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected handleResponse(Ljava/lang/String;)V
    .locals 4
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 106
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v1, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/playhaven/android/data/JsonUrlExtractor;->getContentTemplates(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 108
    iget-object v2, p0, Lcom/playhaven/android/req/OpenRequest;->cache:Lcom/playhaven/android/cache/Cache;

    new-instance v3, Lcom/playhaven/android/req/OpenRequest$1;

    invoke-direct {v3, p0}, Lcom/playhaven/android/req/OpenRequest$1;-><init>(Lcom/playhaven/android/req/OpenRequest;)V

    invoke-virtual {v2, v3, v1}, Lcom/playhaven/android/cache/Cache;->bulkRequest(Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .end local v1    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    invoke-virtual {p0}, Lcom/playhaven/android/req/OpenRequest;->getResponseHandler()Lcom/playhaven/android/req/RequestListener;

    move-result-object v0

    .line 125
    .local v0, "handler":Lcom/playhaven/android/req/RequestListener;
    if-eqz v0, :cond_0

    .line 126
    invoke-interface {v0, p1}, Lcom/playhaven/android/req/RequestListener;->handleResponse(Ljava/lang/String;)V

    .line 127
    :cond_0
    return-void

    .line 119
    .end local v0    # "handler":Lcom/playhaven/android/req/RequestListener;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected serverSuccess(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 87
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 89
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v2, "scount"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 91
    const-string v2, "ssum"

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 93
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 94
    return-void
.end method
