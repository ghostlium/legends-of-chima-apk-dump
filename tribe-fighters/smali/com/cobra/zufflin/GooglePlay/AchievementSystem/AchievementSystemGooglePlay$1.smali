.class Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay$1;
.super Ljava/lang/Object;
.source "AchievementSystemGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->login()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;


# direct methods
.method constructor <init>(Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 53
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    .line 54
    .local v0, "status":I
    if-nez v0, :cond_1

    .line 55
    const-string v1, "GOOGLE"

    const-string v2, "SUCCESS"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    :cond_0
    :goto_0
    const-string v1, "GOOGLE"

    const-string v2, "GooglePlay login(): beginUserInitiatedSignIn"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay$1;->this$0:Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;

    invoke-virtual {v1}, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->beginUserInitiatedSignIn()V

    .line 69
    return-void

    .line 56
    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 57
    const-string v1, "GOOGLE"

    const-string v2, "SERVICE_MISSING"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 58
    :cond_2
    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 59
    const-string v1, "GOOGLE"

    const-string v2, "SERVICE_VERSION_UPDATE_REQUIRED"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 60
    :cond_3
    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    .line 61
    const-string v1, "GOOGLE"

    const-string v2, "SERVICE_DISABLED"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 62
    :cond_4
    const/16 v1, 0x9

    if-ne v0, v1, :cond_5

    .line 63
    const-string v1, "GOOGLE"

    const-string v2, "SERVICE_INVALID"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 64
    :cond_5
    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    .line 65
    const-string v1, "GOOGLE"

    const-string v2, "DATE_INVALID"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
