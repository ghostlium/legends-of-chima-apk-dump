.class public Lcom/playhaven/android/req/SubcontentRequest;
.super Lcom/playhaven/android/req/PlayHavenRequest;
.source "SubcontentRequest.java"


# instance fields
.field private mDispatchContext:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "dispatchContext"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/playhaven/android/req/PlayHavenRequest;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/playhaven/android/req/SubcontentRequest;->mDispatchContext:Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method protected createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-super {p0, p1}, Lcom/playhaven/android/req/PlayHavenRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v1

    .line 51
    .local v1, "builder":Lorg/springframework/web/util/UriComponentsBuilder;
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/playhaven/android/req/SubcontentRequest;->mDispatchContext:Ljava/lang/String;

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v6, "additional_parameters"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 52
    .local v0, "addlParams":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 53
    .local v4, "paramKeys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const/4 v3, 0x0

    .line 54
    .local v3, "key":Ljava/lang/String;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 62
    .end local v0    # "addlParams":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "paramKeys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_1
    return-object v1

    .line 55
    .restart local v0    # "addlParams":Lorg/json/JSONObject;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v4    # "paramKeys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "key":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 56
    .restart local v3    # "key":Ljava/lang/String;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v1, v3, v5}, Lorg/springframework/web/util/UriComponentsBuilder;->queryParam(Ljava/lang/String;[Ljava/lang/Object;)Lorg/springframework/web/util/UriComponentsBuilder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 58
    .end local v0    # "addlParams":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "paramKeys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_0
    move-exception v2

    .line 60
    .local v2, "e":Lorg/json/JSONException;
    invoke-static {v2}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method protected getApiPath(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/SubcontentRequest;->getCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v0

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->string:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    const-string v2, "playhaven_request_subcontent"

    invoke-virtual {v0, p1, v1, v2}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lcom/playhaven/android/req/SubcontentRequest;->createUrl(Landroid/content/Context;)Lorg/springframework/web/util/UriComponentsBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/web/util/UriComponentsBuilder;->build()Lorg/springframework/web/util/UriComponents;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/web/util/UriComponents;->encode()Lorg/springframework/web/util/UriComponents;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/web/util/UriComponents;->toUriString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
