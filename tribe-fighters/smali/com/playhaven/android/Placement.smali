.class public Lcom/playhaven/android/Placement;
.super Ljava/lang/Object;
.source "Placement.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/playhaven/android/cache/CacheResponseHandler;
.implements Lcom/playhaven/android/req/RequestListener;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/playhaven/android/Placement;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected cache:Lcom/playhaven/android/cache/Cache;

.field protected isLoading:Z

.field private listener:Lcom/playhaven/android/PlacementListener;

.field private model:Ljava/lang/String;

.field protected placementTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 154
    new-instance v0, Lcom/playhaven/android/Placement$1;

    invoke-direct {v0}, Lcom/playhaven/android/Placement$1;-><init>()V

    sput-object v0, Lcom/playhaven/android/Placement;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 158
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    .line 92
    invoke-virtual {p0, p1}, Lcom/playhaven/android/Placement;->readFromParcel(Landroid/os/Parcel;)V

    .line 93
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    .line 82
    iput-object p1, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    .line 83
    return-void
.end method


# virtual methods
.method public cacheFail(Ljava/net/URL;Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "exception"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 275
    invoke-virtual {p0, p2}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    .line 276
    return-void
.end method

.method public varargs cacheSuccess([Lcom/playhaven/android/cache/CachedInfo;)V
    .locals 0
    .param p1, "cachedInfos"    # [Lcom/playhaven/android/cache/CachedInfo;

    .prologue
    .line 264
    invoke-virtual {p0}, Lcom/playhaven/android/Placement;->contentLoaded()V

    .line 265
    return-void
.end method

.method protected contentFailed(Lcom/playhaven/android/PlayHavenException;)V
    .locals 1
    .param p1, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 251
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    .line 252
    iget-object v0, p0, Lcom/playhaven/android/Placement;->listener:Lcom/playhaven/android/PlacementListener;

    if-eqz v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/playhaven/android/Placement;->listener:Lcom/playhaven/android/PlacementListener;

    invoke-interface {v0, p0, p1}, Lcom/playhaven/android/PlacementListener;->contentFailed(Lcom/playhaven/android/Placement;Lcom/playhaven/android/PlayHavenException;)V

    .line 254
    :cond_0
    return-void
.end method

.method protected contentLoaded()V
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    .line 241
    iget-object v0, p0, Lcom/playhaven/android/Placement;->listener:Lcom/playhaven/android/PlacementListener;

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/playhaven/android/Placement;->listener:Lcom/playhaven/android/PlacementListener;

    invoke-interface {v0, p0}, Lcom/playhaven/android/PlacementListener;->contentLoaded(Lcom/playhaven/android/Placement;)V

    .line 243
    :cond_0
    return-void
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 167
    const/4 v0, 0x0

    return v0
.end method

.method public getListener()Lcom/playhaven/android/PlacementListener;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/playhaven/android/Placement;->listener:Lcom/playhaven/android/PlacementListener;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    return-object v0
.end method

.method public getPlacementTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    return-object v0
.end method

.method public handleResponse(Lcom/playhaven/android/PlayHavenException;)V
    .locals 0
    .param p1, "e"    # Lcom/playhaven/android/PlayHavenException;

    .prologue
    .line 396
    invoke-virtual {p0, p1}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    .line 397
    return-void
.end method

.method public handleResponse(Ljava/lang/String;)V
    .locals 7
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 351
    invoke-virtual {p0, p1}, Lcom/playhaven/android/Placement;->setModel(Ljava/lang/String;)V

    .line 352
    if-nez p1, :cond_0

    .line 354
    new-instance v5, Lcom/playhaven/android/PlayHavenException;

    const-string v6, "No returned model"

    invoke-direct {v5, v6}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    .line 387
    :goto_0
    return-void

    .line 358
    :cond_0
    const-string v5, "$.error"

    invoke-static {p1, v5}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 359
    .local v3, "err":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 361
    new-instance v5, Lcom/playhaven/android/PlayHavenException;

    invoke-direct {v5, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_0

    .line 366
    :cond_1
    :try_start_0
    const-string v5, "$.response.context.content"

    invoke-static {p1, v5}, Lcom/playhaven/android/util/JsonUtil;->hasPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 368
    new-instance v5, Lcom/playhaven/android/req/NoContentException;

    invoke-direct {v5}, Lcom/playhaven/android/req/NoContentException;-><init>()V

    invoke-virtual {p0, v5}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 380
    :catch_0
    move-exception v0

    .line 381
    .local v0, "e":Lcom/playhaven/android/PlayHavenException;
    invoke-virtual {p0, v0}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_0

    .line 372
    .end local v0    # "e":Lcom/playhaven/android/PlayHavenException;
    :cond_2
    :try_start_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .local v4, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/playhaven/android/data/JsonUrlExtractor;->getContentTemplates(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 376
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v5, v6, :cond_3

    .line 377
    invoke-static {p1}, Lcom/playhaven/android/data/JsonUrlExtractor;->getImages(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 379
    :cond_3
    iget-object v5, p0, Lcom/playhaven/android/Placement;->cache:Lcom/playhaven/android/cache/Cache;

    invoke-virtual {v5, p0, v4}, Lcom/playhaven/android/cache/Cache;->bulkRequest(Lcom/playhaven/android/cache/CacheResponseHandler;Ljava/util/List;)V
    :try_end_1
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 382
    .end local v4    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    .line 383
    .local v1, "e2":Ljava/io/IOException;
    new-instance v5, Lcom/playhaven/android/PlayHavenException;

    invoke-direct {v5, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, v5}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_0

    .line 384
    .end local v1    # "e2":Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 385
    .local v2, "e3":Ljava/lang/Exception;
    new-instance v5, Lcom/playhaven/android/PlayHavenException;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_0
.end method

.method public isDisplayable()Z
    .locals 1

    .prologue
    .line 285
    invoke-virtual {p0}, Lcom/playhaven/android/Placement;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/playhaven/android/Placement;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 313
    invoke-virtual {p0}, Lcom/playhaven/android/Placement;->isLoaded()Z

    move-result v1

    if-nez v1, :cond_1

    .line 314
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    const-string v2, "$.response"

    invoke-static {v1, v2}, Lcom/playhaven/android/util/JsonUtil;->getPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFullscreenCompatible()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 295
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 297
    .local v1, "jsonSays":Ljava/lang/Integer;
    :try_start_0
    iget-object v4, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    const-string v5, "$.response.resizable"

    invoke-static {v4, v5}, Lcom/playhaven/android/util/JsonUtil;->asInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/jayway/jsonpath/InvalidPathException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 303
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v2, :cond_0

    :goto_1
    return v2

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, "e":Ljava/lang/ClassCastException;
    const-string v4, "Unable to ascertain fullscreen compatibility from JSON, invalid value."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 300
    .end local v0    # "e":Ljava/lang/ClassCastException;
    :catch_1
    move-exception v0

    .line 301
    .local v0, "e":Lcom/jayway/jsonpath/InvalidPathException;
    const-string v4, "Unable to ascertain fullscreen compatibility from JSON, missing value."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .end local v0    # "e":Lcom/jayway/jsonpath/InvalidPathException;
    :cond_0
    move v2, v3

    .line 303
    goto :goto_1
.end method

.method public isLoaded()Z
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoading()Z
    .locals 1

    .prologue
    .line 334
    iget-boolean v0, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    return v0
.end method

.method public preload(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 211
    iget-boolean v2, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    if-eqz v2, :cond_0

    .line 234
    :goto_0
    return-void

    .line 213
    :cond_0
    iget-object v2, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 216
    const-string v2, "Skipping \'null\' placement"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 220
    :cond_1
    const-string v2, "Start server call: %s"

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 221
    iput-boolean v5, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    .line 224
    :try_start_0
    iget-object v2, p0, Lcom/playhaven/android/Placement;->cache:Lcom/playhaven/android/cache/Cache;

    if-nez v2, :cond_2

    .line 225
    new-instance v2, Lcom/playhaven/android/cache/Cache;

    invoke-direct {v2, p1}, Lcom/playhaven/android/cache/Cache;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/playhaven/android/Placement;->cache:Lcom/playhaven/android/cache/Cache;
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :cond_2
    :goto_1
    new-instance v0, Lcom/playhaven/android/req/ContentRequest;

    iget-object v2, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/playhaven/android/req/ContentRequest;-><init>(Ljava/lang/String;)V

    .line 231
    .local v0, "content":Lcom/playhaven/android/req/ContentRequest;
    invoke-virtual {v0, v5}, Lcom/playhaven/android/req/ContentRequest;->setPreload(Z)V

    .line 232
    invoke-virtual {v0, p0}, Lcom/playhaven/android/req/ContentRequest;->setResponseHandler(Lcom/playhaven/android/req/RequestListener;)V

    .line 233
    invoke-virtual {v0, p1}, Lcom/playhaven/android/req/ContentRequest;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 226
    .end local v0    # "content":Lcom/playhaven/android/req/ContentRequest;
    :catch_0
    move-exception v1

    .line 227
    .local v1, "e":Lcom/playhaven/android/PlayHavenException;
    invoke-virtual {p0, v1}, Lcom/playhaven/android/Placement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_1
.end method

.method protected readFromParcel(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 200
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/playhaven/android/Placement;->setPlacementTag(Ljava/lang/String;)V

    .line 202
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    .line 203
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 340
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/playhaven/android/Placement;->isLoading:Z

    .line 341
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    .line 342
    return-void
.end method

.method public setListener(Lcom/playhaven/android/PlacementListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/playhaven/android/PlacementListener;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/playhaven/android/Placement;->listener:Lcom/playhaven/android/PlacementListener;

    .line 149
    return-void
.end method

.method public setModel(Ljava/lang/String;)V
    .locals 0
    .param p1, "model"    # Ljava/lang/String;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    .line 131
    return-void
.end method

.method public setPlacementTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v2, 0x0

    .line 178
    iget-object v1, p0, Lcom/playhaven/android/Placement;->placementTag:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 180
    iget-object v1, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 182
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 191
    :goto_0
    return-void

    .line 185
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/playhaven/android/Placement;->model:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->w(Ljava/lang/Throwable;)V

    .line 188
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0
.end method
