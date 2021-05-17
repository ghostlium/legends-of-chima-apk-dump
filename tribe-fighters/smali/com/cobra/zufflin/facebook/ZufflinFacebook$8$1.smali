.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

.field private final synthetic val$picture_path:Ljava/lang/String;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->val$picture_path:Ljava/lang/String;

    .line 864
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .locals 5
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 869
    invoke-virtual {p1}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    .line 870
    .local v0, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v0, :cond_1

    .line 872
    const-string v1, "FACEBOOK"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Sending OG Story Failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 873
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 872
    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 875
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->val$title:Ljava/lang/String;

    const-string v2, "delete"

    if-ne v1, v2, :cond_0

    .line 876
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v4, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    .line 892
    :goto_0
    return-void

    .line 878
    :cond_0
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnPhotoEvent(Z)V

    goto :goto_0

    .line 887
    :cond_1
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->val$title:Ljava/lang/String;

    const-string v2, "delete"

    if-ne v1, v2, :cond_2

    .line 888
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    goto :goto_0

    .line 890
    :cond_2
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$8;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnPhotoEvent(Z)V

    goto :goto_0
.end method
