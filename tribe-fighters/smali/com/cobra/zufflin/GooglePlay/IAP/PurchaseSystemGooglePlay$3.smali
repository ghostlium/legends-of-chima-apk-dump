.class Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;
.super Ljava/lang/Object;
.source "PurchaseSystemGooglePlay.java"

# interfaces
.implements Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnIabSetupFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;-><init>(Ljava/lang/String;Ljava/util/Vector;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabSetupFinished(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;)V
    .locals 4
    .param p1, "result"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    .prologue
    .line 49
    invoke-virtual {p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;->isSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 52
    const-string v1, "ZUFFLIN"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Problem setting up Google Play In-app Billing: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :goto_0
    return-void

    .line 58
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v1}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$1(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/util/Vector;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 59
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v1}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$8(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    iget-object v3, v3, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->availableInventoryFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

    invoke-virtual {v1, v2, v0, v3}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;)V

    goto :goto_0
.end method
