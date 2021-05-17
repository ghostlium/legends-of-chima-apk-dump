.class Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;
.super Ljava/lang/Object;
.source "NativeAuthCallHandler.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/authorization/api/AuthorizationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->doLogin(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;

.field final synthetic val$rid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->this$0:Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;

    iput-object p2, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->val$rid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "cause"    # Landroid/os/Bundle;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->this$0:Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;

    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->val$rid:Ljava/lang/String;

    const-string v2, "{}"

    const-string v3, "ERROR"

    invoke-virtual {v0, v1, v2, v3}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public onError(Lcom/amazon/identity/auth/device/AuthError;)V
    .locals 4
    .param p1, "e"    # Lcom/amazon/identity/auth/device/AuthError;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->this$0:Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;

    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->val$rid:Ljava/lang/String;

    const-string v2, "{}"

    const-string v3, "ERROR"

    invoke-virtual {v0, v1, v2, v3}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public onSuccess(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "response"    # Landroid/os/Bundle;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->this$0:Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;

    iget-object v1, p0, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler$1;->val$rid:Ljava/lang/String;

    const-string v2, "{}"

    const-string v3, "SUCCESS"

    invoke-virtual {v0, v1, v2, v3}, Lcom/amazon/ags/html5/javascript/NativeAuthCallHandler;->sendReply(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method
