.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$9;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/widget/FacebookDialog$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$9;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    .line 1064
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/facebook/widget/FacebookDialog$PendingCall;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "pendingCall"    # Lcom/facebook/widget/FacebookDialog$PendingCall;
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    .line 1073
    const-string v0, "Activity"

    const-string v1, "Success!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1074
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$9;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStatusUpdateEvent(Z)V

    .line 1075
    return-void
.end method

.method public onError(Lcom/facebook/widget/FacebookDialog$PendingCall;Ljava/lang/Exception;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "pendingCall"    # Lcom/facebook/widget/FacebookDialog$PendingCall;
    .param p2, "error"    # Ljava/lang/Exception;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 1067
    const-string v0, "Activity"

    const-string v1, "Error: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1068
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$9;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {v0, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStatusUpdateEvent(Z)V

    .line 1069
    return-void
.end method
