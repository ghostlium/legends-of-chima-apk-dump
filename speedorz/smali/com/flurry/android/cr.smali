.class final Lcom/flurry/android/cr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/responses/AppCloudLoginResponseHandler;


# instance fields
.field final synthetic eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

.field final synthetic eG:Ljava/lang/String;

.field final synthetic eH:Ljava/lang/String;

.field final synthetic eI:Ljava/lang/String;

.field final synthetic eJ:Z


# direct methods
.method constructor <init>(Lcom/flurry/android/responses/AppCloudLoginResponseHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 266
    iput-object p1, p0, Lcom/flurry/android/cr;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    iput-object p2, p0, Lcom/flurry/android/cr;->eG:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/android/cr;->eH:Ljava/lang/String;

    iput-object p4, p0, Lcom/flurry/android/cr;->eI:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/flurry/android/cr;->eJ:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onError(Lcom/flurry/android/responses/AppCloudError;)V
    .locals 3

    .prologue
    .line 275
    new-instance v0, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v0}, Lcom/flurry/android/AppCloudUser;-><init>()V

    .line 276
    invoke-virtual {p1}, Lcom/flurry/android/responses/AppCloudError;->getErrorCode()I

    move-result v1

    const/16 v2, 0x194

    if-ne v1, v2, :cond_0

    invoke-virtual {p1}, Lcom/flurry/android/responses/AppCloudError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "not found"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 279
    iget-object v1, p0, Lcom/flurry/android/cr;->eG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/AppCloudUser;->setUsername(Ljava/lang/String;)V

    .line 280
    iget-object v1, p0, Lcom/flurry/android/cr;->eH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/AppCloudUser;->setEmail(Ljava/lang/String;)V

    .line 281
    iget-object v1, p0, Lcom/flurry/android/cr;->eI:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/AppCloudUser;->setPassword(Ljava/lang/String;)V

    .line 284
    :try_start_0
    new-instance v1, Lcom/flurry/android/br;

    invoke-direct {v1, p0}, Lcom/flurry/android/br;-><init>(Lcom/flurry/android/cr;)V

    invoke-virtual {v0, v1}, Lcom/flurry/android/AppCloudUser;->saveOrCreateWithCompletionHandler(Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    :goto_0
    return-void

    .line 298
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 303
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/cr;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    invoke-interface {v0, p1}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    goto :goto_0
.end method

.method public final onOperationSucceed(Lcom/flurry/android/AppCloudUser;)V
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lcom/flurry/android/cr;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    invoke-interface {v0, p1}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onOperationSucceed(Lcom/flurry/android/AppCloudUser;)V

    .line 271
    return-void
.end method
