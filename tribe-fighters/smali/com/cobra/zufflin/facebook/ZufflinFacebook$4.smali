.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/widget/WebDialog$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->publishFeedDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    .line 519
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

    .line 525
    if-nez p2, :cond_1

    .line 528
    const-string v1, "post_id"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 529
    .local v0, "postId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 531
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStatusUpdateEvent(Z)V

    .line 558
    .end local v0    # "postId":Ljava/lang/String;
    :goto_0
    return-void

    .line 539
    .restart local v0    # "postId":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStatusUpdateEvent(Z)V

    goto :goto_0

    .line 542
    .end local v0    # "postId":Ljava/lang/String;
    :cond_1
    instance-of v1, p2, Lcom/facebook/FacebookOperationCanceledException;

    if-eqz v1, :cond_2

    .line 548
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStatusUpdateEvent(Z)V

    goto :goto_0

    .line 556
    :cond_2
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$4;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStatusUpdateEvent(Z)V

    goto :goto_0
.end method
