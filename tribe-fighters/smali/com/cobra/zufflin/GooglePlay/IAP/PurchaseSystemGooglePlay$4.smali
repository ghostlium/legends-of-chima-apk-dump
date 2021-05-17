.class Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;
.super Ljava/lang/Object;
.source "PurchaseSystemGooglePlay.java"

# interfaces
.implements Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnIabPurchaseFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->purchase(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

.field private final synthetic val$apiCode:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;->val$apiCode:Ljava/lang/String;

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIabPurchaseFinished(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;)V
    .locals 3
    .param p1, "result"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    .param p2, "purchase"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;

    .prologue
    .line 179
    invoke-virtual {p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v0}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$8(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    iget-object v1, v1, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->consumeFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;

    invoke-virtual {v0, p2, v1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->consumeAsync(Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;)V

    .line 189
    :goto_0
    return-void

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;->val$apiCode:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;->isSuccess()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$7(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;Z)V

    goto :goto_0
.end method
