.class final Lcom/flurry/android/cn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic eE:Ljava/lang/String;

.field private synthetic eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/flurry/android/responses/AppCloudLoginResponseHandler;)V
    .locals 0

    .prologue
    .line 178
    iput-object p1, p0, Lcom/flurry/android/cn;->eE:Ljava/lang/String;

    iput-object p2, p0, Lcom/flurry/android/cn;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

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
    .line 184
    if-eqz p1, :cond_1

    .line 187
    :try_start_0
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p1, Lcom/flurry/android/AppCloudResponse;->bX:Lorg/json/JSONObject;

    const-string v1, "set"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 190
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 191
    new-instance v1, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v1, v0}, Lcom/flurry/android/AppCloudUser;-><init>(Lorg/json/JSONObject;)V

    .line 192
    iput-object v1, p1, Lcom/flurry/android/AppCloudResponse;->bW:Lcom/flurry/android/AppCloudUser;

    .line 193
    const-string v2, "Trestle"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Login user"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    invoke-static {v1}, Lcom/flurry/android/AppCloudUser;->setCurrentUser(Lcom/flurry/android/AppCloudUser;)V

    .line 196
    const-string v2, "_id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 197
    const-string v3, "username"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 198
    const-string v4, "email"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 199
    iget-object v4, p1, Lcom/flurry/android/AppCloudResponse;->bX:Lorg/json/JSONObject;

    const-string v5, "APPCLOUD_USER_SESSION"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 201
    invoke-static {v2}, Lcom/flurry/android/dy;->y(Ljava/lang/String;)V

    .line 202
    invoke-static {v3, v0, v4}, Lcom/flurry/android/dy;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    iget-object v0, p0, Lcom/flurry/android/cn;->eE:Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/android/dy;->z(Ljava/lang/String;)V

    .line 206
    iget-object v0, p0, Lcom/flurry/android/cn;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onOperationSucceed(Lcom/flurry/android/AppCloudUser;)V

    .line 220
    :goto_0
    return-void

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/cn;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 210
    const-string v0, "Trestle"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Login Fail: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 212
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 218
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/cn;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    const/16 v2, 0x190

    const-string v3, "Bad response"

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0
.end method
