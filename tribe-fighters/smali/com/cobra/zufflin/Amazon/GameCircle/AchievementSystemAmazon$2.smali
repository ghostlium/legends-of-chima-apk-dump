.class Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$2;
.super Ljava/lang/Object;
.source "AchievementSystemAmazon.java"

# interfaces
.implements Lcom/amazon/ags/api/AGResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->setAchievementComplete(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/ags/api/AGResponseCallback",
        "<",
        "Lcom/amazon/ags/api/achievements/UpdateProgressResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$2;->this$0:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onComplete(Lcom/amazon/ags/api/RequestResponse;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Lcom/amazon/ags/api/achievements/UpdateProgressResponse;

    invoke-virtual {p0, p1}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$2;->onComplete(Lcom/amazon/ags/api/achievements/UpdateProgressResponse;)V

    return-void
.end method

.method public onComplete(Lcom/amazon/ags/api/achievements/UpdateProgressResponse;)V
    .locals 2
    .param p1, "result"    # Lcom/amazon/ags/api/achievements/UpdateProgressResponse;

    .prologue
    .line 97
    invoke-interface {p1}, Lcom/amazon/ags/api/achievements/UpdateProgressResponse;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    const-string v0, "ACHIEVEMENTS"

    const-string v1, "Error on setAchievementComplete()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :goto_0
    return-void

    .line 106
    :cond_0
    const-string v0, "ACHIEVEMENTS"

    const-string v1, "setAchievementComplete() success"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
