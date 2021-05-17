.class Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;
.super Ljava/lang/Object;
.source "ZufflinFacebook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/facebook/ZufflinFacebook;->FetchUserDataByID(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

.field private final synthetic val$userID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    iput-object p2, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->val$userID:Ljava/lang/String;

    .line 305
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;)Lcom/cobra/zufflin/facebook/ZufflinFacebook;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->this$0:Lcom/cobra/zufflin/facebook/ZufflinFacebook;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 311
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v2

    iget-object v3, p0, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;->val$userID:Ljava/lang/String;

    .line 312
    new-instance v4, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2$1;

    invoke-direct {v4, p0}, Lcom/cobra/zufflin/facebook/ZufflinFacebook$2$1;-><init>(Lcom/cobra/zufflin/facebook/ZufflinFacebook$2;)V

    .line 311
    invoke-static {v2, v3, v4}, Lcom/facebook/Request;->newGraphPathRequest(Lcom/facebook/Session;Ljava/lang/String;Lcom/facebook/Request$Callback;)Lcom/facebook/Request;

    move-result-object v1

    .line 344
    .local v1, "req":Lcom/facebook/Request;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 345
    .local v0, "params":Landroid/os/Bundle;
    const-string v2, "fields"

    const-string v3, "id,first_name,last_name"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    invoke-virtual {v1, v0}, Lcom/facebook/Request;->setParameters(Landroid/os/Bundle;)V

    .line 347
    invoke-virtual {v1}, Lcom/facebook/Request;->executeAsync()Lcom/facebook/RequestAsyncTask;

    .line 348
    return-void
.end method
