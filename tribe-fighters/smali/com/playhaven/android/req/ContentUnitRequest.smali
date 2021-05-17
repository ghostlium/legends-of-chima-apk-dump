.class public Lcom/playhaven/android/req/ContentUnitRequest;
.super Lcom/playhaven/android/req/ContentRequest;
.source "ContentUnitRequest.java"


# instance fields
.field private contentUnitId:Ljava/lang/String;

.field private messageId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "placementTag"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/playhaven/android/req/ContentRequest;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method


# virtual methods
.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 33
    invoke-super {p0, p1}, Lcom/playhaven/android/req/ContentRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    .line 34
    .local v0, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/playhaven/android/req/ContentUnitRequest;->messageId:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 35
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->content_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/playhaven/android/req/ContentUnitRequest;->contentUnitId:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 36
    return-object v0
.end method

.method public getContentUnitId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/playhaven/android/req/ContentUnitRequest;->contentUnitId:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/playhaven/android/req/ContentUnitRequest;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public setContentUnitId(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentUnitId"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/playhaven/android/req/ContentUnitRequest;->contentUnitId:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/playhaven/android/req/ContentUnitRequest;->messageId:Ljava/lang/String;

    .line 45
    return-void
.end method
