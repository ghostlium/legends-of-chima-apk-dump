.class Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/api/AmazonGamesClient$1$1;->onFailure()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;


# direct methods
.method constructor <init>(Lcom/amazon/ags/api/AmazonGamesClient$1$1;)V
    .locals 0

    .prologue
    .line 229
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 231
    sget-object v5, Lcom/amazon/ags/api/AmazonGamesStatus;->CANNOT_INITIALIZE:Lcom/amazon/ags/api/AmazonGamesStatus;

    .line 232
    .local v5, "status":Lcom/amazon/ags/api/AmazonGamesStatus;
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-boolean v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$reinitialize:Z

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->val$startTime:Ljava/util/Date;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Lcom/amazon/ags/api/AmazonGamesClient;->access$900(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;Ljava/util/Date;ZLcom/amazon/ags/api/AmazonGamesStatus;)V

    .line 233
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$2;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$amazonGamesCallback:Lcom/amazon/ags/api/AmazonGamesCallback;

    invoke-interface {v0, v5}, Lcom/amazon/ags/api/AmazonGamesCallback;->onServiceNotReady(Lcom/amazon/ags/api/AmazonGamesStatus;)V

    .line 234
    return-void
.end method
