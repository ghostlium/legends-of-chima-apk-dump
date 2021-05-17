.class public Lcom/prime31/util/IabHelper;
.super Ljava/lang/Object;
.source "IabHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;,
        Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;,
        Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;,
        Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;,
        Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;
    }
.end annotation


# static fields
.field public static final BILLING_RESPONSE_RESULT_BILLING_UNAVAILABLE:I = 0x3

.field public static final BILLING_RESPONSE_RESULT_DEVELOPER_ERROR:I = 0x5

.field public static final BILLING_RESPONSE_RESULT_ERROR:I = 0x6

.field public static final BILLING_RESPONSE_RESULT_ITEM_ALREADY_OWNED:I = 0x7

.field public static final BILLING_RESPONSE_RESULT_ITEM_NOT_OWNED:I = 0x8

.field public static final BILLING_RESPONSE_RESULT_ITEM_UNAVAILABLE:I = 0x4

.field public static final BILLING_RESPONSE_RESULT_OK:I = 0x0

.field public static final BILLING_RESPONSE_RESULT_USER_CANCELED:I = 0x1

.field public static final GET_SKU_DETAILS_ITEM_LIST:Ljava/lang/String; = "ITEM_ID_LIST"

.field public static final GET_SKU_DETAILS_ITEM_TYPE_LIST:Ljava/lang/String; = "ITEM_TYPE_LIST"

.field public static final IABHELPER_BAD_RESPONSE:I = -0x3ea

.field public static final IABHELPER_ERROR_BASE:I = -0x3e8

.field public static final IABHELPER_MISSING_TOKEN:I = -0x3ef

.field public static final IABHELPER_REMOTE_EXCEPTION:I = -0x3e9

.field public static final IABHELPER_SEND_INTENT_FAILED:I = -0x3ec

.field public static final IABHELPER_UNKNOWN_ERROR:I = -0x3f0

.field public static final IABHELPER_UNKNOWN_PURCHASE_RESPONSE:I = -0x3ee

.field public static final IABHELPER_USER_CANCELLED:I = -0x3ed

.field public static final IABHELPER_VERIFICATION_FAILED:I = -0x3eb

.field public static final INAPP_CONTINUATION_TOKEN:Ljava/lang/String; = "INAPP_CONTINUATION_TOKEN"

.field public static final ITEM_TYPE_INAPP:Ljava/lang/String; = "inapp"

.field public static final RESPONSE_BUY_INTENT:Ljava/lang/String; = "BUY_INTENT"

.field public static final RESPONSE_CODE:Ljava/lang/String; = "RESPONSE_CODE"

.field public static final RESPONSE_GET_SKU_DETAILS_LIST:Ljava/lang/String; = "DETAILS_LIST"

.field public static final RESPONSE_INAPP_ITEM_LIST:Ljava/lang/String; = "INAPP_PURCHASE_ITEM_LIST"

.field public static final RESPONSE_INAPP_PURCHASE_DATA:Ljava/lang/String; = "INAPP_PURCHASE_DATA"

.field public static final RESPONSE_INAPP_PURCHASE_DATA_LIST:Ljava/lang/String; = "INAPP_PURCHASE_DATA_LIST"

.field public static final RESPONSE_INAPP_SIGNATURE:Ljava/lang/String; = "INAPP_DATA_SIGNATURE"

.field public static final RESPONSE_INAPP_SIGNATURE_LIST:Ljava/lang/String; = "INAPP_DATA_SIGNATURE_LIST"

.field static final TAG:Ljava/lang/String; = "Prime31-IABH"

.field public static autoVerifySignatures:Z


# instance fields
.field _asyncInProgress:Z

.field _asyncOperation:Ljava/lang/String;

.field _context:Landroid/content/Context;

.field _purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

.field _requestCode:I

.field _service:Lcom/android/vending/billing/IInAppBillingService;

.field _serviceConn:Landroid/content/ServiceConnection;

.field _setupDone:Z

.field _signatureBase64:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x1

    sput-boolean v0, Lcom/prime31/util/IabHelper;->autoVerifySignatures:Z

    .line 156
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "base64PublicKey"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput-boolean v0, p0, Lcom/prime31/util/IabHelper;->_setupDone:Z

    .line 100
    iput-boolean v0, p0, Lcom/prime31/util/IabHelper;->_asyncInProgress:Z

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/prime31/util/IabHelper;->_asyncOperation:Ljava/lang/String;

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/prime31/util/IabHelper;->_signatureBase64:Ljava/lang/String;

    .line 177
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    .line 178
    iput-object p2, p0, Lcom/prime31/util/IabHelper;->_signatureBase64:Ljava/lang/String;

    .line 179
    const-string v0, "IAB helper created."

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 180
    return-void
.end method

.method public static getResponseDesc(I)Ljava/lang/String;
    .locals 5
    .param p0, "code"    # I

    .prologue
    .line 771
    const-string v3, "0:OK/1:User Canceled/2:Unknown/3:Billing Unavailable/4:Item unavailable/5:Developer Error/6:Error/7:Item Already Owned/8:Item not owned"

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 772
    .local v0, "iab_msgs":[Ljava/lang/String;
    const-string v3, "0:OK/-1001:Remote exception during initialization/-1002:Bad response received/-1003:Purchase signature verification failed/-1004:Send intent failed/-1005:User cancelled/-1006:Unknown purchase response/-1007:Missing token/-1008:Unknown error"

    .line 773
    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 775
    .local v1, "iabhelper_msgs":[Ljava/lang/String;
    const/16 v3, -0x3e8

    if-gt p0, v3, :cond_1

    .line 777
    rsub-int v2, p0, -0x3e8

    .line 778
    .local v2, "index":I
    if-ltz v2, :cond_0

    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 779
    aget-object v3, v1, v2

    .line 786
    .end local v2    # "index":I
    :goto_0
    return-object v3

    .line 781
    .restart local v2    # "index":I
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ":Unknown IAB Helper Error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 783
    .end local v2    # "index":I
    :cond_1
    if-ltz p0, :cond_2

    array-length v3, v0

    if-lt p0, v3, :cond_3

    .line 784
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ":Unknown"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 786
    :cond_3
    aget-object v3, v0, p0

    goto :goto_0
.end method


# virtual methods
.method checkSetupDone(Ljava/lang/String;)V
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 793
    iget-boolean v0, p0, Lcom/prime31/util/IabHelper;->_setupDone:Z

    if-nez v0, :cond_0

    .line 795
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Illegal state for operation ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "): IAB helper is not set up."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 796
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "IAB helper is not set up. Can\'t perform operation: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 798
    :cond_0
    return-void
.end method

.method consume(Lcom/prime31/util/Purchase;)V
    .locals 8
    .param p1, "itemInfo"    # Lcom/prime31/util/Purchase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/prime31/util/IabException;
        }
    .end annotation

    .prologue
    .line 658
    const-string v4, "consume"

    invoke-virtual {p0, v4}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 661
    :try_start_0
    invoke-virtual {p1}, Lcom/prime31/util/Purchase;->getToken()Ljava/lang/String;

    move-result-object v3

    .line 662
    .local v3, "token":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/prime31/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    .line 663
    .local v2, "sku":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 665
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Can\'t consume "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". No token."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 666
    new-instance v4, Lcom/prime31/util/IabException;

    const/16 v5, -0x3ef

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "PurchaseInfo is missing token for sku: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;)V

    throw v4
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 681
    .end local v2    # "sku":Ljava/lang/String;
    .end local v3    # "token":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 683
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v4, Lcom/prime31/util/IabException;

    const/16 v5, -0x3e9

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Remote exception while consuming. PurchaseInfo: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v0}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 669
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v2    # "sku":Ljava/lang/String;
    .restart local v3    # "token":Ljava/lang/String;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Consuming sku: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", token: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 670
    iget-object v4, p0, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v5, 0x3

    iget-object v6, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6, v3}, Lcom/android/vending/billing/IInAppBillingService;->consumePurchase(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 671
    .local v1, "response":I
    if-nez v1, :cond_2

    .line 673
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Successfully consumed sku: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 685
    return-void

    .line 677
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error consuming consuming sku "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v1}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 678
    new-instance v4, Lcom/prime31/util/IabException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Error consuming sku "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;)V

    throw v4
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method public consumeAsync(Lcom/prime31/util/Purchase;Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;)V
    .locals 2
    .param p1, "purchase"    # Lcom/prime31/util/Purchase;
    .param p2, "listener"    # Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;

    .prologue
    .line 737
    const-string v1, "consume"

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 738
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 739
    .local v0, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/prime31/util/Purchase;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 740
    const/4 v1, 0x0

    invoke-virtual {p0, v0, p2, v1}, Lcom/prime31/util/IabHelper;->consumeAsyncInternal(Ljava/util/List;Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;)V

    .line 741
    return-void
.end method

.method public consumeAsync(Ljava/util/List;Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;)V
    .locals 1
    .param p2, "listener"    # Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/prime31/util/Purchase;",
            ">;",
            "Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 756
    .local p1, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/prime31/util/Purchase;>;"
    const-string v0, "consume"

    invoke-virtual {p0, v0}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 757
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/prime31/util/IabHelper;->consumeAsyncInternal(Ljava/util/List;Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;)V

    .line 758
    return-void
.end method

.method consumeAsyncInternal(Ljava/util/List;Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;)V
    .locals 7
    .param p2, "singleListener"    # Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;
    .param p3, "multiListener"    # Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/prime31/util/Purchase;",
            ">;",
            "Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;",
            "Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 982
    .local p1, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/prime31/util/Purchase;>;"
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    .line 983
    .local v4, "handler":Landroid/os/Handler;
    const-string v0, "consume"

    invoke-virtual {p0, v0}, Lcom/prime31/util/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 984
    new-instance v6, Ljava/lang/Thread;

    new-instance v0, Lcom/prime31/util/IabHelper$3;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/prime31/util/IabHelper$3;-><init>(Lcom/prime31/util/IabHelper;Ljava/util/List;Lcom/prime31/util/IabHelper$OnConsumeFinishedListener;Landroid/os/Handler;Lcom/prime31/util/IabHelper$OnConsumeMultiFinishedListener;)V

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1024
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 1025
    return-void
.end method

.method public dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 271
    const-string v0, "Disposing."

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 272
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/prime31/util/IabHelper;->_setupDone:Z

    .line 273
    iget-object v0, p0, Lcom/prime31/util/IabHelper;->_serviceConn:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_1

    .line 275
    const-string v0, "Unbinding from service."

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 276
    iget-object v0, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    iget-object v1, p0, Lcom/prime31/util/IabHelper;->_serviceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 278
    :cond_0
    iput-object v2, p0, Lcom/prime31/util/IabHelper;->_serviceConn:Landroid/content/ServiceConnection;

    .line 279
    iput-object v2, p0, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    .line 280
    iput-object v2, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    .line 282
    :cond_1
    return-void
.end method

.method flagEndAsync()V
    .locals 2

    .prologue
    .line 859
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Ending async operation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/prime31/util/IabHelper;->_asyncOperation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 860
    const-string v0, ""

    iput-object v0, p0, Lcom/prime31/util/IabHelper;->_asyncOperation:Ljava/lang/String;

    .line 861
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/prime31/util/IabHelper;->_asyncInProgress:Z

    .line 862
    return-void
.end method

.method flagStartAsync(Ljava/lang/String;)V
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 849
    iget-boolean v0, p0, Lcom/prime31/util/IabHelper;->_asyncInProgress:Z

    if-eqz v0, :cond_0

    .line 850
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can\'t start async operation ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") because another async operation("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/prime31/util/IabHelper;->_asyncOperation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") is in progress."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 851
    :cond_0
    iput-object p1, p0, Lcom/prime31/util/IabHelper;->_asyncOperation:Ljava/lang/String;

    .line 852
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/prime31/util/IabHelper;->_asyncInProgress:Z

    .line 853
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Starting async operation: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 854
    return-void
.end method

.method getResponseCodeFromBundle(Landroid/os/Bundle;)I
    .locals 4
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 805
    const-string v1, "RESPONSE_CODE"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 806
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 808
    const-string v1, "Bundle with null response code, assuming OK (known issue)"

    invoke-static {v1}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 809
    const/4 v1, 0x0

    .line 814
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return v1

    .line 811
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 812
    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    .line 813
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_2

    .line 814
    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    long-to-int v1, v1

    goto :goto_0

    .line 817
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2
    const-string v1, "Unexpected type for bundle response code."

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 818
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 819
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected type for bundle response code: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getResponseCodeFromIntent(Landroid/content/Intent;)I
    .locals 4
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 828
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "RESPONSE_CODE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 829
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 831
    const-string v1, "Intent with no response code, assuming OK (known issue)"

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 832
    const/4 v1, 0x0

    .line 837
    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return v1

    .line 834
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 835
    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    .line 836
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_2

    .line 837
    check-cast v0, Ljava/lang/Long;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    long-to-int v1, v1

    goto :goto_0

    .line 840
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_2
    const-string v1, "Unexpected type for intent response code."

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 841
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 842
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected type for intent response code: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public handleActivityResult(IILandroid/content/Intent;)Z
    .locals 12
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 417
    iget v8, p0, Lcom/prime31/util/IabHelper;->_requestCode:I

    if-eq p1, v8, :cond_0

    .line 418
    const/4 v8, 0x0

    .line 514
    :goto_0
    return v8

    .line 420
    :cond_0
    const-string v8, "handleActivityResult"

    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 423
    invoke-virtual {p0}, Lcom/prime31/util/IabHelper;->flagEndAsync()V

    .line 425
    if-nez p3, :cond_2

    .line 427
    const-string v8, "Null data in IAB activity result."

    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 428
    new-instance v6, Lcom/prime31/util/IabResult;

    const/16 v8, -0x3ea

    const-string v9, "Null data in IAB result"

    invoke-direct {v6, v8, v9}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 429
    .local v6, "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_1

    .line 430
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    .line 431
    :cond_1
    const/4 v8, 0x1

    goto :goto_0

    .line 434
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    :cond_2
    invoke-virtual {p0, p3}, Lcom/prime31/util/IabHelper;->getResponseCodeFromIntent(Landroid/content/Intent;)I

    move-result v5

    .line 435
    .local v5, "responseCode":I
    const-string v8, "INAPP_PURCHASE_DATA"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 436
    .local v4, "purchaseData":Ljava/lang/String;
    const-string v8, "INAPP_DATA_SIGNATURE"

    invoke-virtual {p3, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 438
    .local v0, "dataSignature":Ljava/lang/String;
    const/4 v8, -0x1

    if-ne p2, v8, :cond_b

    if-nez v5, :cond_b

    .line 440
    const-string v8, "Successful resultcode from purchase activity."

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 441
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Purchase data: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 442
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Data signature: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 443
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Extras: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 445
    if-eqz v4, :cond_3

    if-nez v0, :cond_5

    .line 447
    :cond_3
    const-string v8, "BUG: either purchaseData or dataSignature is null."

    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 448
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Extras: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 449
    new-instance v6, Lcom/prime31/util/IabResult;

    const/16 v8, -0x3f0

    const-string v9, "IAB returned null purchaseData or dataSignature"

    invoke-direct {v6, v8, v9}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 450
    .restart local v6    # "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_4

    .line 451
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    .line 452
    :cond_4
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 455
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    :cond_5
    const/4 v2, 0x0

    .line 458
    .local v2, "purchase":Lcom/prime31/util/Purchase;
    :try_start_0
    new-instance v3, Lcom/prime31/util/Purchase;

    invoke-direct {v3, v4, v0}, Lcom/prime31/util/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 459
    .end local v2    # "purchase":Lcom/prime31/util/Purchase;
    .local v3, "purchase":Lcom/prime31/util/Purchase;
    :try_start_1
    invoke-virtual {v3}, Lcom/prime31/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v7

    .line 462
    .local v7, "sku":Ljava/lang/String;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_6

    .line 463
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    invoke-interface {v8, v4, v0}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseCompleteAwaitingVerification(Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    :cond_6
    sget-boolean v8, Lcom/prime31/util/IabHelper;->autoVerifySignatures:Z

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_signatureBase64:Ljava/lang/String;

    invoke-static {v8, v4, v0}, Lcom/prime31/util/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_8

    .line 467
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Purchase signature verification FAILED for sku "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 468
    new-instance v6, Lcom/prime31/util/IabResult;

    const/16 v8, -0x3eb

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Signature verification failed for sku "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v8, v9}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 469
    .restart local v6    # "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_7

    .line 470
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    invoke-interface {v8, v6, v3}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    .line 471
    :cond_7
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 473
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    :cond_8
    const-string v8, "Purchase signature successfully verified."

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 485
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_9

    .line 487
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    new-instance v9, Lcom/prime31/util/IabResult;

    const/4 v10, 0x0

    const-string v11, "Success"

    invoke-direct {v9, v10, v11}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v8, v9, v3}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    .line 514
    .end local v3    # "purchase":Lcom/prime31/util/Purchase;
    .end local v7    # "sku":Ljava/lang/String;
    :cond_9
    :goto_1
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 475
    .restart local v2    # "purchase":Lcom/prime31/util/Purchase;
    :catch_0
    move-exception v1

    .line 477
    .local v1, "e":Lorg/json/JSONException;
    :goto_2
    const-string v8, "Failed to parse purchase data."

    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 478
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 479
    new-instance v6, Lcom/prime31/util/IabResult;

    const/16 v8, -0x3ea

    const-string v9, "Failed to parse purchase data."

    invoke-direct {v6, v8, v9}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 480
    .restart local v6    # "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_a

    .line 481
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    .line 482
    :cond_a
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 490
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "purchase":Lcom/prime31/util/Purchase;
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    :cond_b
    const/4 v8, -0x1

    if-ne p2, v8, :cond_c

    .line 493
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Result code was OK but in-app billing response was not OK: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 494
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_9

    .line 496
    new-instance v6, Lcom/prime31/util/IabResult;

    const-string v8, "Problem purchashing item."

    invoke-direct {v6, v5, v8}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 497
    .restart local v6    # "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    goto :goto_1

    .line 500
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    :cond_c
    if-nez p2, :cond_d

    .line 502
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Purchase canceled - Response: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 503
    new-instance v6, Lcom/prime31/util/IabResult;

    const/16 v8, -0x3ed

    const-string v9, "User canceled."

    invoke-direct {v6, v8, v9}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 504
    .restart local v6    # "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_9

    .line 505
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    goto :goto_1

    .line 509
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    :cond_d
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Purchase failed. Result code: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ". Response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v5}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 510
    new-instance v6, Lcom/prime31/util/IabResult;

    const/16 v8, -0x3ee

    const-string v9, "Unknown purchase response."

    invoke-direct {v6, v8, v9}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 511
    .restart local v6    # "result":Lcom/prime31/util/IabResult;
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    if-eqz v8, :cond_9

    .line 512
    iget-object v8, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    const/4 v9, 0x0

    invoke-interface {v8, v6, v9}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    goto/16 :goto_1

    .line 475
    .end local v6    # "result":Lcom/prime31/util/IabResult;
    .restart local v3    # "purchase":Lcom/prime31/util/Purchase;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "purchase":Lcom/prime31/util/Purchase;
    .restart local v2    # "purchase":Lcom/prime31/util/Purchase;
    goto/16 :goto_2
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;)V
    .locals 6
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "listener"    # Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    .prologue
    .line 321
    const-string v5, ""

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/prime31/util/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V

    .line 322
    return-void
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V
    .locals 13
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sku"    # Ljava/lang/String;
    .param p3, "requestCode"    # I
    .param p4, "listener"    # Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;
    .param p5, "extraData"    # Ljava/lang/String;

    .prologue
    .line 352
    const-string v1, "launchPurchaseFlow"

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 353
    const-string v1, "launchPurchaseFlow"

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 358
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Constructing buy intent for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 359
    iget-object v1, p0, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v5, "inapp"

    move-object v4, p2

    move-object/from16 v6, p5

    invoke-interface/range {v1 .. v6}, Lcom/android/vending/billing/IInAppBillingService;->getBuyIntent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 360
    .local v8, "buyIntentBundle":Landroid/os/Bundle;
    invoke-virtual {p0, v8}, Lcom/prime31/util/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v11

    .line 361
    .local v11, "response":I
    if-eqz v11, :cond_0

    .line 363
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to buy item, Error response: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v11}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 365
    new-instance v12, Lcom/prime31/util/IabResult;

    const-string v1, "Unable to buy item"

    invoke-direct {v12, v11, v1}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 366
    .local v12, "result":Lcom/prime31/util/IabResult;
    if-eqz p4, :cond_0

    .line 367
    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v12, v1}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    .line 370
    .end local v12    # "result":Lcom/prime31/util/IabResult;
    :cond_0
    const-string v1, "BUY_INTENT"

    invoke-virtual {v8, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Landroid/app/PendingIntent;

    .line 371
    .local v10, "pendingIntent":Landroid/app/PendingIntent;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Launching buy intent for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". Request code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 372
    move/from16 v0, p3

    iput v0, p0, Lcom/prime31/util/IabHelper;->_requestCode:I

    .line 373
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/prime31/util/IabHelper;->_purchaseListener:Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;

    .line 374
    invoke-virtual {v10}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move-object v1, p1

    move/from16 v3, p3

    invoke-virtual/range {v1 .. v7}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 394
    .end local v8    # "buyIntentBundle":Landroid/os/Bundle;
    .end local v10    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v11    # "response":I
    :cond_1
    :goto_0
    return-void

    .line 376
    :catch_0
    move-exception v9

    .line 378
    .local v9, "e":Landroid/content/IntentSender$SendIntentException;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SendIntentException while launching purchase flow for sku "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 379
    invoke-virtual {v9}, Landroid/content/IntentSender$SendIntentException;->printStackTrace()V

    .line 381
    new-instance v12, Lcom/prime31/util/IabResult;

    const/16 v1, -0x3ec

    const-string v2, "Failed to send intent."

    invoke-direct {v12, v1, v2}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 382
    .restart local v12    # "result":Lcom/prime31/util/IabResult;
    if-eqz p4, :cond_1

    .line 383
    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v12, v1}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    goto :goto_0

    .line 385
    .end local v9    # "e":Landroid/content/IntentSender$SendIntentException;
    .end local v12    # "result":Lcom/prime31/util/IabResult;
    :catch_1
    move-exception v9

    .line 387
    .local v9, "e":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "RemoteException while launching purchase flow for sku "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 388
    invoke-virtual {v9}, Landroid/os/RemoteException;->printStackTrace()V

    .line 390
    new-instance v12, Lcom/prime31/util/IabResult;

    const/16 v1, -0x3e9

    const-string v2, "Remote exception while starting purchase flow"

    invoke-direct {v12, v1, v2}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    .line 391
    .restart local v12    # "result":Lcom/prime31/util/IabResult;
    if-eqz p4, :cond_1

    .line 392
    const/4 v1, 0x0

    move-object/from16 v0, p4

    invoke-interface {v0, v12, v1}, Lcom/prime31/util/IabHelper$OnIabPurchaseFinishedListener;->onIabPurchaseFinished(Lcom/prime31/util/IabResult;Lcom/prime31/util/Purchase;)V

    goto :goto_0
.end method

.method logError(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1031
    const-string v0, "Prime31-IABH"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "In-app billing error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    return-void
.end method

.method logWarn(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1037
    const-string v0, "Prime31-IABH"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "In-app billing warning: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1038
    return-void
.end method

.method public queryInventory(ZLjava/util/List;)Lcom/prime31/util/Inventory;
    .locals 6
    .param p1, "querySkuDetails"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/prime31/util/Inventory;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/prime31/util/IabException;
        }
    .end annotation

    .prologue
    .line 535
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v3, "queryInventory"

    invoke-virtual {p0, v3}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 538
    :try_start_0
    new-instance v1, Lcom/prime31/util/Inventory;

    invoke-direct {v1}, Lcom/prime31/util/Inventory;-><init>()V

    .line 539
    .local v1, "inv":Lcom/prime31/util/Inventory;
    invoke-virtual {p0, v1}, Lcom/prime31/util/IabHelper;->queryPurchases(Lcom/prime31/util/Inventory;)I

    move-result v2

    .line 540
    .local v2, "r":I
    if-eqz v2, :cond_0

    .line 542
    new-instance v3, Lcom/prime31/util/IabException;

    const-string v4, "Error refreshing inventory (querying owned items)."

    invoke-direct {v3, v2, v4}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 555
    .end local v1    # "inv":Lcom/prime31/util/Inventory;
    .end local v2    # "r":I
    :catch_0
    move-exception v0

    .line 557
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v3, Lcom/prime31/util/IabException;

    const/16 v4, -0x3e9

    const-string v5, "Remote exception while refreshing inventory."

    invoke-direct {v3, v4, v5, v0}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 545
    .end local v0    # "e":Landroid/os/RemoteException;
    .restart local v1    # "inv":Lcom/prime31/util/Inventory;
    .restart local v2    # "r":I
    :cond_0
    if-eqz p1, :cond_1

    .line 547
    :try_start_1
    invoke-virtual {p0, v1, p2}, Lcom/prime31/util/IabHelper;->querySkuDetails(Lcom/prime31/util/Inventory;Ljava/util/List;)I

    move-result v2

    .line 548
    if-eqz v2, :cond_1

    .line 550
    new-instance v3, Lcom/prime31/util/IabException;

    const-string v4, "Error refreshing inventory (querying prices of items)."

    invoke-direct {v3, v2, v4}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;)V

    throw v3
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 559
    .end local v1    # "inv":Lcom/prime31/util/Inventory;
    .end local v2    # "r":I
    :catch_1
    move-exception v0

    .line 561
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/prime31/util/IabException;

    const/16 v4, -0x3ea

    const-string v5, "Error parsing JSON response while refreshing inventory."

    invoke-direct {v3, v4, v5, v0}, Lcom/prime31/util/IabException;-><init>(ILjava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 553
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "inv":Lcom/prime31/util/Inventory;
    .restart local v2    # "r":I
    :cond_1
    return-object v1
.end method

.method public queryInventoryAsync(Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;

    .prologue
    .line 635
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/prime31/util/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V

    .line 636
    return-void
.end method

.method public queryInventoryAsync(ZLcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V
    .locals 1
    .param p1, "querySkuDetails"    # Z
    .param p2, "listener"    # Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;

    .prologue
    .line 641
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/prime31/util/IabHelper;->queryInventoryAsync(ZLjava/util/List;Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V

    .line 642
    return-void
.end method

.method public queryInventoryAsync(ZLjava/util/List;Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V
    .locals 7
    .param p1, "querySkuDetails"    # Z
    .param p3, "listener"    # Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 598
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    .line 599
    .local v4, "handler":Landroid/os/Handler;
    const-string v0, "queryInventory"

    invoke-virtual {p0, v0}, Lcom/prime31/util/IabHelper;->checkSetupDone(Ljava/lang/String;)V

    .line 600
    const-string v0, "refresh inventory"

    invoke-virtual {p0, v0}, Lcom/prime31/util/IabHelper;->flagStartAsync(Ljava/lang/String;)V

    .line 602
    new-instance v6, Ljava/lang/Thread;

    new-instance v0, Lcom/prime31/util/IabHelper$2;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/prime31/util/IabHelper$2;-><init>(Lcom/prime31/util/IabHelper;ZLjava/util/List;Landroid/os/Handler;Lcom/prime31/util/IabHelper$QueryInventoryFinishedListener;)V

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 629
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 630
    return-void
.end method

.method queryPurchases(Lcom/prime31/util/Inventory;)I
    .locals 17
    .param p1, "inv"    # Lcom/prime31/util/Inventory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 868
    const-string v13, "Querying owned items..."

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 869
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Package name: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 870
    const/4 v12, 0x0

    .line 871
    .local v12, "verificationFailed":Z
    const/4 v1, 0x0

    .line 875
    .local v1, "continueToken":Ljava/lang/String;
    :cond_0
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Calling getPurchases with continuation token: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 876
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v14, 0x3

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "inapp"

    move-object/from16 v0, v16

    invoke-interface {v13, v14, v15, v0, v1}, Lcom/android/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .line 878
    .local v3, "ownedItems":Landroid/os/Bundle;
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/prime31/util/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v8

    .line 879
    .local v8, "response":I
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Owned items response: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 880
    if-eqz v8, :cond_1

    .line 882
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "getPurchases() failed: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 930
    .end local v8    # "response":I
    :goto_0
    return v8

    .line 885
    .restart local v8    # "response":I
    :cond_1
    const-string v13, "INAPP_PURCHASE_ITEM_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "INAPP_DATA_SIGNATURE_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_3

    .line 887
    :cond_2
    const-string v13, "Bundle returned from getPurchases() doesn\'t contain required fields."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 888
    const/16 v8, -0x3ea

    goto :goto_0

    .line 891
    :cond_3
    const-string v13, "INAPP_PURCHASE_ITEM_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 892
    .local v4, "ownedSkus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v13, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 893
    .local v7, "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v13, "INAPP_DATA_SIGNATURE_LIST"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 895
    .local v10, "signatureList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lt v2, v13, :cond_4

    .line 925
    const-string v13, "INAPP_CONTINUATION_TOKEN"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 926
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Continuation token: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 928
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 930
    if-eqz v12, :cond_7

    const/16 v13, -0x3eb

    :goto_2
    move v8, v13

    goto :goto_0

    .line 897
    :cond_4
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 898
    .local v6, "purchaseData":Ljava/lang/String;
    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 899
    .local v9, "signature":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 902
    .local v11, "sku":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/prime31/util/IabHelper;->_signatureBase64:Ljava/lang/String;

    invoke-static {v13, v6, v9}, Lcom/prime31/util/Security;->verifyPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 904
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Sku is owned: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 905
    new-instance v5, Lcom/prime31/util/Purchase;

    invoke-direct {v5, v6, v9}, Lcom/prime31/util/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 907
    .local v5, "purchase":Lcom/prime31/util/Purchase;
    invoke-virtual {v5}, Lcom/prime31/util/Purchase;->getToken()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 909
    const-string v13, "BUG: empty/null token!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/prime31/util/IabHelper;->logWarn(Ljava/lang/String;)V

    .line 910
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Purchase data: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 914
    :cond_5
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/prime31/util/Inventory;->addPurchase(Lcom/prime31/util/Purchase;)V

    .line 895
    .end local v5    # "purchase":Lcom/prime31/util/Purchase;
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 918
    :cond_6
    const-string v13, "Purchase signature verification **FAILED**. Not adding item."

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/prime31/util/IabHelper;->logWarn(Ljava/lang/String;)V

    .line 919
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "   Purchase data: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 920
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "   Signature: "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 921
    const/4 v12, 0x1

    goto :goto_3

    .line 930
    .end local v6    # "purchaseData":Ljava/lang/String;
    .end local v9    # "signature":Ljava/lang/String;
    .end local v11    # "sku":Ljava/lang/String;
    :cond_7
    const/4 v13, 0x0

    goto/16 :goto_2
.end method

.method querySkuDetails(Lcom/prime31/util/Inventory;Ljava/util/List;)I
    .locals 11
    .param p1, "inv"    # Lcom/prime31/util/Inventory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/prime31/util/Inventory;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p2, "moreSkus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 936
    const-string v7, "Querying SKU details."

    invoke-static {v7}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 937
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 938
    .local v5, "skuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/prime31/util/Inventory;->getAllOwnedSkus()Ljava/util/List;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 940
    if-eqz p2, :cond_0

    .line 941
    invoke-virtual {v5, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 943
    :cond_0
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-nez v7, :cond_2

    .line 945
    const-string v7, "queryPrices: nothing to do because there are no SKUs."

    invoke-static {v7}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 976
    :cond_1
    :goto_0
    return v2

    .line 949
    :cond_2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 950
    .local v1, "querySkus":Landroid/os/Bundle;
    const-string v7, "ITEM_ID_LIST"

    invoke-virtual {v1, v7, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 951
    iget-object v7, p0, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v8, 0x3

    iget-object v9, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "inapp"

    invoke-interface {v7, v8, v9, v10, v1}, Lcom/android/vending/billing/IInAppBillingService;->getSkuDetails(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v4

    .line 953
    .local v4, "skuDetails":Landroid/os/Bundle;
    const-string v7, "DETAILS_LIST"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 955
    invoke-virtual {p0, v4}, Lcom/prime31/util/IabHelper;->getResponseCodeFromBundle(Landroid/os/Bundle;)I

    move-result v2

    .line 956
    .local v2, "response":I
    if-eqz v2, :cond_3

    .line 958
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "getSkuDetails() failed: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/prime31/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    goto :goto_0

    .line 963
    :cond_3
    const-string v7, "getSkuDetails() returned a bundle with neither an error nor a detail list."

    invoke-virtual {p0, v7}, Lcom/prime31/util/IabHelper;->logError(Ljava/lang/String;)V

    .line 964
    const/16 v2, -0x3ea

    goto :goto_0

    .line 968
    .end local v2    # "response":I
    :cond_4
    const-string v7, "DETAILS_LIST"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 970
    .local v3, "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 972
    .local v6, "thisResponse":Ljava/lang/String;
    new-instance v0, Lcom/prime31/util/SkuDetails;

    invoke-direct {v0, v6}, Lcom/prime31/util/SkuDetails;-><init>(Ljava/lang/String;)V

    .line 973
    .local v0, "d":Lcom/prime31/util/SkuDetails;
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Got sku details: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 974
    invoke-virtual {p1, v0}, Lcom/prime31/util/Inventory;->addSkuDetails(Lcom/prime31/util/SkuDetails;)V

    goto :goto_1
.end method

.method public startSetup(Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    .prologue
    .line 210
    iget-boolean v0, p0, Lcom/prime31/util/IabHelper;->_setupDone:Z

    if-eqz v0, :cond_0

    .line 211
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "IAB helper is already set up."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_0
    const-string v0, "Starting in-app billing service"

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 215
    new-instance v0, Lcom/prime31/util/IabHelper$1;

    invoke-direct {v0, p0, p1}, Lcom/prime31/util/IabHelper$1;-><init>(Lcom/prime31/util/IabHelper;Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;)V

    iput-object v0, p0, Lcom/prime31/util/IabHelper;->_serviceConn:Landroid/content/ServiceConnection;

    .line 259
    iget-object v0, p0, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/prime31/util/IabHelper;->_serviceConn:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 260
    return-void
.end method
