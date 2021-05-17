.class Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;
.super Ljava/lang/Object;
.source "AmazonAuthorizationManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->getProfile(Lcom/amazon/identity/auth/device/shared/APIListener;)Ljava/util/concurrent/Future;
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
    .line 442
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    iput-object p2, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 446
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$000(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 448
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;->val$callbackFuture:Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;

    new-instance v1, Lcom/amazon/identity/auth/device/AuthError;

    const-string v2, "APIKey is invalid"

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/thread/AuthzCallbackFuture;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 463
    :goto_0
    return-void

    .line 451
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;->this$0:Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;

    invoke-static {v1}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;->access$100(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4$1;

    invoke-direct {v2, p0}, Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4$1;-><init>(Lcom/amazon/identity/auth/device/authorization/api/AmazonAuthorizationManager$4;)V

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->getProfile(Landroid/content/Context;Ljava/lang/String;Lcom/amazon/identity/auth/device/shared/APIListener;)V

    goto :goto_0
.end method
