.class final Lcom/flurry/android/ez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field final synthetic hg:Z

.field final synthetic hh:Lcom/flurry/android/AppCloudResponseHandler;

.field final synthetic hi:Lcom/flurry/android/cl;


# direct methods
.method constructor <init>(Lcom/flurry/android/cl;Lcom/flurry/android/AppCloudResponseHandler;Z)V
    .locals 0

    .prologue
    .line 420
    iput-object p1, p0, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iput-object p2, p0, Lcom/flurry/android/ez;->hh:Lcom/flurry/android/AppCloudResponseHandler;

    iput-boolean p3, p0, Lcom/flurry/android/ez;->hg:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleResponse(Lcom/flurry/android/AppCloudResponse;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 424
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/android/ez;->hh:Lcom/flurry/android/AppCloudResponseHandler;

    if-eqz v0, :cond_0

    .line 425
    iget-object v0, p0, Lcom/flurry/android/ez;->hh:Lcom/flurry/android/AppCloudResponseHandler;

    invoke-interface {v0, p1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V

    .line 477
    :goto_0
    return-void

    .line 430
    :cond_0
    iget-boolean v0, p0, Lcom/flurry/android/ez;->hg:Z

    if-eqz v0, :cond_1

    .line 431
    new-instance v0, Lcom/flurry/android/caching/ObjectOperationData;

    iget-object v1, p0, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iget-object v1, v1, Lcom/flurry/android/cl;->mId:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;)V

    .line 437
    :goto_1
    invoke-static {}, Lcom/flurry/android/FlurryAppCloud;->z()Lcom/flurry/android/caching/CachingManager;

    move-result-object v1

    new-instance v2, Lcom/flurry/android/ft;

    invoke-direct {v2, p0}, Lcom/flurry/android/ft;-><init>(Lcom/flurry/android/ez;)V

    invoke-virtual {v1, v0, v2}, Lcom/flurry/android/caching/CachingManager;->getOperation(Lcom/flurry/android/caching/ObjectOperationData;Lcom/flurry/android/AppCloudResponseHandler;)V

    goto :goto_0

    .line 434
    :cond_1
    new-instance v0, Lcom/flurry/android/caching/ObjectOperationData;

    iget-object v1, p0, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iget-object v1, v1, Lcom/flurry/android/cl;->mId:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iget-object v2, v2, Lcom/flurry/android/cl;->mCollectionName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/flurry/android/caching/ObjectOperationData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
