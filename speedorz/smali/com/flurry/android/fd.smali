.class final Lcom/flurry/android/fd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/AppCloudResponseHandler;


# instance fields
.field private synthetic hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;


# direct methods
.method constructor <init>(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V
    .locals 0

    .prologue
    .line 384
    iput-object p1, p0, Lcom/flurry/android/fd;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

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
    .line 388
    if-eqz p1, :cond_1

    .line 389
    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 390
    iget-object v0, p0, Lcom/flurry/android/fd;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;->onOperationSucceed(ZLjava/lang/String;)V

    .line 399
    :goto_0
    return-void

    .line 393
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/fd;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getHTTPResponseCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/flurry/android/AppCloudResponse;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0

    .line 397
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/fd;->hp:Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;

    new-instance v1, Lcom/flurry/android/responses/AppCloudError;

    const/16 v2, 0x190

    const-string v3, "Bad response"

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/responses/AppCloudError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0
.end method
