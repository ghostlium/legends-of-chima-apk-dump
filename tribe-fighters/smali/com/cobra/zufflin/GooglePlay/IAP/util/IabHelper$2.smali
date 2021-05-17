.class Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

.field private final synthetic val$handler:Landroid/os/Handler;

.field private final synthetic val$listener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

.field private final synthetic val$moreSkus:Ljava/util/List;

.field private final synthetic val$querySkuDetails:Z


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;ZLjava/util/List;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;Landroid/os/Handler;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    iput-boolean p2, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$querySkuDetails:Z

    iput-object p3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$moreSkus:Ljava/util/List;

    iput-object p4, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$listener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

    iput-object p5, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$handler:Landroid/os/Handler;

    .line 612
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 614
    new-instance v3, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    const/4 v5, 0x0

    const-string v6, "Inventory refresh successful."

    invoke-direct {v3, v5, v6}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 615
    .local v3, "result":Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    const/4 v1, 0x0

    .line 617
    .local v1, "inv":Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;
    :try_start_0
    iget-object v5, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    iget-boolean v6, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$querySkuDetails:Z

    iget-object v7, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$moreSkus:Ljava/util/List;

    invoke-virtual {v5, v6, v7}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->queryInventory(ZLjava/util/List;)Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;
    :try_end_0
    .catch Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 623
    :goto_0
    iget-object v5, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    invoke-virtual {v5}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->flagEndAsync()V

    .line 625
    move-object v4, v3

    .line 626
    .local v4, "result_f":Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    move-object v2, v1

    .line 627
    .local v2, "inv_f":Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;
    iget-object v5, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    iget-boolean v5, v5, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->mDisposed:Z

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$listener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

    if-eqz v5, :cond_0

    .line 628
    iget-object v5, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$handler:Landroid/os/Handler;

    new-instance v6, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2$1;

    iget-object v7, p0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;->val$listener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

    invoke-direct {v6, p0, v7, v4, v2}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2$1;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$2;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;)V

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 634
    :cond_0
    return-void

    .line 619
    .end local v2    # "inv_f":Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;
    .end local v4    # "result_f":Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    :catch_0
    move-exception v0

    .line 620
    .local v0, "ex":Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;
    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabException;->getResult()Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;

    move-result-object v3

    goto :goto_0
.end method
