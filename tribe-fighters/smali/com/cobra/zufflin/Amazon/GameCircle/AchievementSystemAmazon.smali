.class public Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;
.super Ljava/lang/Object;
.source "AchievementSystemAmazon.java"

# interfaces
.implements Lcom/cobra/zufflin/ZufflinActivityListener;


# static fields
.field public static singleton:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;


# instance fields
.field agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

.field callback:Lcom/amazon/ags/api/AmazonGamesCallback;

.field myGameFeatures:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/amazon/ags/api/AmazonGamesFeature;",
            ">;"
        }
    .end annotation
.end field

.field signedIn:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->signedIn:Z

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    .line 28
    sget-object v0, Lcom/amazon/ags/api/AmazonGamesFeature;->Achievements:Lcom/amazon/ags/api/AmazonGamesFeature;

    sget-object v1, Lcom/amazon/ags/api/AmazonGamesFeature;->Leaderboards:Lcom/amazon/ags/api/AmazonGamesFeature;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->myGameFeatures:Ljava/util/EnumSet;

    .line 30
    new-instance v0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;

    invoke-direct {v0, p0}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$1;-><init>(Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;)V

    iput-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->callback:Lcom/amazon/ags/api/AmazonGamesCallback;

    .line 57
    sput-object p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->singleton:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    .line 58
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->callback:Lcom/amazon/ags/api/AmazonGamesCallback;

    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->myGameFeatures:Ljava/util/EnumSet;

    invoke-static {v0, v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->initialize(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V

    .line 59
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->singleton:Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;

    .line 64
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->shutdown()V

    .line 65
    return-void
.end method

.method protected hasSignInError()Z
    .locals 1

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->signedIn:Z

    return v0
.end method

.method public isSignedIn()Z
    .locals 1

    .prologue
    .line 142
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->isInitialized()Z

    move-result v0

    return v0
.end method

.method public login()V
    .locals 4

    .prologue
    .line 71
    iget-object v1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v1, :cond_0

    .line 73
    const/4 v0, 0x0

    .line 74
    .local v0, "arg0":Ljava/lang/Object;
    iget-object v1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    .line 76
    .end local v0    # "arg0":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method public logout()V
    .locals 0

    .prologue
    .line 80
    return-void
.end method

.method public native nativeLoginComplete(Z)V
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 194
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_0

    .line 182
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->shutdown()V

    .line 184
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v0, :cond_0

    .line 167
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->release()V

    .line 169
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 174
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->callback:Lcom/amazon/ags/api/AmazonGamesCallback;

    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->myGameFeatures:Ljava/util/EnumSet;

    invoke-static {v0, v1, v2}, Lcom/amazon/ags/api/AmazonGamesClient;->initialize(Landroid/app/Activity;Lcom/amazon/ags/api/AmazonGamesCallback;Ljava/util/EnumSet;)V

    .line 175
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 189
    return-void
.end method

.method public onSignInFailed()V
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->nativeLoginComplete(Z)V

    .line 153
    return-void
.end method

.method public onSignInSucceeded()V
    .locals 1

    .prologue
    .line 157
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->nativeLoginComplete(Z)V

    .line 158
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 132
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 138
    return-void
.end method

.method public setAchievementComplete(Ljava/lang/String;)V
    .locals 4
    .param p1, "apiName"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v2, :cond_0

    .line 86
    iget-object v2, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-virtual {v2}, Lcom/amazon/ags/api/AmazonGamesClient;->getAchievementsClient()Lcom/amazon/ags/api/achievements/AchievementsClient;

    move-result-object v0

    .line 88
    .local v0, "acClient":Lcom/amazon/ags/api/achievements/AchievementsClient;
    const/high16 v2, 0x42c80000    # 100.0f

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v0, p1, v2, v3}, Lcom/amazon/ags/api/achievements/AchievementsClient;->updateProgress(Ljava/lang/String;F[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v1

    .line 91
    .local v1, "handle":Lcom/amazon/ags/api/AGResponseHandle;, "Lcom/amazon/ags/api/AGResponseHandle<Lcom/amazon/ags/api/achievements/UpdateProgressResponse;>;"
    new-instance v2, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$2;

    invoke-direct {v2, p0}, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon$2;-><init>(Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;)V

    invoke-interface {v1, v2}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    .line 111
    .end local v0    # "acClient":Lcom/amazon/ags/api/achievements/AchievementsClient;
    .end local v1    # "handle":Lcom/amazon/ags/api/AGResponseHandle;, "Lcom/amazon/ags/api/AGResponseHandle<Lcom/amazon/ags/api/achievements/UpdateProgressResponse;>;"
    :cond_0
    return-void
.end method

.method public showAchievementsInterface()V
    .locals 2

    .prologue
    .line 115
    iget-object v1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    if-eqz v1, :cond_0

    .line 117
    iget-object v1, p0, Lcom/cobra/zufflin/Amazon/GameCircle/AchievementSystemAmazon;->agsClient:Lcom/amazon/ags/api/AmazonGamesClient;

    invoke-virtual {v1}, Lcom/amazon/ags/api/AmazonGamesClient;->getAchievementsClient()Lcom/amazon/ags/api/achievements/AchievementsClient;

    move-result-object v0

    .line 118
    .local v0, "acClient":Lcom/amazon/ags/api/achievements/AchievementsClient;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/achievements/AchievementsClient;->showAchievementsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    .line 126
    .end local v0    # "acClient":Lcom/amazon/ags/api/achievements/AchievementsClient;
    :cond_0
    return-void
.end method
