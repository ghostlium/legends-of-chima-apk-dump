.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/widget/WebDialog$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;

    .line 586
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V
    .locals 3
    .param p1, "values"    # Landroid/os/Bundle;
    .param p2, "error"    # Lcom/facebook/FacebookException;

    .prologue
    const/4 v2, 0x0

    .line 593
    if-eqz p2, :cond_0

    .line 595
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnRequestEvent(Z)V

    .line 609
    :goto_0
    return-void

    .line 599
    :cond_0
    const-string v1, "request"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 600
    .local v0, "requestId":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 602
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnRequestEvent(Z)V

    goto :goto_0

    .line 606
    :cond_1
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$5;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnRequestEvent(Z)V

    goto :goto_0
.end method
