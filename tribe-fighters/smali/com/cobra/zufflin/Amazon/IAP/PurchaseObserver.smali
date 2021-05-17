.class public Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;
.super Lcom/amazon/inapp/purchasing/BasePurchasingObserver;
.source "PurchaseObserver.java"


# static fields
.field private static synthetic $SWITCH_TABLE$com$amazon$inapp$purchasing$ItemDataResponse$ItemDataRequestStatus:[I = null

.field private static final TAG:Ljava/lang/String; = "IAPurchaseObserver"


# instance fields
.field private apiCodes:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private currentUserID:Ljava/lang/String;

.field private rvsProductionMode:Z


# direct methods
.method static synthetic $SWITCH_TABLE$com$amazon$inapp$purchasing$ItemDataResponse$ItemDataRequestStatus()[I
    .locals 3

    .prologue
    .line 22
    sget-object v0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->$SWITCH_TABLE$com$amazon$inapp$purchasing$ItemDataResponse$ItemDataRequestStatus:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->values()[Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->FAILED:Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;

    invoke-virtual {v1}, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->SUCCESSFUL:Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;

    invoke-virtual {v1}, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->SUCCESSFUL_WITH_UNAVAILABLE_SKUS:Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;

    invoke-virtual {v1}, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->$SWITCH_TABLE$com$amazon$inapp$purchasing$ItemDataResponse$ItemDataRequestStatus:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/Vector;)V
    .locals 1
    .param p1, "iapActivity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p2, "apiCodes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/amazon/inapp/purchasing/BasePurchasingObserver;-><init>(Landroid/content/Context;)V

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->rvsProductionMode:Z

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->currentUserID:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->apiCodes:Ljava/util/Vector;

    .line 37
    return-void
.end method

.method private getPersistedOffset()Lcom/amazon/inapp/purchasing/Offset;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lcom/amazon/inapp/purchasing/Offset;->BEGINNING:Lcom/amazon/inapp/purchasing/Offset;

    return-object v0
.end method


# virtual methods
.method public initiatePurchase(Ljava/lang/String;)V
    .locals 0
    .param p1, "SKU"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-static {p1}, Lcom/amazon/inapp/purchasing/PurchasingManager;->initiatePurchaseRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    return-void
.end method

.method protected native onAddProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public onGetUserIdResponse(Lcom/amazon/inapp/purchasing/GetUserIdResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/amazon/inapp/purchasing/GetUserIdResponse;

    .prologue
    .line 87
    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/GetUserIdResponse;->getUserIdRequestStatus()Lcom/amazon/inapp/purchasing/GetUserIdResponse$GetUserIdRequestStatus;

    move-result-object v0

    .line 88
    sget-object v1, Lcom/amazon/inapp/purchasing/GetUserIdResponse$GetUserIdRequestStatus;->SUCCESSFUL:Lcom/amazon/inapp/purchasing/GetUserIdResponse$GetUserIdRequestStatus;

    .line 87
    if-ne v0, v1, :cond_0

    .line 90
    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/GetUserIdResponse;->getUserId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->currentUserID:Ljava/lang/String;

    .line 91
    invoke-direct {p0}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->getPersistedOffset()Lcom/amazon/inapp/purchasing/Offset;

    move-result-object v0

    invoke-static {v0}, Lcom/amazon/inapp/purchasing/PurchasingManager;->initiatePurchaseUpdatesRequest(Lcom/amazon/inapp/purchasing/Offset;)Ljava/lang/String;

    .line 97
    :cond_0
    return-void
.end method

.method public onItemDataResponse(Lcom/amazon/inapp/purchasing/ItemDataResponse;)V
    .locals 9
    .param p1, "response"    # Lcom/amazon/inapp/purchasing/ItemDataResponse;

    .prologue
    .line 111
    invoke-static {}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->$SWITCH_TABLE$com$amazon$inapp$purchasing$ItemDataResponse$ItemDataRequestStatus()[I

    move-result-object v4

    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/ItemDataResponse;->getItemDataRequestStatus()Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;

    move-result-object v5

    invoke-virtual {v5}, Lcom/amazon/inapp/purchasing/ItemDataResponse$ItemDataRequestStatus;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 130
    :cond_0
    :pswitch_0
    return-void

    .line 113
    :pswitch_1
    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/ItemDataResponse;->getUnavailableSkus()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 118
    :pswitch_2
    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/ItemDataResponse;->getItemData()Ljava/util/Map;

    move-result-object v1

    .line 119
    .local v1, "items":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/inapp/purchasing/Item;>;"
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 120
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/inapp/purchasing/Item;

    .line 122
    .local v0, "i":Lcom/amazon/inapp/purchasing/Item;
    invoke-virtual {v0}, Lcom/amazon/inapp/purchasing/Item;->getSku()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/amazon/inapp/purchasing/Item;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lcom/amazon/inapp/purchasing/Item;->getDescription()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Lcom/amazon/inapp/purchasing/Item;->getPrice()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v5, v6, v7, v8}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->onAddProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 113
    .end local v0    # "i":Lcom/amazon/inapp/purchasing/Item;
    .end local v1    # "items":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/amazon/inapp/purchasing/Item;>;"
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 114
    .local v3, "s":Ljava/lang/String;
    const-string v5, "IAPurchaseObserver"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Unavailable SKU:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 111
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected native onPurchaseComplete(Ljava/lang/String;Z)V
.end method

.method public onPurchaseResponse(Lcom/amazon/inapp/purchasing/PurchaseResponse;)V
    .locals 5
    .param p1, "response"    # Lcom/amazon/inapp/purchasing/PurchaseResponse;

    .prologue
    .line 135
    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/PurchaseResponse;->getPurchaseRequestStatus()Lcom/amazon/inapp/purchasing/PurchaseResponse$PurchaseRequestStatus;

    move-result-object v2

    .line 137
    .local v2, "status":Lcom/amazon/inapp/purchasing/PurchaseResponse$PurchaseRequestStatus;
    sget-object v3, Lcom/amazon/inapp/purchasing/PurchaseResponse$PurchaseRequestStatus;->SUCCESSFUL:Lcom/amazon/inapp/purchasing/PurchaseResponse$PurchaseRequestStatus;

    if-ne v2, v3, :cond_0

    .line 140
    invoke-virtual {p1}, Lcom/amazon/inapp/purchasing/PurchaseResponse;->getReceipt()Lcom/amazon/inapp/purchasing/Receipt;

    move-result-object v0

    .line 142
    .local v0, "receipt":Lcom/amazon/inapp/purchasing/Receipt;
    invoke-virtual {v0}, Lcom/amazon/inapp/purchasing/Receipt;->getSku()Ljava/lang/String;

    move-result-object v1

    .line 146
    .local v1, "sku":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->onPurchaseComplete(Ljava/lang/String;Z)V

    .line 153
    .end local v0    # "receipt":Lcom/amazon/inapp/purchasing/Receipt;
    .end local v1    # "sku":Ljava/lang/String;
    :goto_0
    return-void

    .line 150
    :cond_0
    const-string v3, "IAPurchaseObserver"

    const-string v4, "onPurchaseResponse(): fail!"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    const-string v3, ""

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->onPurchaseComplete(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public onPurchaseUpdatesResponse(Lcom/amazon/inapp/purchasing/PurchaseUpdatesResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/amazon/inapp/purchasing/PurchaseUpdatesResponse;

    .prologue
    .line 157
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 48
    invoke-static {}, Lcom/amazon/inapp/purchasing/PurchasingManager;->initiateGetUserIdRequest()Ljava/lang/String;

    .line 50
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 52
    .local v1, "skuSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->apiCodes:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 58
    invoke-static {v1}, Lcom/amazon/inapp/purchasing/PurchasingManager;->initiateItemDataRequest(Ljava/util/Set;)Ljava/lang/String;

    .line 60
    return-void

    .line 55
    :cond_0
    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->apiCodes:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 52
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onSdkAvailable(Z)V
    .locals 4
    .param p1, "isSandboxMode"    # Z

    .prologue
    .line 65
    if-eqz p1, :cond_0

    .line 66
    const-string v2, "IAPurchaseObserver"

    const-string v3, "onSDKAvailable(): sandbox mode true"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_0
    if-eqz p1, :cond_1

    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->rvsProductionMode:Z

    .line 70
    invoke-static {}, Lcom/amazon/inapp/purchasing/PurchasingManager;->initiateGetUserIdRequest()Ljava/lang/String;

    .line 72
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 74
    .local v1, "skuSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->apiCodes:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt v0, v2, :cond_2

    .line 80
    invoke-static {v1}, Lcom/amazon/inapp/purchasing/PurchasingManager;->initiateItemDataRequest(Ljava/util/Set;)Ljava/lang/String;

    .line 82
    return-void

    .line 68
    .end local v0    # "i":I
    .end local v1    # "skuSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 77
    .restart local v0    # "i":I
    .restart local v1    # "skuSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->apiCodes:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
