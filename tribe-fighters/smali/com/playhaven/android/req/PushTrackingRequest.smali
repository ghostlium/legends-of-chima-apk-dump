.class public Lcom/playhaven/android/req/PushTrackingRequest;
.super Lcom/playhaven/android/req/PlayHavenRequest;
.source "PushTrackingRequest.java"


# instance fields
.field private mContentId:Ljava/lang/String;

.field private mMessageId:Ljava/lang/String;

.field private mPushToken:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message_id"    # Ljava/lang/String;
    .param p3, "content_id"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/playhaven/android/req/PlayHavenRequest;-><init>()V

    .line 34
    iput-object p2, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mMessageId:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mContentId:Ljava/lang/String;

    .line 37
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 38
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "registration_id"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mPushToken:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "registration_id"    # Ljava/lang/String;
    .param p2, "message_id"    # Ljava/lang/String;
    .param p3, "content_id"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/playhaven/android/req/PlayHavenRequest;-><init>()V

    .line 45
    iput-object p2, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mMessageId:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mContentId:Ljava/lang/String;

    .line 47
    iput-object p1, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mPushToken:Ljava/lang/String;

    .line 48
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

    .line 52
    invoke-super {p0, p1}, Lcom/playhaven/android/req/PlayHavenRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    .line 53
    .local v0, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->push_token:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mPushToken:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 54
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->message_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mMessageId:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 55
    sget-object v1, Lcom/playhaven/android/push/PushReceiver$PushParams;->content_id:Lcom/playhaven/android/push/PushReceiver$PushParams;

    invoke-virtual {v1}, Lcom/playhaven/android/push/PushReceiver$PushParams;->name()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/playhaven/android/req/PushTrackingRequest;->mContentId:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;

    .line 56
    return-object v0
.end method

.method protected getApiPath(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/PushTrackingRequest;->getCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->string:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    const-string v2, "playhaven_request_push"

    invoke-virtual {v0, p1, v1, v2}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method
