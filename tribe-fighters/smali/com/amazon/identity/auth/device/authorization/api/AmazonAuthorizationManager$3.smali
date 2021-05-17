.class Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;
.super Ljava/lang/Object;
.source "AmazonAuthorizationManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->clearAuthorizationState(Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

.field final synthetic val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    iput-object p2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 377
    const/4 v1, 0x0

    .line 379
    .local v1, "tempError":Lcom/amazon/identity/auth/device/AuthError;
    :try_start_0
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v2}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearServiceAuthorizationState(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 386
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v2}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearAuthorizationState(Landroid/content/Context;)V

    .line 387
    if-eqz v1, :cond_0

    .line 389
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-virtual {v2, v1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 396
    :goto_0
    return-void

    .line 393
    :cond_0
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v2, v3}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onSuccess(Landroid/os/Bundle;)V

    goto :goto_0

    .line 381
    :catch_0
    move-exception v0

    .line 382
    .local v0, "e":Lcom/amazon/identity/auth/device/AuthError;
    move-object v1, v0

    .line 386
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v2}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearAuthorizationState(Landroid/content/Context;)V

    .line 387
    if-eqz v1, :cond_1

    .line 389
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-virtual {v2, v1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0

    .line 393
    :cond_1
    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v2, v3}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onSuccess(Landroid/os/Bundle;)V

    goto :goto_0

    .line 386
    .end local v0    # "e":Lcom/amazon/identity/auth/device/AuthError;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v3}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->clearAuthorizationState(Landroid/content/Context;)V

    .line 387
    if-eqz v1, :cond_2

    .line 389
    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-virtual {v3, v1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 393
    :goto_1
    throw v2

    :cond_2
    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$3;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v3, v4}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onSuccess(Landroid/os/Bundle;)V

    goto :goto_1
.end method
