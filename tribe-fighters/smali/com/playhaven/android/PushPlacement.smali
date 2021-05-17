.class public Lcom/playhaven/android/PushPlacement;
.super Lcom/playhaven/android/Placement;
.source "PushPlacement.java"


# instance fields
.field private contentUnitId:Ljava/lang/String;

.field private messageId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/playhaven/android/Placement;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method


# virtual methods
.method public getMessageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/playhaven/android/PushPlacement;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public preload(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 49
    iget-boolean v2, p0, Lcom/playhaven/android/PushPlacement;->isLoading:Z

    if-eqz v2, :cond_0

    .line 64
    :goto_0
    return-void

    .line 50
    :cond_0
    iput-boolean v3, p0, Lcom/playhaven/android/PushPlacement;->isLoading:Z

    .line 53
    :try_start_0
    iget-object v2, p0, Lcom/playhaven/android/PushPlacement;->cache:Lcom/playhaven/android/cache/Cache;

    if-nez v2, :cond_1

    new-instance v2, Lcom/playhaven/android/cache/Cache;

    invoke-direct {v2, p1}, Lcom/playhaven/android/cache/Cache;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/playhaven/android/PushPlacement;->cache:Lcom/playhaven/android/cache/Cache;
    :try_end_0
    .catch Lcom/playhaven/android/PlayHavenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :cond_1
    :goto_1
    new-instance v0, Lcom/playhaven/android/req/ContentUnitRequest;

    iget-object v2, p0, Lcom/playhaven/android/PushPlacement;->placementTag:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/playhaven/android/req/ContentUnitRequest;-><init>(Ljava/lang/String;)V

    .line 59
    .local v0, "content":Lcom/playhaven/android/req/ContentUnitRequest;
    iget-object v2, p0, Lcom/playhaven/android/PushPlacement;->messageId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/playhaven/android/req/ContentUnitRequest;->setMessageId(Ljava/lang/String;)V

    .line 60
    iget-object v2, p0, Lcom/playhaven/android/PushPlacement;->contentUnitId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/playhaven/android/req/ContentUnitRequest;->setContentUnitId(Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0, v3}, Lcom/playhaven/android/req/ContentUnitRequest;->setPreload(Z)V

    .line 62
    invoke-virtual {v0, p0}, Lcom/playhaven/android/req/ContentUnitRequest;->setResponseHandler(Lcom/playhaven/android/req/RequestListener;)V

    .line 63
    invoke-virtual {v0, p1}, Lcom/playhaven/android/req/ContentUnitRequest;->send(Landroid/content/Context;)V

    goto :goto_0

    .line 54
    .end local v0    # "content":Lcom/playhaven/android/req/ContentUnitRequest;
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Lcom/playhaven/android/PlayHavenException;
    invoke-virtual {p0, v1}, Lcom/playhaven/android/PushPlacement;->contentFailed(Lcom/playhaven/android/PlayHavenException;)V

    goto :goto_1
.end method

.method public setContentUnitId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/playhaven/android/PushPlacement;->contentUnitId:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/playhaven/android/PushPlacement;->messageId:Ljava/lang/String;

    .line 33
    return-void
.end method
