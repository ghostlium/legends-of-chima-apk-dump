.class Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;
.super Ljava/lang/Object;
.source "AuthorizationHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->authorize(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZLcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;

.field final synthetic val$allScopes:[Ljava/lang/String;

.field final synthetic val$clientId:Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$isBrowserFlow:Z

.field final synthetic val$listener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

.field final synthetic val$requestId:Ljava/util/UUID;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;ZLandroid/content/Context;Ljava/lang/String;[Ljava/lang/String;Ljava/util/UUID;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->this$0:Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;

    iput-boolean p2, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$isBrowserFlow:Z

    iput-object p3, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$clientId:Ljava/lang/String;

    iput-object p5, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$allScopes:[Ljava/lang/String;

    iput-object p6, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$requestId:Ljava/util/UUID;

    iput-object p7, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$listener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 91
    :try_start_0
    iget-boolean v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$isBrowserFlow:Z

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->this$0:Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$clientId:Ljava/lang/String;

    iget-object v4, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$allScopes:[Ljava/lang/String;

    iget-object v5, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$requestId:Ljava/util/UUID;

    iget-object v6, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$listener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-static/range {v0 .. v6}, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;->access$000(Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/UUID;Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;)V

    .line 104
    :goto_0
    return-void

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$listener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    new-instance v1, Lcom/amazon/identity/auth/device/AuthError;

    const-string v2, "WebView is not allowed for Authorization"

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    invoke-interface {v0, v1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 101
    :catch_0
    move-exception v7

    .line 102
    .local v7, "e":Lcom/amazon/identity/auth/device/AuthError;
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationHelper$1;->val$listener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v0, v7}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0
.end method
