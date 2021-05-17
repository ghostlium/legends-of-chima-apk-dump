.class Lcom/prime31/FlurryPlugin$13;
.super Ljava/lang/Object;
.source "FlurryPlugin.java"

# interfaces
.implements Lcom/flurry/android/responses/AppCloudCommonOperationResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/FlurryPlugin;->decrementCurrency(Ljava/lang/String;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/FlurryPlugin;

.field private final synthetic val$currency:Ljava/lang/String;

.field private final synthetic val$user:Lcom/flurry/android/AppCloudUser;


# direct methods
.method constructor <init>(Lcom/prime31/FlurryPlugin;Ljava/lang/String;Lcom/flurry/android/AppCloudUser;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/FlurryPlugin$13;->this$0:Lcom/prime31/FlurryPlugin;

    iput-object p2, p0, Lcom/prime31/FlurryPlugin$13;->val$currency:Ljava/lang/String;

    iput-object p3, p0, Lcom/prime31/FlurryPlugin$13;->val$user:Lcom/flurry/android/AppCloudUser;

    .line 339
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/flurry/android/responses/AppCloudError;)V
    .locals 3
    .param p1, "error"    # Lcom/flurry/android/responses/AppCloudError;

    .prologue
    .line 344
    iget-object v0, p0, Lcom/prime31/FlurryPlugin$13;->this$0:Lcom/prime31/FlurryPlugin;

    const-string v1, "onCurrencyValueFailedToUpdate"

    invoke-virtual {p1}, Lcom/flurry/android/responses/AppCloudError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/prime31/FlurryPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    return-void
.end method

.method public onOperationSucceed()V
    .locals 4

    .prologue
    .line 350
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/prime31/FlurryPlugin$13;->val$currency:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/prime31/FlurryPlugin$13;->val$user:Lcom/flurry/android/AppCloudUser;

    iget-object v3, p0, Lcom/prime31/FlurryPlugin$13;->val$currency:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/flurry/android/AppCloudUser;->getFloat(Ljava/lang/String;)F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 351
    .local v0, "response":Ljava/lang/String;
    iget-object v1, p0, Lcom/prime31/FlurryPlugin$13;->this$0:Lcom/prime31/FlurryPlugin;

    const-string v2, "onCurrencyValueUpdated"

    invoke-virtual {v1, v2, v0}, Lcom/prime31/FlurryPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    return-void
.end method
