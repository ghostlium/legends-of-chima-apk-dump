.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;

.field private final synthetic val$picture_path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;->val$picture_path:Ljava/lang/String;

    .line 758
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .locals 4
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 763
    invoke-virtual {p1}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    .line 764
    .local v0, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v0, :cond_0

    .line 766
    const-string v1, "FACEBOOK"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Sending OG Story Failed: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 767
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 766
    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 769
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    .line 781
    :goto_0
    return-void

    .line 779
    :cond_0
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$7;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$7$1;->val$picture_path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnScreenshotEvent(ZLjava/lang/String;)V

    goto :goto_0
.end method
