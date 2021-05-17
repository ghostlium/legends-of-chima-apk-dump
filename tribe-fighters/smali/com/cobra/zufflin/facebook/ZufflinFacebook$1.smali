.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Request$GraphUserListCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->FetchFriendsData()V
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
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/util/List;Lcom/facebook/Response;)V
    .locals 8
    .param p2, "response"    # Lcom/facebook/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/model/GraphUser;",
            ">;",
            "Lcom/facebook/Response;",
            ")V"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "users":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/model/GraphUser;>;"
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {p2}, Lcom/facebook/Response;->getGraphObject()Lcom/facebook/model/GraphObject;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$7(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Lcom/facebook/model/GraphObject;)V

    .line 257
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$8(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphObject;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 260
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$8(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphObject;

    move-result-object v5

    invoke-interface {v5}, Lcom/facebook/model/GraphObject;->getInnerJSONObject()Lorg/json/JSONObject;

    move-result-object v3

    .line 261
    .local v3, "jsonObject":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "dataToSave":Ljava/lang/String;
    :try_start_0
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$5(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 266
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$5(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    .line 268
    :cond_0
    new-instance v2, Ljava/io/File;

    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$5(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/io/File;

    move-result-object v5

    const-string v6, "friendsInfo.dat"

    invoke-direct {v2, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 269
    .local v2, "fileToSave":Ljava/io/File;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 270
    .local v4, "out":Ljava/io/FileOutputStream;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 271
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 275
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnLoggedInUserFriendsDataDownloaded(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    .end local v0    # "dataToSave":Ljava/lang/String;
    .end local v2    # "fileToSave":Ljava/io/File;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "out":Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 277
    .restart local v0    # "dataToSave":Ljava/lang/String;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 279
    .local v1, "e":Ljava/io/IOException;
    const-string v5, "FACEBOOK"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "FetchFriendsData(): File write failed: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 284
    .end local v0    # "dataToSave":Ljava/lang/String;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :cond_1
    const-string v5, "FACEBOOK"

    const-string v6, "FetchFriendsData(): Friend data was null!"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$1;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-virtual {v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->Logout()V

    goto :goto_0
.end method
