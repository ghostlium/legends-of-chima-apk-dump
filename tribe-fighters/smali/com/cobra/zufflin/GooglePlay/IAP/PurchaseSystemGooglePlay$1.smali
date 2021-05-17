.class Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;
.super Ljava/lang/Object;
.source "PurchaseSystemGooglePlay.java"

# interfaces
.implements Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;
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
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryInventoryFinished(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;)V
    .locals 8
    .param p1, "result"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;
    .param p2, "inv"    # Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;

    .prologue
    const/4 v4, 0x1

    .line 83
    invoke-virtual {p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabResult;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 85
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v3, v4}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$0(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Z)V

    .line 86
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v3}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$1(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 96
    invoke-virtual {p2}, Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;->getAllPurchases()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    .line 102
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v3}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$3(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4

    .line 104
    :try_start_0
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    const/4 v5, 0x1

    invoke-static {v3, v5}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$4(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Z)V

    .line 105
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v3}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$5(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 106
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v3}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$6(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V

    .line 102
    :cond_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    :goto_2
    return-void

    .line 86
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 88
    .local v2, "skuName":Ljava/lang/String;
    invoke-virtual {p2, v2}, Lcom/cobra/zufflin/GooglePlay/IAP/util/Inventory;->getSkuDetails(Ljava/lang/String;)Lcom/cobra/zufflin/GooglePlay/IAP/util/SkuDetails;

    move-result-object v1

    .line 89
    .local v1, "sku":Lcom/cobra/zufflin/GooglePlay/IAP/util/SkuDetails;
    if-eqz v1, :cond_0

    .line 91
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-virtual {v1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/SkuDetails;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/SkuDetails;->getDescription()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v2, v5, v6, v7}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->onAddProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 96
    .end local v1    # "sku":Lcom/cobra/zufflin/GooglePlay/IAP/util/SkuDetails;
    .end local v2    # "skuName":Ljava/lang/String;
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;

    .line 98
    .local v0, "p":Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    invoke-static {v4}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->access$2(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/util/Vector;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 102
    .end local v0    # "p":Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 111
    :cond_4
    const-string v3, "ZUFFLIN"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Query Inventory failed: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method
