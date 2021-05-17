.class public Lcom/prime31/GoogleIABPlugin;
.super Lcom/prime31/GoogleIABPluginBase;
.source "GoogleIABPlugin.java"

# interfaces
.implements Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;
.implements Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;
.implements Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;
.implements Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;


# static fields
.field static final RC_REQUEST:I = 0x2711


# instance fields
.field private _purchases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/prime31/util/Purchase;",
            ">;"
        }
    .end annotation
.end field

.field public helper:Lcom/prime31/util/IabHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/prime31/GoogleIABPluginBase;-><init>()V

    return-void
.end method

.method private getPurchasedProductForSku(Ljava/lang/String;)Lcom/prime31/util/Purchase;
    .locals 3
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 36
    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 42
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 36
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/prime31/util/Purchase;

    .line 38
    .local v0, "p":Lcom/prime31/util/Purchase;
    invoke-virtual {v0}, Lcom/prime31/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method


# virtual methods
.method public consumeProduct(Ljava/lang/String;)V
    .locals 4
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "consumeProduct"

    invoke-static {v1, v2, p1}, Lcom/prime31/IABConstants;->logEntering(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 155
    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    if-nez v1, :cond_0

    .line 157
    const-string v1, "Prime31"

    const-string v2, "The billing service is not running"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 164
    :cond_1
    const-string v1, "Prime31"

    const-string v2, "there are no purchases available to consume"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 169
    :cond_2
    invoke-direct {p0, p1}, Lcom/prime31/GoogleIABPlugin;->getPurchasedProductForSku(Ljava/lang/String;)Lcom/prime31/util/Purchase;

    move-result-object v0

    .line 170
    .local v0, "p":Lcom/prime31/util/Purchase;
    if-nez v0, :cond_3

    .line 172
    const-string v1, "Prime31"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Attempting to consume an item that has not been purchased. Aborting to avoid exception. sku: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 176
    :cond_3
    invoke-virtual {p0}, Lcom/prime31/GoogleIABPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/prime31/GoogleIABPlugin$4;

    invoke-direct {v2, p0, v0}, Lcom/prime31/GoogleIABPlugin$4;-><init>(Lcom/prime31/GoogleIABPlugin;Lcom/prime31/util/Purchase;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public consumeProducts([Ljava/lang/String;)V
    .locals 6
    .param p1, "skus"    # [Ljava/lang/String;

    .prologue
    .line 188
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "consumeProducts"

    invoke-static {v3, v4, p1}, Lcom/prime31/IABConstants;->logEntering(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 190
    iget-object v3, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    if-nez v3, :cond_0

    .line 192
    const-string v3, "Prime31"

    const-string v4, "The billing service is not running"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    :goto_0
    return-void

    .line 197
    :cond_0
    iget-object v3, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 199
    :cond_1
    const-string v3, "Prime31"

    const-string v4, "there are no purchases available to consume"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 204
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v0, "confirmedPurchases":Ljava/util/List;, "Ljava/util/List<Lcom/prime31/util/Purchase;>;"
    array-length v4, p1

    const/4 v3, 0x0

    :goto_1
    if-lt v3, v4, :cond_3

    .line 212
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    array-length v4, p1

    if-eq v3, v4, :cond_5

    .line 214
    const-string v3, "Prime31"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Attempting to consume "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " item(s) but only "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " item(s) were found to be purchased. Aborting."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 205
    :cond_3
    aget-object v2, p1, v3

    .line 207
    .local v2, "sku":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/prime31/GoogleIABPlugin;->getPurchasedProductForSku(Ljava/lang/String;)Lcom/prime31/util/Purchase;

    move-result-object v1

    .line 208
    .local v1, "p":Lcom/prime31/util/Purchase;
    if-eqz v1, :cond_4

    .line 209
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 218
    .end local v1    # "p":Lcom/prime31/util/Purchase;
    .end local v2    # "sku":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lcom/prime31/GoogleIABPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lcom/prime31/GoogleIABPlugin$5;

    invoke-direct {v4, p0, v0}, Lcom/prime31/GoogleIABPlugin$5;-><init>(Lcom/prime31/GoogleIABPlugin;Ljava/util/List;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public enableLogging(Z)V
    .locals 0
    .param p1, "shouldEnable"    # Z

    .prologue
    .line 51
    sput-boolean p1, Lcom/prime31/IABConstants;->DEBUG:Z

    .line 52
    return-void
.end method

.method public init(Ljava/lang/String;)V
    .locals 2
    .param p1, "publicKey"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "init"

    invoke-static {v0, v1, p1}, Lcom/prime31/IABConstants;->logEntering(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    .line 66
    new-instance v0, Lcom/prime31/util/IabHelper;

    invoke-virtual {p0}, Lcom/prime31/GoogleIABPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/prime31/util/IabHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    .line 67
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    new-instance v1, Lcom/prime31/GoogleIABPlugin$1;

    invoke-direct {v1, p0}, Lcom/prime31/GoogleIABPlugin$1;-><init>(Lcom/prime31/GoogleIABPlugin;)V

    invoke-virtual {v0, v1}, Lcom/prime31/util/IabHelper;->startSetup(Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;)V

    .line 83
    return-void
.end method

.method public onConsumeFinished(Lcom/prime31/util/Purchase;Lcom/prime31/util/IabResult;)V
    .locals 4
    .param p1, "purchase"    # Lcom/prime31/util/Purchase;
    .param p2, "result"    # Lcom/prime31/util/IabResult;

    .prologue
    .line 290
    invoke-virtual {p2}, Lcom/prime31/util/IabResult;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 292
    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 293
    const-string v1, "GoogleIABManager"

    const-string v2, "consumePurchaseSucceeded"

    invoke-virtual {p1}, Lcom/prime31/util/Purchase;->toJson()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v2, v3}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    :goto_0
    return-void

    .line 297
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/prime31/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/prime31/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 298
    .local v0, "res":Ljava/lang/String;
    const-string v1, "GoogleIABManager"

    const-string v2, "consumePurchaseFailed"

    invoke-virtual {p0, v1, v2, v0}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onConsumeMultiFinished(Ljava/util/List;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/prime31/util/Purchase;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/prime31/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 309
    .local p1, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/prime31/util/Purchase;>;"
    .local p2, "results":Ljava/util/List;, "Ljava/util/List<Lcom/prime31/util/IabResult;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-lt v0, v4, :cond_0

    .line 325
    return-void

    .line 311
    :cond_0
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/prime31/util/IabResult;

    .line 312
    .local v3, "result":Lcom/prime31/util/IabResult;
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/prime31/util/Purchase;

    .line 314
    .local v1, "purchase":Lcom/prime31/util/Purchase;
    invoke-virtual {v3}, Lcom/prime31/util/IabResult;->isSuccess()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 316
    iget-object v4, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 317
    const-string v4, "GoogleIABManager"

    const-string v5, "consumePurchaseSucceeded"

    invoke-virtual {v1}, Lcom/prime31/util/Purchase;->toJson()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 321
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/prime31/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/prime31/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 322
    .local v2, "res":Ljava/lang/String;
    const-string v4, "GoogleIABManager"

    const-string v5, "consumePurchaseFailed"

    invoke-virtual {p0, v4, v5, v2}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onIabPurchaseCompleteAwaitingVerification(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "purchaseData"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 256
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 257
    .local v1, "json":Lorg/json/JSONObject;
    const-string v2, "purchaseData"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 258
    const-string v2, "signature"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    const-string v2, "GoogleIABManager"

    const-string v3, "purchaseCompleteAwaitingVerification"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    .end local v1    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 262
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "Prime31"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "failed to create JSON packet: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V
    .locals 3
    .param p1, "result"    # Lcom/prime31/util/IabResult;
    .param p2, "info"    # Lcom/prime31/util/Purchase;

    .prologue
    .line 272
    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    const-string v0, "GoogleIABManager"

    const-string v1, "purchaseSucceeded"

    invoke-virtual {p2}, Lcom/prime31/util/Purchase;->toJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    :goto_0
    return-void

    .line 279
    :cond_0
    const-string v0, "GoogleIABManager"

    const-string v1, "purchaseFailed"

    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onQueryInventoryFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Inventory;)V
    .locals 3
    .param p1, "result"    # Lcom/prime31/util/IabResult;
    .param p2, "inv"    # Lcom/prime31/util/Inventory;

    .prologue
    .line 235
    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 238
    invoke-virtual {p2}, Lcom/prime31/util/Inventory;->getAllPurchases()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    .line 239
    const-string v0, "GoogleIABManager"

    const-string v1, "queryInventorySucceeded"

    invoke-virtual {p2}, Lcom/prime31/util/Inventory;->getAllSkusAndPurchasesAsJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    :goto_0
    return-void

    .line 243
    :cond_0
    const-string v0, "GoogleIABManager"

    const-string v1, "queryInventoryFailed"

    invoke-virtual {p1}, Lcom/prime31/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/prime31/GoogleIABPlugin;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public purchaseProduct(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "sku"    # Ljava/lang/String;
    .param p2, "developerPayload"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "purchaseProduct"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {v1, v2, v3}, Lcom/prime31/IABConstants;->logEntering(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 122
    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    if-nez v1, :cond_0

    .line 124
    const-string v1, "Prime31"

    const-string v2, "The billing service is not running"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :goto_0
    return-void

    .line 129
    :cond_0
    iget-object v1, p0, Lcom/prime31/GoogleIABPlugin;->_purchases:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 138
    invoke-virtual {p0}, Lcom/prime31/GoogleIABPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/prime31/GoogleIABPlugin$3;

    invoke-direct {v2, p0, p1, p2}, Lcom/prime31/GoogleIABPlugin$3;-><init>(Lcom/prime31/GoogleIABPlugin;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 129
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/prime31/util/Purchase;

    .line 131
    .local v0, "p":Lcom/prime31/util/Purchase;
    invoke-virtual {v0}, Lcom/prime31/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 133
    const-string v1, "Prime31"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Attempting to purchase an item that has already been purchased. Aborting to avoid exception. sku: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public queryInventory([Ljava/lang/String;)V
    .locals 2
    .param p1, "skus"    # [Ljava/lang/String;

    .prologue
    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "queryInventory"

    invoke-static {v0, v1, p1}, Lcom/prime31/IABConstants;->logEntering(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    if-nez v0, :cond_0

    .line 104
    const-string v0, "Prime31"

    const-string v1, "The billing service is not running"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    :goto_0
    return-void

    .line 108
    :cond_0
    invoke-virtual {p0}, Lcom/prime31/GoogleIABPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/prime31/GoogleIABPlugin$2;

    invoke-direct {v1, p0, p1}, Lcom/prime31/GoogleIABPlugin$2;-><init>(Lcom/prime31/GoogleIABPlugin;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public setAutoVerifySignatures(Z)V
    .locals 0
    .param p1, "shouldVerify"    # Z

    .prologue
    .line 57
    sput-boolean p1, Lcom/prime31/util/IabHelper;->autoVerifySignatures:Z

    .line 58
    return-void
.end method

.method public unbindService()V
    .locals 2

    .prologue
    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "unbindService"

    invoke-static {v0, v1}, Lcom/prime31/IABConstants;->logEntering(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    invoke-virtual {v0}, Lcom/prime31/util/IabHelper;->dispose()V

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/prime31/GoogleIABPlugin;->helper:Lcom/prime31/util/IabHelper;

    .line 95
    :cond_0
    return-void
.end method
