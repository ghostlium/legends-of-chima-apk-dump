.class Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;
.super Ljava/lang/Object;
.source "ThirdPartyServiceHelper.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/authorization/AmazonServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->bindHighestVersionedService(Landroid/content/Context;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

.field final synthetic val$serviceConnection:Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

.field final synthetic val$serviceIntent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 255
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->this$0:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;

    iput-object p2, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    iput-object p3, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$serviceConnection:Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    iput-object p4, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$serviceIntent:Landroid/content/Intent;

    iput-object p5, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBindError(Lcom/amazon/identity/auth/device/AuthError;)V
    .locals 2
    .param p1, "authError"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    const/4 v1, 0x0

    .line 266
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->setService(Landroid/os/IInterface;)V

    .line 267
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->access$100(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;)V

    .line 268
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->setServiceIntent(Landroid/content/Intent;)V

    .line 269
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->access$200()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Bind - error"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 271
    return-void
.end method

.method public onBindSuccess(Landroid/os/IInterface;)V
    .locals 2
    .param p1, "serviceInterface"    # Landroid/os/IInterface;

    .prologue
    .line 258
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    invoke-virtual {v0, p1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->setService(Landroid/os/IInterface;)V

    .line 259
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$serviceConnection:Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->access$100(Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;Lcom/amazon/identity/auth/device/authorization/ThirdPartyAuthorizationServiceConnection;)V

    .line 260
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$mapServiceInfo:Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$serviceIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$MAPServiceInfo;->setServiceIntent(Landroid/content/Intent;)V

    .line 261
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 262
    return-void
.end method
