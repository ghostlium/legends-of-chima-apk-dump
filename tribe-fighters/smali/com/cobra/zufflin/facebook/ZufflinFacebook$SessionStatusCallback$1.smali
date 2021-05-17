.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Request$GraphUserCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->call(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    .line 1013
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/model/GraphUser;Lcom/facebook/Response;)V
    .locals 7
    .param p1, "user"    # Lcom/facebook/model/GraphUser;
    .param p2, "response"    # Lcom/facebook/Response;

    .prologue
    .line 1021
    if-eqz p1, :cond_5

    .line 1024
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4, p1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$4(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Lcom/facebook/model/GraphUser;)V

    .line 1028
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$5(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1029
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$5(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 1031
    :cond_0
    const-string v0, ""

    .line 1032
    .local v0, "fname":Ljava/lang/String;
    const-string v3, ""

    .line 1033
    .local v3, "mname":Ljava/lang/String;
    const-string v2, ""

    .line 1034
    .local v2, "lname":Ljava/lang/String;
    const-string v1, ""

    .line 1035
    .local v1, "id":Ljava/lang/String;
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getFirstName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1036
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getFirstName()Ljava/lang/String;

    move-result-object v0

    .line 1037
    :cond_1
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getLastName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 1038
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getLastName()Ljava/lang/String;

    move-result-object v2

    .line 1039
    :cond_2
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getMiddleName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1040
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getMiddleName()Ljava/lang/String;

    move-result-object v3

    .line 1041
    :cond_3
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 1042
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$6(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Lcom/facebook/model/GraphUser;

    move-result-object v4

    invoke-interface {v4}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v1

    .line 1044
    :cond_4
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-virtual {v4, v0, v2, v3, v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnLoggedInUserDetails(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1045
    const-string v4, "FACEBOOK"

    const-string v5, "SessionStatusCallback(): checking permissions..."

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1046
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    const-string v5, "userpic.jpg"

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->FetchUserPicture(Ljava/lang/String;I)V

    .line 1047
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    invoke-virtual {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->FetchFriendsData()V

    .line 1053
    .end local v0    # "fname":Ljava/lang/String;
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "lname":Ljava/lang/String;
    .end local v3    # "mname":Ljava/lang/String;
    :goto_0
    return-void

    .line 1051
    :cond_5
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;->this$1:Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;

    invoke-static {v4}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    move-result-object v4

    const-string v5, "EVENT_USER_DETAILS_FAILED"

    invoke-virtual {v4, v5}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnEvent(Ljava/lang/String;)V

    goto :goto_0
.end method
