.class final Lcom/flurry/android/ft;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic hS:Lcom/flurry/android/ez;


# direct methods
.method constructor <init>(Lcom/flurry/android/ez;)V
    .locals 0

    .prologue
    .line 437
    iput-object p1, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

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
    const/4 v0, 0x0

    .line 441
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 442
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponse()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "set"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 443
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 444
    iget-object v2, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

    iget-boolean v2, v2, Lcom/flurry/android/ez;->hg:Z

    if-eqz v2, :cond_0

    .line 446
    new-instance v2, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v2, v1}, Lcom/flurry/android/AppCloudUser;-><init>(Lorg/json/JSONObject;)V

    move v1, v0

    .line 448
    :goto_0
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudUser;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    .line 450
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudUser;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    .line 451
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudUser;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 452
    iget-object v4, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

    iget-object v4, v4, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iget-object v4, v4, Lcom/flurry/android/cl;->paramMap:Ljava/util/HashMap;

    invoke-virtual {v4, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    invoke-static {}, Lcom/flurry/android/FlurryAppCloud;->B()Lcom/flurry/android/en;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

    iget-object v5, v5, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iget-object v5, v5, Lcom/flurry/android/cl;->mId:Ljava/lang/String;

    invoke-virtual {v4, v3, v0, v5}, Lcom/flurry/android/en;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 457
    :cond_0
    new-instance v2, Lcom/flurry/android/AppCloudObject;

    invoke-direct {v2, v1}, Lcom/flurry/android/AppCloudObject;-><init>(Lorg/json/JSONObject;)V

    .line 458
    invoke-virtual {p1, v2}, Lcom/flurry/android/AppCloudResponse;->setObject(Lcom/flurry/android/AppCloudObject;)V

    .line 460
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudObject;->saveToCache()V

    move v1, v0

    .line 462
    :goto_1
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudObject;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    .line 464
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudObject;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    .line 465
    invoke-virtual {v2}, Lcom/flurry/android/AppCloudObject;->getKeyValues()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 466
    iget-object v4, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

    iget-object v4, v4, Lcom/flurry/android/ez;->hi:Lcom/flurry/android/cl;

    iget-object v4, v4, Lcom/flurry/android/cl;->paramMap:Ljava/util/HashMap;

    invoke-virtual {v4, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 471
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

    iget-object v0, v0, Lcom/flurry/android/ez;->hh:Lcom/flurry/android/AppCloudResponseHandler;

    if-eqz v0, :cond_2

    .line 472
    iget-object v0, p0, Lcom/flurry/android/ft;->hS:Lcom/flurry/android/ez;

    iget-object v0, v0, Lcom/flurry/android/ez;->hh:Lcom/flurry/android/AppCloudResponseHandler;

    invoke-interface {v0, p1}, Lcom/flurry/android/AppCloudResponseHandler;->handleResponse(Lcom/flurry/android/AppCloudResponse;)V

    .line 473
    :cond_2
    return-void
.end method
