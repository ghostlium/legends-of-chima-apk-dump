.class public abstract Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BaseGameActivity.java"

# interfaces
.implements Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;


# static fields
.field public static final CLIENT_ALL:I = 0x7

.field public static final CLIENT_APPSTATE:I = 0x4

.field public static final CLIENT_GAMES:I = 0x1

.field public static final CLIENT_PLUS:I = 0x2


# instance fields
.field private mAdditionalScopes:[Ljava/lang/String;

.field protected mDebugLog:Z

.field protected mDebugTag:Ljava/lang/String;

.field protected mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

.field protected mRequestedClients:I


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 68
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mRequestedClients:I

    .line 63
    const-string v0, "BaseGameActivity"

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugTag:Ljava/lang/String;

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugLog:Z

    .line 69
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-direct {v0, p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    .line 70
    return-void
.end method

.method protected constructor <init>(I)V
    .locals 2
    .param p1, "requestedClients"    # I

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mRequestedClients:I

    .line 63
    const-string v0, "BaseGameActivity"

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugTag:Ljava/lang/String;

    .line 64
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugLog:Z

    .line 79
    new-array v0, v1, [Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->setRequestedClients(I[Ljava/lang/String;)V

    .line 80
    return-void
.end method


# virtual methods
.method protected beginUserInitiatedSignIn()V
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->beginUserInitiatedSignIn()V

    .line 144
    return-void
.end method

.method protected enableDebugLog(ZLjava/lang/String;)V
    .locals 1
    .param p1, "enabled"    # Z
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugLog:Z

    .line 160
    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugTag:Ljava/lang/String;

    .line 161
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->enableDebugLog(ZLjava/lang/String;)V

    .line 164
    :cond_0
    return-void
.end method

.method protected getAppStateClient()Lcom/google/android/gms/appstate/AppStateClient;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getAppStateClient()Lcom/google/android/gms/appstate/AppStateClient;

    move-result-object v0

    return-object v0
.end method

.method protected getGamesClient()Lcom/google/android/gms/games/GamesClient;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getGamesClient()Lcom/google/android/gms/games/GamesClient;

    move-result-object v0

    return-object v0
.end method

.method protected getInvitationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getInvitationId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPlusClient()Lcom/google/android/gms/plus/PlusClient;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getPlusClient()Lcom/google/android/gms/plus/PlusClient;

    move-result-object v0

    return-object v0
.end method

.method protected getScopes()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getScopes()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getScopesArray()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getScopesArray()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSignInError()Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getSignInError()Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    move-result-object v0

    return-object v0
.end method

.method protected hasSignInError()Z
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->hasSignInError()Z

    move-result v0

    return v0
.end method

.method protected isSignedIn()Z
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->isSignedIn()Z

    move-result v0

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "request"    # I
    .param p2, "response"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 122
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 123
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->onActivityResult(IILandroid/content/Intent;)V

    .line 124
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 100
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 101
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-direct {v0, p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    .line 102
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugLog:Z

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    iget-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugLog:Z

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mDebugTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->enableDebugLog(ZLjava/lang/String;)V

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mRequestedClients:I

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mAdditionalScopes:[Ljava/lang/String;

    invoke-virtual {v0, p0, v1, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setup(Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;I[Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 110
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStart()V

    .line 111
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->onStart(Landroid/app/Activity;)V

    .line 112
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 116
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onStop()V

    .line 117
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->onStop()V

    .line 118
    return-void
.end method

.method protected reconnectClients(I)V
    .locals 1
    .param p1, "whichClients"    # I

    .prologue
    .line 171
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->reconnectClients(I)V

    .line 172
    return-void
.end method

.method protected varargs setRequestedClients(I[Ljava/lang/String;)V
    .locals 0
    .param p1, "requestedClients"    # I
    .param p2, "additionalScopes"    # [Ljava/lang/String;

    .prologue
    .line 94
    iput p1, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mRequestedClients:I

    .line 95
    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mAdditionalScopes:[Ljava/lang/String;

    .line 96
    return-void
.end method

.method protected showAlert(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->showAlert(Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method protected showAlert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0, p1, p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->showAlert(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method protected signOut()V
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/BaseGameActivity;->mHelper:Lcom/cobra/zufflin/GooglePlay/GameHelper;

    invoke-virtual {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->signOut()V

    .line 148
    return-void
.end method
