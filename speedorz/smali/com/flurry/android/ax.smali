.class final Lcom/flurry/android/ax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic cW:Ljava/lang/String;

.field private synthetic cX:Lcom/flurry/android/CacheSyncManager;

.field private synthetic cY:Ljava/util/Vector;


# direct methods
.method constructor <init>(Lcom/flurry/android/CacheSyncManager;Ljava/lang/String;Ljava/util/Vector;)V
    .locals 0

    .prologue
    .line 247
    iput-object p1, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    iput-object p2, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/android/ax;->cY:Ljava/util/Vector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleResponse(Lcom/flurry/android/AppCloudResponse;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 251
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 254
    iget-object v0, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-static {v0}, Lcom/flurry/android/CacheSyncManager;->a(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/ao;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/ao;->getObjectById(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/caching/ObjectData;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cY:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 259
    iget-object v0, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-static {v0}, Lcom/flurry/android/CacheSyncManager;->a(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/ao;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/ao;->w(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v0

    .line 261
    iget-object v1, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-static {v1}, Lcom/flurry/android/CacheSyncManager;->b(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/at;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flurry/android/at;->b(Lcom/flurry/android/caching/ObjectData;)V

    .line 263
    iget-object v0, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-static {v0}, Lcom/flurry/android/CacheSyncManager;->c(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/cq;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/cq;->s(Ljava/lang/String;)V

    .line 265
    invoke-static {}, Lcom/flurry/android/CacheSyncManager;->b()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/AppCloudResponseHandler;

    .line 266
    if-eqz v0, :cond_0

    .line 267
    invoke-interface {v0, p1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V

    .line 269
    :cond_0
    invoke-static {}, Lcom/flurry/android/CacheSyncManager;->b()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    :goto_0
    return-void

    .line 273
    :cond_1
    const-string v0, "CacheSyncManager"

    const-string v1, "Data was changed during request to server"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object v0, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-static {v0}, Lcom/flurry/android/CacheSyncManager;->a(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/ao;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/ao;->getObjectById(Ljava/lang/String;)Lcom/flurry/android/caching/ObjectData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/caching/ObjectData;->getKeyValues()Ljava/util/Vector;

    move-result-object v2

    .line 276
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/flurry/android/ax;->cY:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    .line 277
    iget-object v0, p0, Lcom/flurry/android/ax;->cY:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 278
    iget-object v0, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-static {v0}, Lcom/flurry/android/CacheSyncManager;->a(Lcom/flurry/android/CacheSyncManager;)Lcom/flurry/android/ao;

    move-result-object v3

    iget-object v0, p0, Lcom/flurry/android/ax;->cY:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lcom/flurry/android/ax;->cY:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    iget-object v5, p0, Lcom/flurry/android/ax;->cW:Ljava/lang/String;

    invoke-virtual {v3, v4, v0, v5}, Lcom/flurry/android/ao;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    :cond_2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 282
    :cond_3
    iget-object v0, p0, Lcom/flurry/android/ax;->cX:Lcom/flurry/android/CacheSyncManager;

    invoke-virtual {v0}, Lcom/flurry/android/CacheSyncManager;->synchronize()V

    goto :goto_0

    .line 286
    :cond_4
    const-string v0, "CacheSyncManager"

    const-string v1, "MODIFY didn\'t proceed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
