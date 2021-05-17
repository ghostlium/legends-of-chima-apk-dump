.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Lcom/facebook/Session$StatusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SessionStatusCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;


# direct methods
.method private constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)V
    .locals 0

    .prologue
    .line 929
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)V
    .locals 0

    .prologue
    .line 929
    invoke-direct {p0, p1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)V

    return-void
.end method

.method static synthetic access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;
    .locals 1

    .prologue
    .line 929
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-object v0
.end method


# virtual methods
.method public call(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    .locals 10
    .param p1, "session"    # Lcom/facebook/Session;
    .param p2, "state"    # Lcom/facebook/SessionState;
    .param p3, "exception"    # Ljava/lang/Exception;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 937
    sget-object v1, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    if-ne p2, v1, :cond_1

    .line 939
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const-string v2, "EVENT_STATE_CLOSED_LOGIN_FAILED"

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnEvent(Ljava/lang/String;)V

    .line 1056
    :cond_0
    :goto_0
    return-void

    .line 941
    :cond_1
    sget-object v1, Lcom/facebook/SessionState;->CLOSED:Lcom/facebook/SessionState;

    if-ne p2, v1, :cond_2

    .line 943
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const-string v2, "EVENT_CLOSED"

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnEvent(Ljava/lang/String;)V

    goto :goto_0

    .line 946
    :cond_2
    sget-object v1, Lcom/facebook/SessionState;->OPENED_TOKEN_UPDATED:Lcom/facebook/SessionState;

    if-ne p2, v1, :cond_8

    .line 951
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 955
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "POST_STORY"

    if-ne v1, v2, :cond_3

    .line 957
    new-array v1, v8, [Ljava/lang/String;

    const-string v2, "publish_actions"

    aput-object v2, v1, v7

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 958
    .local v0, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    .line 959
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$2(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 962
    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "type"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v2

    const-string v4, "target_url"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postStory(Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    .end local v0    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "POST_PHOTO"

    if-ne v1, v2, :cond_4

    .line 972
    new-array v1, v9, [Ljava/lang/String;

    const-string v2, "publish_stream"

    aput-object v2, v1, v7

    const-string v2, "photo_upload"

    aput-object v2, v1, v8

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 973
    .restart local v0    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    .line 974
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$2(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 977
    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "title"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v2

    const-string v3, "message"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v3

    const-string v5, "picture_path"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v1, v2, v3}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postPhoto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 987
    .end local v0    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "POST_SCREENSHOT"

    if-ne v1, v2, :cond_0

    .line 989
    new-array v1, v9, [Ljava/lang/String;

    const-string v2, "publish_stream"

    aput-object v2, v1, v7

    const-string v2, "photo_upload"

    aput-object v2, v1, v8

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 990
    .restart local v0    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    .line 991
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$2(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 994
    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v1

    const-string v2, "title"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$3(Lcom/cobra/zufflin/facebook/ZufflinFacebook;)Ljava/util/Map;

    move-result-object v2

    const-string v4, "picture_path"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postScreenshot(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 967
    :cond_5
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 982
    :cond_6
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    goto :goto_2

    .line 999
    :cond_7
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    invoke-static {v1, v6}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->access$1(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1007
    .end local v0    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_8
    invoke-virtual {p1}, Lcom/facebook/Session;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1010
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    const-string v2, "EVENT_STATE_OPEN"

    invoke-virtual {v1, v2}, Lcom/cobra/zufflin/facebook/ZufflinFacebook;->passOnEvent(Ljava/lang/String;)V

    .line 1013
    new-instance v1, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$SessionStatusCallback;)V

    .line 1012
    invoke-static {p1, v1}, Lcom/facebook/Request;->newMeRequest(Lcom/facebook/Session;Lcom/facebook/Request$GraphUserCallback;)Lcom/facebook/Request;

    move-result-object v1

    .line 1054
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    goto/16 :goto_0
.end method
