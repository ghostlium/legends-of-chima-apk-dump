.class final Lcom/flurry/android/bg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic dz:Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;


# direct methods
.method constructor <init>(Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;)V
    .locals 0

    .prologue
    .line 83
    iput-object p1, p0, Lcom/flurry/android/bg;->dz:Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleResponse(Lcom/flurry/android/AppCloudResponse;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 87
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/flurry/android/bg;->dz:Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;

    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponse()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "set"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 90
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 91
    new-instance v1, Lcom/flurry/android/AppCloudObject;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudObject;-><init>(Lorg/json/JSONObject;)V

    .line 93
    iget-object v0, p0, Lcom/flurry/android/bg;->dz:Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;->onOperationSucceed(Lcom/flurry/android/AppCloudObject;)V

    .line 103
    :goto_0
    return-void

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/bg;->dz:Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0

    .line 100
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/bg;->dz:Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    const/16 v2, 0x190

    const-string v3, "Bad response"

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudGetObjectByIDResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 101
    const-string v0, "AppCloudObject"

    const-string v1, "getObjectById: response = null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
