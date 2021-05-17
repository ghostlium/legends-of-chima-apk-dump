.class Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;
.super Ljava/lang/Object;
.source "AchievementSystemAmazon.java"

# interfaces
.implements Lcom/amazon/ags/api/AmazonGamesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceNotReady(Lcom/amazon/ags/api/AmazonGamesStatus;)V
    .locals 2
    .param p1, "status"    # Lcom/amazon/ags/api/AmazonGamesStatus;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    invoke-virtual {v0}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->onSignInFailed()V

    .line 38
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->signedIn:Z

    .line 43
    return-void
.end method

.method public onServiceReady(Lcom/amazon/ags/api/AmazonGamesClient;)V
    .locals 2
    .param p1, "amazonGamesClient"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    iput-object p1, v0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    .line 50
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    invoke-virtual {v0}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->onSignInSucceeded()V

    .line 51
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->signedIn:Z

    .line 52
    return-void
.end method
