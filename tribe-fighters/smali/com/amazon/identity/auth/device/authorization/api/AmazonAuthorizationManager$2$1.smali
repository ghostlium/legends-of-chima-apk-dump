.class Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2$1;
.super Ljava/lang/Object;
.source "AmazonAuthorizationManager.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/shared/APIListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;)V
    .locals 0

    .prologue
    .line 265
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2$1;->this$1:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/amazon/identity/auth/device/AuthError;)V
    .locals 1
    .param p1, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 274
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2$1;->this$1:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-virtual {v0, p1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 275
    return-void
.end method

.method public onSuccess(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2$1;->this$1:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$2;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-virtual {v0, p1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onSuccess(Landroid/os/Bundle;)V

    .line 270
    return-void
.end method
