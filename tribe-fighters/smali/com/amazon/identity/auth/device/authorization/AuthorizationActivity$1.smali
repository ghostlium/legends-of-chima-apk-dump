.class Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;
.super Ljava/lang/Object;
.source "AuthorizationActivity.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;

.field final synthetic val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;


# direct methods
.method constructor <init>(Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;Lcom/amazon/identity/auth/device/authorization/CallbackInfo;)V
    .locals 0

    .prologue
    .line 48
    iput-object p1, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->this$0:Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;

    iput-object p2, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "cause"    # Landroid/os/Bundle;

    .prologue
    .line 69
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Code for Token Exchange Cancel"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onCancel(Landroid/os/Bundle;)V

    .line 74
    :cond_0
    return-void
.end method

.method public onError(Lcom/amazon/identity/auth/device/AuthError;)V
    .locals 3
    .param p1, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 60
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Code for Token Exchange Error. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/AuthError;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 65
    :cond_0
    return-void
.end method

.method public onSuccess(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 51
    invoke-static {}, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Code for Token Exchange success"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/amazon/identity/auth/device/authorization/AuthorizationActivity$1;->val$callbackIntentInfo:Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->mlistener:Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;

    invoke-interface {v0, p1}, Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;->onSuccess(Landroid/os/Bundle;)V

    .line 56
    :cond_0
    return-void
.end method
