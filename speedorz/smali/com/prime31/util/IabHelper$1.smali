.class Lcom/prime31/util/IabHelper$1;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/prime31/util/IabHelper;->startSetup(Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/prime31/util/IabHelper;

.field private final synthetic val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;


# direct methods
.method constructor <init>(Lcom/prime31/util/IabHelper;Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/prime31/util/IabHelper$1;->this$0:Lcom/prime31/util/IabHelper;

    iput-object p2, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 7
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 228
    const-string v3, "Billing service connected."

    invoke-static {v3}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 229
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->this$0:Lcom/prime31/util/IabHelper;

    invoke-static {p2}, Lcom/android/vending/billing/IInAppBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v4

    iput-object v4, v3, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    .line 230
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->this$0:Lcom/prime31/util/IabHelper;

    iget-object v3, v3, Lcom/prime31/util/IabHelper;->_context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 233
    .local v1, "packageName":Ljava/lang/String;
    :try_start_0
    const-string v3, "Checking for in-app billing 3 support."

    invoke-static {v3}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 234
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->this$0:Lcom/prime31/util/IabHelper;

    iget-object v3, v3, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    const/4 v4, 0x3

    const-string v5, "inapp"

    invoke-interface {v3, v4, v1, v5}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 235
    .local v2, "response":I
    if-eqz v2, :cond_1

    .line 237
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    if-eqz v3, :cond_0

    .line 238
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    new-instance v4, Lcom/prime31/util/IabResult;

    const-string v5, "Error checking for billing v3 support."

    invoke-direct {v4, v2, v5}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/prime31/util/IabResult;)V

    .line 257
    .end local v2    # "response":I
    :cond_0
    :goto_0
    return-void

    .line 241
    .restart local v2    # "response":I
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "In-app billing version 3 supported for "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 242
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->this$0:Lcom/prime31/util/IabHelper;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/prime31/util/IabHelper;->_setupDone:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .end local v2    # "response":I
    :goto_1
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    if-eqz v3, :cond_0

    .line 255
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    new-instance v4, Lcom/prime31/util/IabResult;

    const/4 v5, 0x0

    const-string v6, "Setup successful."

    invoke-direct {v4, v5, v6}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/prime31/util/IabResult;)V

    goto :goto_0

    .line 244
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Landroid/os/RemoteException;
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    if-eqz v3, :cond_2

    .line 248
    iget-object v3, p0, Lcom/prime31/util/IabHelper$1;->val$listener:Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;

    new-instance v4, Lcom/prime31/util/IabResult;

    const/16 v5, -0x3e9

    const-string v6, "RemoteException while setting up in-app billing."

    invoke-direct {v4, v5, v6}, Lcom/prime31/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/prime31/util/IabHelper$OnIabSetupFinishedListener;->onIabSetupFinished(Lcom/prime31/util/IabResult;)V

    .line 250
    :cond_2
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 220
    const-string v0, "Billing service disconnected."

    invoke-static {v0}, Lcom/prime31/IABConstants;->logDebug(Ljava/lang/String;)V

    .line 221
    iget-object v0, p0, Lcom/prime31/util/IabHelper$1;->this$0:Lcom/prime31/util/IabHelper;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/prime31/util/IabHelper;->_service:Lcom/android/vending/billing/IInAppBillingService;

    .line 222
    return-void
.end method
