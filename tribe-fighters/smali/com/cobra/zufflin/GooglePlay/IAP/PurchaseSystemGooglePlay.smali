.class public Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;
.super Ljava/lang/Object;
.source "PurchaseSystemGooglePlay.java"

# interfaces
.implements Lcom/cobra/zufflin/ZufflinActivityListener;


# static fields
.field public static singleton:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;


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

.field availableInventoryFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

.field private bCanMakePayements:Z

.field private bDoPendingProcessing:Z

.field private bGotPending:Z

.field consumeFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;

.field private mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

.field private pendingMutex:Ljava/lang/Object;

.field private pendingPurchaes:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->singleton:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Vector;)V
    .locals 2
    .param p1, "publisherKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "apiCodes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bCanMakePayements:Z

    .line 28
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingPurchaes:Ljava/util/Vector;

    .line 30
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bDoPendingProcessing:Z

    .line 31
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bGotPending:Z

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingMutex:Ljava/lang/Object;

    .line 78
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;

    invoke-direct {v0, p0}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$1;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->availableInventoryFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$QueryInventoryFinishedListener;

    .line 134
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$2;

    invoke-direct {v0, p0}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$2;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->consumeFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;

    .line 36
    sput-object p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->singleton:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    .line 38
    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->apiCodes:Ljava/util/Vector;

    .line 40
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/ZufflinActivity;->addActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 43
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    .line 45
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    new-instance v1, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$3;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->startSetup(Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnIabSetupFinishedListener;)V

    .line 63
    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Z)V
    .locals 0

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bCanMakePayements:Z

    return-void
.end method

.method static synthetic access$1(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/util/Vector;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->apiCodes:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$2(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/util/Vector;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingPurchaes:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$3(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingMutex:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$4(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Z)V
    .locals 0

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bGotPending:Z

    return-void
.end method

.method static synthetic access$5(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Z
    .locals 1

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bDoPendingProcessing:Z

    return v0
.end method

.method static synthetic access$6(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)V
    .locals 0

    .prologue
    .line 147
    invoke-direct {p0}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->processPendingPurchases()V

    return-void
.end method

.method static synthetic access$7(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 203
    invoke-direct {p0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->execOnPurchaseComplete(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$8(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;)Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    return-object v0
.end method

.method private execOnPurchaseComplete(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "apiCode"    # Ljava/lang/String;
    .param p2, "bSuccessful"    # Z

    .prologue
    .line 205
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    new-instance v1, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$5;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 213
    return-void
.end method

.method private processPendingPurchases()V
    .locals 4

    .prologue
    .line 149
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingPurchaes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 154
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingPurchaes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->clear()V

    .line 155
    return-void

    .line 149
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;

    .line 152
    .local v0, "p":Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;
    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->consumeFinishedListener:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;

    invoke-virtual {v2, v0, v3}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->consumeAsync(Lcom/cobra/zufflin/GooglePlay/IAP/util/Purchase;Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnConsumeFinishedListener;)V

    goto :goto_0
.end method


# virtual methods
.method public canMakePayments()Z
    .locals 1

    .prologue
    .line 200
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bCanMakePayements:Z

    return v0
.end method

.method public checkPendingPurchases()V
    .locals 2

    .prologue
    .line 159
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->pendingMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 161
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bDoPendingProcessing:Z

    .line 162
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->bGotPending:Z

    if-eqz v0, :cond_0

    .line 164
    invoke-direct {p0}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->processPendingPurchases()V

    .line 159
    :cond_0
    monitor-exit v1

    .line 167
    return-void

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/ZufflinActivity;->removeActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 68
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->dispose()V

    .line 71
    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    .line 73
    :cond_0
    sput-object v1, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->singleton:Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;

    .line 74
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->handleActivityResult(IILandroid/content/Intent;)Z

    .line 223
    return-void
.end method

.method protected native onAddProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 253
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 228
    return-void
.end method

.method protected native onPurchaseComplete(Ljava/lang/String;Z)V
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 233
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 248
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 238
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 243
    return-void
.end method

.method public purchase(Ljava/lang/String;)V
    .locals 6
    .param p1, "apiCode"    # Ljava/lang/String;

    .prologue
    .line 173
    new-instance v4, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;

    invoke-direct {v4, p0, p1}, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay$4;-><init>(Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;Ljava/lang/String;)V

    .line 193
    .local v4, "mPurchaseFinishedListener":Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnIabPurchaseFinishedListener;
    const/4 v3, 0x0

    .line 194
    .local v3, "requestCode":I
    const-string v5, ""

    .line 195
    .local v5, "extraData":Ljava/lang/String;
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/IAP/PurchaseSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    move-object v2, p1

    invoke-virtual/range {v0 .. v5}, Lcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper;->launchPurchaseFlow(Landroid/app/Activity;Ljava/lang/String;ILcom/cobra/zufflin/GooglePlay/IAP/util/IabHelper$OnIabPurchaseFinishedListener;Ljava/lang/String;)V

    .line 196
    return-void
.end method
