.class public Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;
.super Ljava/lang/Object;
.source "PurchaseSystemAmazon.java"

# interfaces
.implements Lcom/cobra/zufflin/ZufflinActivityListener;


# static fields
.field public static singleton:Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;


# instance fields
.field public pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;


# direct methods
.method public constructor <init>(Ljava/util/Vector;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p1, "apiCodes":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    .line 19
    const-string v0, "IAP"

    const-string v1, "Creating Amazon IAP purchase system..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    sput-object p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->singleton:Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;

    .line 21
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/ZufflinActivity;->addActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 22
    const-string v0, "IAP"

    const-string v1, "added as listener..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    new-instance v0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;-><init>(Landroid/app/Activity;Ljava/util/Vector;)V

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    .line 25
    const-string v0, "IAP"

    const-string v1, "created purchase observer..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    invoke-static {v0}, Lcom/amazon/inapp/purchasing/PurchasingManager;->registerObserver(Lcom/amazon/inapp/purchasing/PurchasingObserver;)V

    .line 27
    const-string v0, "IAP"

    const-string v1, "registered purchase observer"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 31
    const-string v0, "IAP"

    const-string v1, "Purchase Observer created!"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    :goto_0
    return-void

    .line 35
    :cond_0
    const-string v0, "IAP"

    const-string v1, "Purchase Observer NOT created!"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public canMakePayments()Z
    .locals 2

    .prologue
    .line 55
    const-string v0, "IAP"

    const-string v1, "canMakePayments()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 57
    const/4 v0, 0x1

    .line 59
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public checkPendingPurchases()V
    .locals 0

    .prologue
    .line 71
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->singleton:Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;

    .line 42
    return-void
.end method

.method public doPurchase(Ljava/lang/String;)V
    .locals 3
    .param p1, "SKU"    # Ljava/lang/String;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 48
    const-string v0, "IAP"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Initiating purchase: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    invoke-virtual {v0, p1}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->initiatePurchase(Ljava/lang/String;)V

    .line 51
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 66
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 106
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 78
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/IAP/PurchaseSystemAmazon;->pObserver:Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;

    invoke-virtual {v0}, Lcom/cobra/zufflin/Amazon/IAP/PurchaseObserver;->onResume()V

    .line 85
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 113
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 92
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 99
    return-void
.end method
