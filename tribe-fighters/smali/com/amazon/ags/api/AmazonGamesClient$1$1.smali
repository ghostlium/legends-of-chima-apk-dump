.class Lcom/amazon/ags/api/AmazonGamesClient$1$1;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Lcom/amazon/ags/html5/content/ContentManager$ContentInitializationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/api/AmazonGamesClient$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

.field final synthetic val$startTime:Ljava/util/Date;


# direct methods
.method constructor <init>(Lcom/amazon/ags/api/AmazonGamesClient$1;Ljava/util/Date;)V
    .locals 0

    .prologue
    .line 204
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iput-object p2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->val$startTime:Ljava/util/Date;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 2

    .prologue
    .line 229
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$800(Lcom/amazon/ags/api/AmazonGamesClient;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;

    invoke-direct {v1, p0}, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;-><init>(Lcom/amazon/ags/api/AmazonGamesClient$1$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 236
    return-void
.end method

.method public onInitialized()V
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-static {v0}, Lcom/amazon/ags/api/AmazonGamesClient;->access$800(Lcom/amazon/ags/api/AmazonGamesClient;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    invoke-direct {v1, p0}, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;-><init>(Lcom/amazon/ags/api/AmazonGamesClient$1$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 225
    return-void
.end method
