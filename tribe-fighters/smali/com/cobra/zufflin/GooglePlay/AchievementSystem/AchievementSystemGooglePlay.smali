.class public Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;
.super Ljava/lang/Object;
.source "AchievementSystemGooglePlay.java"

# interfaces
.implements Lcom/cobra/zufflin/ZufflinActivityListener;
.implements Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;


# static fields
.field public static final CLIENT_ALL:I = 0x7

.field public static final CLIENT_APPSTATE:I = 0x4

.field public static final CLIENT_GAMES:I = 0x1

.field public static final CLIENT_PLUS:I = 0x2

.field public static singleton:Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;


# instance fields
.field explicitSignOut:Z

.field inSignInFlow:Z

.field private mAdditionalScopes:[Ljava/lang/String;

.field protected mDebugLog:Z

.field protected mDebugTag:Ljava/lang/String;

.field protected mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

.field protected mRequestedClients:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->explicitSignOut:Z

    .line 21
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->inSignInFlow:Z

    .line 101
    const/4 v0, 0x1

    iput v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mRequestedClients:I

    .line 106
    const-string v0, "BaseGameActivity"

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugTag:Ljava/lang/String;

    .line 107
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugLog:Z

    .line 26
    sput-object p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->singleton:Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;

    .line 27
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/ZufflinActivity;->addActivityListener(Lcom/cobra/zufflin/ZufflinActivityListener;)V

    .line 29
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    .line 31
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugLog:Z

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    iget-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugLog:Z

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->enableDebugLog(ZLjava/lang/String;)V

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mRequestedClients:I

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mAdditionalScopes:[Ljava/lang/String;

    invoke-virtual {v0, p0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setup(Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;I[Ljava/lang/String;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected beginUserInitiatedSignIn()V
    .locals 3

    .prologue
    .line 173
    :try_start_0
    const-string v1, "GOOGLE"

    const-string v2, "GooglePlay beginUserInitiatedSignIn()"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->beginUserInitiatedSignIn()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :goto_0
    return-void

    .line 176
    :catch_0
    move-exception v0

    .line 178
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->singleton:Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;

    .line 42
    return-void
.end method

.method protected enableDebugLog(ZLjava/lang/String;)V
    .locals 1
    .param p1, "enabled"    # Z
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 199
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugLog:Z

    .line 200
    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mDebugTag:Ljava/lang/String;

    .line 201
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->enableDebugLog(ZLjava/lang/String;)V

    .line 205
    :cond_0
    return-void
.end method

.method protected getAppStateClient()Lcom/google/android/gms/appstate/AppStateClient;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getAppStateClient()Lcom/google/android/gms/appstate/AppStateClient;

    move-result-object v0

    return-object v0
.end method

.method protected getGamesClient()Lcom/google/android/gms/games/GamesClient;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    return-object v0
.end method

.method protected getInvitationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getInvitationId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPlusClient()Lcom/google/android/gms/plus/PlusClient;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getPlusClient()Lcom/google/android/gms/plus/PlusClient;

    move-result-object v0

    return-object v0
.end method

.method protected getScopes()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getScopes()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getScopesArray()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getScopesArray()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSignInError()Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;
    .locals 2

    .prologue
    .line 235
    const-string v0, "GOOGLE"

    const-string v1, "getSignInError"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getSignInError()Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    move-result-object v0

    return-object v0
.end method

.method protected hasSignInError()Z
    .locals 2

    .prologue
    .line 229
    const-string v0, "GOOGLE"

    const-string v1, "hasSignInError"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->hasSignInError()Z

    move-result v0

    return v0
.end method

.method public isSignedIn()Z
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->isSignedIn()Z

    move-result v0

    return v0
.end method

.method public login()V
    .locals 2

    .prologue
    .line 46
    const-string v0, "GOOGLE"

    const-string v1, "GooglePlay login()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    new-instance v1, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay$1;

    invoke-direct {v1, p0}, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay$1;-><init>(Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;)V

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/ZufflinActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 71
    return-void
.end method

.method public logout()V
    .locals 0

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->signOut()V

    .line 76
    return-void
.end method

.method public native nativeLoginComplete(Z)V
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "request"    # I
    .param p2, "response"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 145
    const-string v0, "GOOGLE"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->onActivityResult(IILandroid/content/Intent;)V

    .line 147
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 268
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 258
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 263
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 273
    return-void
.end method

.method public onSignInFailed()V
    .locals 2

    .prologue
    .line 242
    const-string v0, "GOOGLE"

    const-string v1, "onSignInFailed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->nativeLoginComplete(Z)V

    .line 244
    return-void
.end method

.method public onSignInSucceeded()V
    .locals 2

    .prologue
    .line 249
    const-string v0, "GOOGLE"

    const-string v1, "onSignInSucceeded"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->nativeLoginComplete(Z)V

    .line 251
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->onStart(Landroid/app/Activity;)V

    .line 134
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->onStop()V

    .line 140
    return-void
.end method

.method protected reconnectClients(I)V
    .locals 1
    .param p1, "whichClients"    # I

    .prologue
    .line 214
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->reconnectClients(I)V

    .line 215
    return-void
.end method

.method public setAchievementComplete(Ljava/lang/String;)V
    .locals 1
    .param p1, "apiName"    # Ljava/lang/String;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/games/GamesClient;->unlockAchievement(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method protected varargs setRequestedClients(I[Ljava/lang/String;)V
    .locals 0
    .param p1, "requestedClients"    # I
    .param p2, "additionalScopes"    # [Ljava/lang/String;

    .prologue
    .line 126
    iput p1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mRequestedClients:I

    .line 127
    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mAdditionalScopes:[Ljava/lang/String;

    .line 128
    return-void
.end method

.method public showAchievementsInterface()V
    .locals 3

    .prologue
    .line 85
    const-string v0, "GOOGLE"

    const-string v1, "showAchievementsInterface"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/games/GamesClient;->getAchievementsIntent()Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/cobra/zufflin/ZufflinActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 87
    return-void
.end method

.method protected showAlert(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 194
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->showAlert(Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method protected showAlert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->showAlert(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method protected signOut()V
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/AchievementSystem/AchievementSystemGooglePlay;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->signOut()V

    .line 185
    return-void
.end method
