.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->postStory(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

.field private final synthetic val$target_url:Ljava/lang/String;

.field private final synthetic val$type:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$type:Ljava/lang/String;

    iput-object p3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$target_url:Ljava/lang/String;

    .line 639
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;
    .locals 1

    .prologue
    .line 639
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 645
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 648
    .local v3, "params":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$type:Ljava/lang/String;

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$type:Ljava/lang/String;

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 649
    .local v6, "target_type":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "me/"

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$type:Ljava/lang/String;

    iget-object v5, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$type:Ljava/lang/String;

    const-string v7, ":"

    invoke-virtual {v5, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 651
    .local v2, "ogPost":Ljava/lang/String;
    iget-object v1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;->val$target_url:Ljava/lang/String;

    invoke-virtual {v3, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    new-instance v0, Lcom/facebook/Request;

    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v1

    .line 659
    sget-object v4, Lcom/facebook/HttpMethod;->POST:Lcom/facebook/HttpMethod;

    .line 660
    new-instance v5, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6$1;

    invoke-direct {v5, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$6$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$6;)V

    .line 656
    invoke-direct/range {v0 .. v5}, Lcom/facebook/Request;-><init>(Lcom/facebook/Session;Ljava/lang/String;Landroid/os/Bundle;Lcom/facebook/HttpMethod;Lcom/facebook/Request$Callback;)V

    .local v0, "postOGRequest":Lcom/facebook/Request;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/facebook/Request;

    .line 681
    aput-object v0, v1, v8

    invoke-static {v1}, Lcom/facebook/Request;->executeBatchAsync([Lcom/facebook/Request;)Lcom/facebook/RequestAsyncTask;

    .line 682
    return-void
.end method
