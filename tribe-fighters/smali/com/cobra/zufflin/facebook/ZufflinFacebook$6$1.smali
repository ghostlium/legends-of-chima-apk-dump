.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$6$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;

    .line 660
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .locals 6
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 665
    invoke-virtual {p1}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    .line 666
    .local v0, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v0, :cond_0

    .line 668
    const-string v3, "FACEBOOK"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Sending OG Story Failed: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 669
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 668
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 670
    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;

    invoke-static {v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStoryEvent(Z)V

    .line 679
    :goto_0
    return-void

    .line 674
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/Response;->getGraphObject()Lcom/facebook/model/GraphObject;

    move-result-object v1

    .line 675
    .local v1, "graphObject":Lcom/facebook/model/GraphObject;
    const-string v3, "id"

    invoke-interface {v1, v3}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 676
    .local v2, "ogActionID":Ljava/lang/String;
    const-string v3, "FACEBOOK"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "OG Action ID: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;

    invoke-static {v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStoryEvent(Z)V

    goto :goto_0
.end method
