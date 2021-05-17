.class final Lcom/flurry/android/ff;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic hg:Z

.field private synthetic hi:Lcom/flurry/android/cl;

.field private synthetic hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;


# direct methods
.method constructor <init>(Lcom/flurry/android/cl;ZLcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V
    .locals 0

    .prologue
    .line 357
    iput-object p1, p0, Lcom/flurry/android/ff;->hi:Lcom/flurry/android/cl;

    iput-boolean p2, p0, Lcom/flurry/android/ff;->hg:Z

    iput-object p3, p0, Lcom/flurry/android/ff;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

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
    .line 361
    if-eqz p1, :cond_2

    .line 362
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 364
    iget-boolean v0, p0, Lcom/flurry/android/ff;->hg:Z

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/flurry/android/ff;->hi:Lcom/flurry/android/cl;

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponse()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/cl;->createUser(Lorg/json/JSONObject;)V

    .line 371
    :goto_0
    iget-object v0, p0, Lcom/flurry/android/ff;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

    const/4 v1, 0x1

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;->onOperationSucceed(ZLjava/lang/String;)V

    .line 380
    :goto_1
    return-void

    .line 368
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/ff;->hi:Lcom/flurry/android/cl;

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponse()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/cl;->createObject(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 374
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/ff;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_1

    .line 378
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/ff;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    const/16 v2, 0x190

    const-string v3, "Bad response"

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_1
.end method
