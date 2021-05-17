.class final Lcom/flurry/android/br;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/responses/AppCloudApplyOperationResonseHandler;


# instance fields
.field private synthetic dJ:Lcom/flurry/android/cr;


# direct methods
.method constructor <init>(Lcom/flurry/android/cr;)V
    .locals 0

    .prologue
    .line 284
    iput-object p1, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onError(Lcom/flurry/android/responses/AppCloudError;)V
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    iget-object v0, v0, Lcom/flurry/android/cr;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    invoke-interface {v0, p1}, Lcom/flurry/android/responses/AppCloudLoginResponseHandler;->onError(Lcom/flurry/android/responses/AppCloudError;)V

    .line 296
    return-void
.end method

.method public final onOperationSucceed(ZLjava/lang/String;)V
    .locals 5

    .prologue
    .line 288
    const-string v0, "Created in local cache."

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 289
    iget-object v0, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    iget-object v0, v0, Lcom/flurry/android/cr;->eG:Ljava/lang/String;

    iget-object v1, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    iget-object v1, v1, Lcom/flurry/android/cr;->eI:Ljava/lang/String;

    iget-object v2, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    iget-object v2, v2, Lcom/flurry/android/cr;->eH:Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    iget-boolean v3, v3, Lcom/flurry/android/cr;->eJ:Z

    iget-object v4, p0, Lcom/flurry/android/br;->dJ:Lcom/flurry/android/cr;

    iget-object v4, v4, Lcom/flurry/android/cr;->eF:Lcom/flurry/android/responses/AppCloudLoginResponseHandler;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/flurry/android/AppCloudUser;->loginUserWithName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/flurry/android/responses/AppCloudLoginResponseHandler;)V

    .line 291
    :cond_0
    return-void
.end method
