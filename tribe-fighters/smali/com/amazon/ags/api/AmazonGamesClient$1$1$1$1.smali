.class Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;
.super Ljava/lang/Object;
.source "AmazonGamesClient.java"

# interfaces
.implements Lcom/amazon/ags/client/KindleFireBindingCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;


# direct methods
.method constructor <init>(Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;)V
    .locals 0

    .prologue
    .line 212
    iput-object p1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBound()V
    .locals 3

    .prologue
    .line 220
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-boolean v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$reinitialize:Z

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->val$startTime:Ljava/util/Date;

    invoke-static {v0, v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$700(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;)V

    .line 221
    return-void
.end method

.method public onFailure(Lcom/amazon/ags/client/KindleFireStatus;)V
    .locals 3
    .param p1, "status"    # Lcom/amazon/ags/client/KindleFireStatus;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-object v0, v0, Lcom/amazon/ags/api/AmazonGamesClient$1;->this$0:Lcom/amazon/ags/api/AmazonGamesClient;

    iget-object v1, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->this$1:Lcom/amazon/ags/api/AmazonGamesClient$1;

    iget-boolean v1, v1, Lcom/amazon/ags/api/AmazonGamesClient$1;->val$reinitialize:Z

    iget-object v2, p0, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1$1;->this$3:Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1$1$1;->this$2:Lcom/amazon/ags/api/AmazonGamesClient$1$1;

    iget-object v2, v2, Lcom/amazon/ags/api/AmazonGamesClient$1$1;->val$startTime:Ljava/util/Date;

    invoke-static {v0, v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->access$700(Lcom/amazon/ags/api/AmazonGamesClient;ZLjava/util/Date;)V

    .line 216
    return-void
.end method
