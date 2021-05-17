.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$2$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;

    .line 312
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .locals 8
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 318
    invoke-virtual {p1}, Lcom/facebook/Response;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v0

    .line 319
    .local v0, "error":Lcom/facebook/FacebookRequestError;
    if-eqz v0, :cond_0

    .line 321
    const-string v5, "FACEBOOK"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "FetchUserDataByID(): Getting user info failed: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    invoke-virtual {v0}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 321
    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnStoryEvent(Z)V

    .line 341
    :goto_0
    return-void

    .line 327
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/Response;->getGraphObject()Lcom/facebook/model/GraphObject;

    move-result-object v2

    .line 328
    .local v2, "graphObject":Lcom/facebook/model/GraphObject;
    const-string v5, "id"

    invoke-interface {v2, v5}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 329
    .local v3, "id":Ljava/lang/String;
    const-string v5, "first_name"

    invoke-interface {v2, v5}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 330
    .local v1, "f_name":Ljava/lang/String;
    const-string v5, "last_name"

    invoke-interface {v2, v5}, Lcom/facebook/model/GraphObject;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 335
    .local v4, "l_name":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 336
    const-string v1, ""

    .line 337
    :cond_1
    if-nez v4, :cond_2

    .line 338
    const-string v4, ""

    .line 339
    :cond_2
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v5

    invoke-virtual {v5, v1, v4, v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnRequestedUserDetails(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
