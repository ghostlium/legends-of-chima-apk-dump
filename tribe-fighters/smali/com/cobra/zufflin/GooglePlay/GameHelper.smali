.class public Lcom/cobra/zufflin/GooglePlay/GameHelper;
.super Ljava/lang/Object;
.source "GameHelper.java"

# interfaces
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;,
        Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;
    }
.end annotation


# static fields
.field public static final CLIENT_ALL:I = 0x7

.field public static final CLIENT_APPSTATE:I = 0x4

.field public static final CLIENT_GAMES:I = 0x1

.field public static final CLIENT_NONE:I = 0x0

.field public static final CLIENT_PLUS:I = 0x2

.field static final RC_RESOLVE:I = 0x2329

.field static final RC_UNUSED:I = 0x232a

.field public static final STATE_CONNECTED:I = 0x3

.field public static final STATE_CONNECTING:I = 0x2

.field public static final STATE_DISCONNECTED:I = 0x1

.field public static final STATE_NAMES:[Ljava/lang/String;

.field public static final STATE_UNCONFIGURED:I = 0x0

.field private static final TYPE_DEVELOPER_ERROR:I = 0x3e9

.field private static final TYPE_GAMEHELPER_BUG:I = 0x3ea


# instance fields
.field mActivity:Landroid/app/Activity;

.field mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

.field mAutoSignIn:Z

.field mClientCurrentlyConnecting:I

.field mConnectedClients:I

.field mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

.field mDebugLog:Z

.field mDebugTag:Ljava/lang/String;

.field mExpectingResolution:Z

.field mGamesClient:Lcom/google/android/gms/games/GamesClient;

.field mInvitationId:Ljava/lang/String;

.field mListener:Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

.field mPlusClient:Lcom/google/android/gms/plus/PlusClient;

.field mRequestedClients:I

.field mScopes:[Ljava/lang/String;

.field mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

.field mState:I

.field mTurnBasedMatch:Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;

.field mUserInitiatedSignIn:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 76
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 77
    const-string v2, "UNCONFIGURED"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "DISCONNECTED"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "CONNECTING"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "CONNECTED"

    aput-object v2, v0, v1

    .line 76
    sput-object v0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    .line 170
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    .line 84
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mExpectingResolution:Z

    .line 91
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    .line 104
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    .line 105
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    .line 106
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    .line 116
    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mRequestedClients:I

    .line 119
    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 122
    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAutoSignIn:Z

    .line 133
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mUserInitiatedSignIn:Z

    .line 136
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 139
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 142
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugLog:Z

    .line 143
    const-string v0, "GameHelper"

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugTag:Ljava/lang/String;

    .line 158
    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mListener:Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

    .line 166
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    .line 167
    return-void
.end method

.method static activityResponseCodeToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "respCode"    # I

    .prologue
    .line 552
    sparse-switch p0, :sswitch_data_0

    .line 568
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 554
    :sswitch_0
    const-string v0, "RESULT_OK"

    goto :goto_0

    .line 556
    :sswitch_1
    const-string v0, "RESULT_CANCELED"

    goto :goto_0

    .line 558
    :sswitch_2
    const-string v0, "RESULT_APP_MISCONFIGURED"

    goto :goto_0

    .line 560
    :sswitch_3
    const-string v0, "RESULT_LEFT_ROOM"

    goto :goto_0

    .line 562
    :sswitch_4
    const-string v0, "RESULT_LICENSE_FAILED"

    goto :goto_0

    .line 564
    :sswitch_5
    const-string v0, "RESULT_RECONNECT_REQUIRED"

    goto :goto_0

    .line 566
    :sswitch_6
    const-string v0, "SIGN_IN_FAILED"

    goto :goto_0

    .line 552
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x0 -> :sswitch_1
        0x2711 -> :sswitch_5
        0x2712 -> :sswitch_6
        0x2713 -> :sswitch_4
        0x2714 -> :sswitch_2
        0x2715 -> :sswitch_3
    .end sparse-switch
.end method

.method static errorCodeToString(I)Ljava/lang/String;
    .locals 2
    .param p0, "errorCode"    # I

    .prologue
    .line 1058
    packed-switch p0, :pswitch_data_0

    .line 1084
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown error code "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 1060
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DEVELOPER_ERROR("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1062
    :pswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "INTERNAL_ERROR("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1064
    :pswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "INVALID_ACCOUNT("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1066
    :pswitch_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LICENSE_CHECK_FAILED("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1068
    :pswitch_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "NETWORK_ERROR("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1070
    :pswitch_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "RESOLUTION_REQUIRED("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1072
    :pswitch_6
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SERVICE_DISABLED("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1074
    :pswitch_7
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SERVICE_INVALID("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1076
    :pswitch_8
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SERVICE_MISSING("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1078
    :pswitch_9
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SERVICE_VERSION_UPDATE_REQUIRED("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1080
    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SIGN_IN_REQUIRED("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1082
    :pswitch_b
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SUCCESS("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1058
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_8
        :pswitch_9
        :pswitch_6
        :pswitch_a
        :pswitch_2
        :pswitch_5
        :pswitch_4
        :pswitch_1
        :pswitch_7
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method addToScope(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 1
    .param p1, "scopeStringBuilder"    # Ljava/lang/StringBuilder;
    .param p2, "scope"    # Ljava/lang/String;

    .prologue
    .line 695
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 696
    const-string v0, "oauth2:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 700
    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 701
    return-void

    .line 698
    :cond_0
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method assertConfigured(Ljava/lang/String;)V
    .locals 3
    .param p1, "operation"    # Ljava/lang/String;

    .prologue
    .line 205
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    if-nez v1, :cond_0

    .line 206
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GameHelper error: Operation attempted without setup: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 207
    const-string v2, ". The setup() method must be called before attempting any other operation."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 206
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "error":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logError(Ljava/lang/String;)V

    .line 209
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 211
    .end local v0    # "error":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public beginUserInitiatedSignIn()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 640
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 642
    const-string v1, "beginUserInitiatedSignIn() called when already connected. Calling listener directly to notify of success."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 644
    invoke-virtual {p0, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    .line 688
    :goto_0
    return-void

    .line 646
    :cond_0
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    if-ne v1, v5, :cond_1

    .line 647
    const-string v1, "beginUserInitiatedSignIn() called when already connecting. Be patient! You can only call this method after you get an onSignInSucceeded() or onSignInFailed() callback. Suggestion: disable the sign-in button on startup and also when it\'s clicked, and re-enable when you get the callback."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    goto :goto_0

    .line 656
    :cond_1
    const-string v1, "Starting USER-INITIATED sign-in flow."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 659
    iput-boolean v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAutoSignIn:Z

    .line 662
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    .line 663
    .local v0, "result":I
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "isGooglePlayServicesAvailable returned "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 664
    if-eqz v0, :cond_2

    .line 666
    const-string v1, "Google Play services not available. Show error dialog."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 667
    new-instance v1, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    invoke-direct {v1, v0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;-><init>(II)V

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 668
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->showFailureDialog()V

    .line 669
    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    goto :goto_0

    .line 675
    :cond_2
    iput-boolean v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mUserInitiatedSignIn:Z

    .line 677
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v1, :cond_3

    .line 680
    const-string v1, "beginUserInitiatedSignIn: continuing pending sign-in flow."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 681
    invoke-virtual {p0, v5}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    .line 682
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->resolveConnectionResult()V

    goto :goto_0

    .line 685
    :cond_3
    const-string v1, "beginUserInitiatedSignIn: starting new sign-in flow."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 686
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->startConnections()V

    goto :goto_0
.end method

.method byteToString(Ljava/lang/StringBuilder;B)V
    .locals 5
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "b"    # B

    .prologue
    .line 1194
    if-gez p2, :cond_0

    add-int/lit16 v2, p2, 0x100

    .line 1195
    .local v2, "unsigned_byte":I
    :goto_0
    div-int/lit8 v0, v2, 0x10

    .line 1196
    .local v0, "hi":I
    rem-int/lit8 v1, v2, 0x10

    .line 1197
    .local v1, "lo":I
    const-string v3, "0123456789ABCDEF"

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1198
    const-string v3, "0123456789ABCDEF"

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1199
    return-void

    .end local v0    # "hi":I
    .end local v1    # "lo":I
    .end local v2    # "unsigned_byte":I
    :cond_0
    move v2, p2

    .line 1194
    goto :goto_0
.end method

.method varargs checkState(ILjava/lang/String;Ljava/lang/String;[I)Z
    .locals 7
    .param p1, "type"    # I
    .param p2, "operation"    # Ljava/lang/String;
    .param p3, "warning"    # Ljava/lang/String;
    .param p4, "expectedStates"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 173
    array-length v5, p4

    move v4, v3

    :goto_0
    if-lt v4, v5, :cond_1

    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/16 v4, 0x3e9

    if-ne p1, v4, :cond_2

    .line 180
    const-string v4, "GameHelper: you attempted an operation at an invalid. "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    :goto_1
    const-string v4, "Explanation: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    const-string v4, "Operation: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    const-string v4, "State: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v6, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    array-length v4, p4

    if-ne v4, v2, :cond_3

    .line 191
    const-string v2, "Expected state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v4, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    aget v5, p4, v3

    aget-object v4, v4, v5

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    :goto_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    move v2, v3

    .line 201
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    return v2

    .line 173
    :cond_1
    aget v0, p4, v4

    .line 174
    .local v0, "expectedState":I
    iget v6, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    if-eq v6, v0, :cond_0

    .line 173
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 182
    .end local v0    # "expectedState":I
    .restart local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_2
    const-string v4, "GameHelper: bug detected. Please report it at our bug tracker "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const-string v4, "https://github.com/playgameservices/android-samples/issues. "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    const-string v4, "Please include the last couple hundred lines of logcat output "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    const-string v4, "and describe the operation that caused this. "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 193
    :cond_3
    const-string v2, "Expected states:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    array-length v4, p4

    move v2, v3

    :goto_3
    if-lt v2, v4, :cond_4

    .line 197
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 194
    :cond_4
    aget v0, p4, v2

    .line 195
    .restart local v0    # "expectedState":I
    const-string v5, " "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    aget-object v6, v6, v0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method connectCurrentClient()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 765
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    if-ne v0, v3, :cond_1

    .line 767
    const-string v0, "GameHelper got disconnected during connection process. Aborting."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 786
    :cond_0
    :goto_0
    return-void

    .line 770
    :cond_1
    const/16 v0, 0x3ea

    const-string v1, "connectCurrentClient"

    const-string v2, "connectCurrentClient should only get called when connecting."

    new-array v3, v3, [I

    const/4 v4, 0x0

    .line 771
    const/4 v5, 0x2

    aput v5, v3, v4

    .line 770
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    move-result v0

    .line 771
    if-eqz v0, :cond_0

    .line 775
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 777
    :pswitch_1
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->connect()V

    goto :goto_0

    .line 780
    :pswitch_2
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->connect()V

    goto :goto_0

    .line 783
    :pswitch_3
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->connect()V

    goto :goto_0

    .line 775
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method connectNextClient()V
    .locals 4

    .prologue
    .line 716
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "connectNextClient: requested clients: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mRequestedClients:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 717
    const-string v2, ", connected clients: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 716
    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 720
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v1}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 721
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    .line 722
    const-string v1, "GamesClient was already connected. Fixing."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 723
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 725
    :cond_0
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v1}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 726
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_1

    .line 727
    const-string v1, "PlusClient was already connected. Fixing."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 728
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    or-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 730
    :cond_1
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v1}, Lcom/google/android/gms/appstate/AppStateClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 731
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_2

    .line 732
    const-string v1, "AppStateClient was already connected. Fixing"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 733
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 736
    :cond_2
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mRequestedClients:I

    iget v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    xor-int/lit8 v2, v2, -0x1

    and-int v0, v1, v2

    .line 737
    .local v0, "pendingClients":I
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Pending clients: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 739
    if-nez v0, :cond_3

    .line 740
    const-string v1, "All clients now connected. Sign-in successful!"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 741
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->succeedSignIn()V

    .line 762
    :goto_0
    return-void

    .line 746
    :cond_3
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v1, :cond_4

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_4

    .line 747
    const-string v1, "Connecting GamesClient."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 748
    const/4 v1, 0x1

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    .line 761
    :goto_1
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->connectCurrentClient()V

    goto :goto_0

    .line 749
    :cond_4
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v1, :cond_5

    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_5

    .line 750
    const-string v1, "Connecting PlusClient."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 751
    const/4 v1, 0x2

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    goto :goto_1

    .line 752
    :cond_5
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v1, :cond_6

    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_6

    .line 753
    const-string v1, "Connecting AppStateClient."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 754
    const/4 v1, 0x4

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    goto :goto_1

    .line 757
    :cond_6
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Not all clients connected, yet no one is next. R="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 758
    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mRequestedClients:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", C="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 757
    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method debugLog(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1044
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugLog:Z

    if-eqz v0, :cond_0

    .line 1045
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "GameHelper: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1047
    :cond_0
    return-void
.end method

.method public enableDebugLog(ZLjava/lang/String;)V
    .locals 2
    .param p1, "enabled"    # Z
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 465
    iput-boolean p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugLog:Z

    .line 466
    iput-object p2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugTag:Ljava/lang/String;

    .line 467
    if-eqz p1, :cond_0

    .line 468
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Debug log enabled, tag: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 470
    :cond_0
    return-void
.end method

.method getAppIdFromResource()Ljava/lang/String;
    .locals 6

    .prologue
    .line 1155
    :try_start_0
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1156
    .local v2, "res":Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 1157
    .local v1, "pkgName":Ljava/lang/String;
    const-string v4, "app_id"

    const-string v5, "string"

    invoke-virtual {v2, v4, v5, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 1158
    .local v3, "res_id":I
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 1161
    .end local v1    # "pkgName":Ljava/lang/String;
    .end local v2    # "res":Landroid/content/res/Resources;
    .end local v3    # "res_id":I
    :goto_0
    return-object v4

    .line 1159
    :catch_0
    move-exception v0

    .line 1160
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1161
    const-string v4, "??? (failed to retrieve APP ID)"

    goto :goto_0
.end method

.method public getAppStateClient()Lcom/google/android/gms/appstate/AppStateClient;
    .locals 2

    .prologue
    .line 324
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-nez v0, :cond_0

    .line 325
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No AppStateClient. Did you request it at setup?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    return-object v0
.end method

.method getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 691
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getGamesClient()Lcom/google/android/gms/games/GamesClient;
    .locals 2

    .prologue
    .line 313
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-nez v0, :cond_0

    .line 314
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No GamesClient. Did you request it at setup?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 316
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    return-object v0
.end method

.method public getInvitationId()Ljava/lang/String;
    .locals 6

    .prologue
    .line 438
    const/16 v0, 0x3e9

    const-string v1, "getInvitationId"

    .line 439
    const-string v2, "Invitation ID is only available when connected (after getting the onSignInSucceeded callback)."

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    .line 440
    const/4 v5, 0x3

    aput v5, v3, v4

    .line 438
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    move-result v0

    .line 440
    if-nez v0, :cond_0

    .line 441
    const/4 v0, 0x0

    .line 443
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mInvitationId:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPlusClient()Lcom/google/android/gms/plus/PlusClient;
    .locals 2

    .prologue
    .line 335
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-nez v0, :cond_0

    .line 336
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No PlusClient. Did you request it at setup?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 338
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    return-object v0
.end method

.method getSHA1CertFingerprint()Ljava/lang/String;
    .locals 8

    .prologue
    .line 1167
    :try_start_0
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 1168
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x40

    .line 1167
    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 1168
    iget-object v4, v5, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 1169
    .local v4, "sigs":[Landroid/content/pm/Signature;
    array-length v5, v4
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v5, :cond_0

    .line 1170
    const-string v5, "ERROR: NO SIGNATURE."

    .line 1189
    .end local v4    # "sigs":[Landroid/content/pm/Signature;
    :goto_0
    return-object v5

    .line 1171
    .restart local v4    # "sigs":[Landroid/content/pm/Signature;
    :cond_0
    :try_start_1
    array-length v5, v4
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v6, 0x1

    if-le v5, v6, :cond_1

    .line 1172
    const-string v5, "ERROR: MULTIPLE SIGNATURES"

    goto :goto_0

    .line 1174
    :cond_1
    :try_start_2
    const-string v5, "SHA1"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-virtual {v6}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 1175
    .local v0, "digest":[B
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1176
    .local v2, "hexString":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v5, v0

    if-lt v3, v5, :cond_2

    .line 1182
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1177
    :cond_2
    if-lez v3, :cond_3

    .line 1178
    const-string v5, ":"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1180
    :cond_3
    aget-byte v5, v0, v3

    invoke-virtual {p0, v2, v5}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->byteToString(Ljava/lang/StringBuilder;B)V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1176
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1184
    .end local v0    # "digest":[B
    .end local v2    # "hexString":Ljava/lang/StringBuilder;
    .end local v3    # "i":I
    .end local v4    # "sigs":[Landroid/content/pm/Signature;
    :catch_0
    move-exception v1

    .line 1185
    .local v1, "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 1186
    const-string v5, "(ERROR: package not found)"

    goto :goto_0

    .line 1187
    .end local v1    # "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v1

    .line 1188
    .local v1, "ex":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 1189
    const-string v5, "(ERROR: SHA1 algorithm not found)"

    goto :goto_0
.end method

.method public getScopes()Ljava/lang/String;
    .locals 5

    .prologue
    .line 479
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 480
    .local v1, "scopeStringBuilder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 481
    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v4, :cond_1

    .line 485
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 481
    :cond_1
    aget-object v0, v3, v2

    .line 482
    .local v0, "scope":Ljava/lang/String;
    invoke-virtual {p0, v1, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->addToScope(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 481
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public getScopesArray()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 495
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    return-object v0
.end method

.method public getSignInError()Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;
    .locals 1

    .prologue
    .line 359
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    return-object v0
.end method

.method public getTurnBasedMatch()Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;
    .locals 6

    .prologue
    .line 454
    const/16 v0, 0x3e9

    const-string v1, "getTurnBasedMatch"

    .line 455
    const-string v2, "TurnBasedMatch is only available when connected (after getting the onSignInSucceeded callback)."

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    .line 457
    const/4 v5, 0x3

    aput v5, v3, v4

    .line 454
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    move-result v0

    .line 457
    if-nez v0, :cond_0

    .line 458
    const/4 v0, 0x0

    .line 460
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mTurnBasedMatch:Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;

    goto :goto_0
.end method

.method giveUp(Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;)V
    .locals 6
    .param p1, "reason"    # Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .prologue
    const/4 v5, 0x0

    .line 964
    const/16 v0, 0x3ea

    const-string v1, "giveUp"

    const-string v2, "giveUp should only be called when connecting. Proceeding anyway."

    const/4 v3, 0x1

    new-array v3, v3, [I

    .line 965
    const/4 v4, 0x2

    aput v4, v3, v5

    .line 964
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    .line 966
    iput-boolean v5, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAutoSignIn:Z

    .line 967
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->killConnections()V

    .line 968
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 969
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->showFailureDialog()V

    .line 970
    invoke-virtual {p0, v5}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    .line 971
    return-void
.end method

.method public hasSignInError()Z
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSignedIn()Z
    .locals 2

    .prologue
    .line 343
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method killConnections()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 525
    const/16 v0, 0x3ea

    const-string v1, "killConnections"

    const-string v2, "killConnections() should only get called while connected or connecting."

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    move-result v0

    .line 526
    if-nez v0, :cond_0

    .line 549
    :goto_0
    return-void

    .line 529
    :cond_0
    const-string v0, "killConnections: killing connections."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 531
    iput-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 532
    iput-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 534
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 535
    const-string v0, "Disconnecting GamesClient."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 536
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->disconnect()V

    .line 538
    :cond_1
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 539
    const-string v0, "Disconnecting PlusClient."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 540
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->disconnect()V

    .line 542
    :cond_2
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 543
    const-string v0, "Disconnecting AppStateClient."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 544
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v0}, Lcom/google/android/gms/appstate/AppStateClient;->disconnect()V

    .line 546
    :cond_3
    const/4 v0, 0x0

    iput v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 547
    const-string v0, "killConnections: all clients disconnected."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 548
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    goto :goto_0

    .line 525
    :array_0
    .array-data 4
        0x3
        0x2
    .end array-data
.end method

.method logError(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1054
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "*** GameHelper ERROR: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1055
    return-void
.end method

.method logWarn(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1050
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mDebugTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "!!! GameHelper WARNING: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1051
    return-void
.end method

.method makeSimpleDialog(Ljava/lang/String;)Landroid/app/Dialog;
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1039
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1040
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1039
    return-object v0
.end method

.method notifyListener(Z)V
    .locals 2
    .param p1, "success"    # Z

    .prologue
    .line 622
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "Notifying LISTENER of sign-in "

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    const-string v0, "SUCCESS"

    .line 623
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 622
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 624
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mListener:Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

    if-eqz v0, :cond_0

    .line 625
    if-eqz p1, :cond_3

    .line 626
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mListener:Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

    invoke-interface {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;->onSignInSucceeded()V

    .line 631
    :cond_0
    :goto_1
    return-void

    .line 623
    :cond_1
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    if-eqz v0, :cond_2

    const-string v0, "FAILURE (error)"

    goto :goto_0

    :cond_2
    const-string v0, "FAILURE (no error)"

    goto :goto_0

    .line 628
    :cond_3
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mListener:Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

    invoke-interface {v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;->onSignInFailed()V

    goto :goto_1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "responseCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v3, 0x2329

    const/4 v2, 0x0

    .line 578
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "onActivityResult: req="

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-ne p1, v3, :cond_0

    const-string v0, "RC_RESOLVE"

    .line 579
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", resp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 580
    invoke-static {p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->activityResponseCodeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 578
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 581
    if-eq p1, v3, :cond_1

    .line 582
    const-string v0, "onActivityResult: request code not meant for us. Ignoring."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 619
    :goto_1
    return-void

    .line 579
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 587
    :cond_1
    iput-boolean v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mExpectingResolution:Z

    .line 589
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    .line 590
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onActivityResult: ignoring because state isn\'t STATE_CONNECTING (it\'s "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 591
    sget-object v1, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 590
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    goto :goto_1

    .line 597
    :cond_2
    const/4 v0, -0x1

    if-ne p2, v0, :cond_3

    .line 599
    const-string v0, "onAR: Resolution was RESULT_OK, so connecting current client again."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 600
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->connectCurrentClient()V

    goto :goto_1

    .line 601
    :cond_3
    const/16 v0, 0x2711

    if-ne p2, v0, :cond_4

    .line 602
    const-string v0, "onAR: Resolution was RECONNECT_REQUIRED, so reconnecting."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 603
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->connectCurrentClient()V

    goto :goto_1

    .line 604
    :cond_4
    if-nez p2, :cond_5

    .line 606
    const-string v0, "onAR: Got a cancellation result, so disconnecting."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 607
    iput-boolean v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAutoSignIn:Z

    .line 608
    iput-boolean v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mUserInitiatedSignIn:Z

    .line 609
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 610
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->killConnections()V

    .line 611
    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    goto :goto_1

    .line 615
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onAR: responseCode="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->activityResponseCodeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 616
    const-string v1, ", so giving up."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 615
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 617
    new-instance v0, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v1

    invoke-direct {v0, v1, p2}, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->giveUp(Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;)V

    goto/16 :goto_1
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    .line 833
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mTurnBasedMatch:Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;

    .line 835
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onConnected: connected! client="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 838
    iget v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    or-int/2addr v2, v3

    iput v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 839
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Connected clients updated to: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 843
    iget v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mClientCurrentlyConnecting:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 844
    if-eqz p1, :cond_1

    .line 845
    const-string v2, "onConnected: connection hint provided. Checking for invite."

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 847
    const-string v2, "invitation"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/games/multiplayer/Invitation;

    .line 848
    .local v0, "inv":Lcom/google/android/gms/games/multiplayer/Invitation;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/Invitation;->getInvitationId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 850
    const-string v2, "onConnected: connection hint has a room invite!"

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 851
    invoke-interface {v0}, Lcom/google/android/gms/games/multiplayer/Invitation;->getInvitationId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mInvitationId:Ljava/lang/String;

    .line 852
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invitation ID: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mInvitationId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 855
    :cond_0
    const-string v2, "onConnected: connection hint provided. Checking for TBMP game."

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 858
    const-string v2, "turn_based_match"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;

    .line 860
    .local v1, "match":Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;
    if-eqz v1, :cond_1

    .line 861
    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mTurnBasedMatch:Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;

    .line 867
    .end local v0    # "inv":Lcom/google/android/gms/games/multiplayer/Invitation;
    .end local v1    # "match":Lcom/google/android/gms/games/multiplayer/turnbased/TurnBasedMatch;
    :cond_1
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->connectNextClient()V

    .line 868
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    .line 886
    const-string v0, "onConnectionFailed"

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 888
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 889
    const-string v0, "Connection failure:"

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 890
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "   - code: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v1

    invoke-static {v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->errorCodeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 891
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "   - resolvable: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 892
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "   - details: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 894
    iget-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mUserInitiatedSignIn:Z

    if-nez v0, :cond_0

    .line 901
    const-string v0, "onConnectionFailed: since user didn\'t initiate sign-in, failing now."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 902
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    .line 903
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    .line 904
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    .line 914
    :goto_0
    return-void

    .line 908
    :cond_0
    const-string v0, "onConnectionFailed: since user initiated sign-in, resolving problem."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 913
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->resolveConnectionResult()V

    goto :goto_0
.end method

.method public onDisconnected()V
    .locals 2

    .prologue
    .line 976
    const-string v0, "onDisconnected."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 977
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 979
    const-string v0, "onDisconnected is expected, so no action taken."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 993
    :goto_0
    return-void

    .line 984
    :cond_0
    const-string v0, "Unexpectedly disconnected. Severing remaining connections."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 987
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->killConnections()V

    .line 988
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 991
    const-string v0, "Making extraordinary call to onSignInFailed callback"

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 992
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    goto :goto_0
.end method

.method public onStart(Landroid/app/Activity;)V
    .locals 4
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 364
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    .line 366
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onStart, state = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 367
    const-string v1, "onStart"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->assertConfigured(Ljava/lang/String;)V

    .line 369
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    packed-switch v1, :pswitch_data_0

    .line 388
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onStart: BUG: unexpected state "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 389
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logError(Ljava/lang/String;)V

    .line 390
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 372
    .end local v0    # "msg":Ljava/lang/String;
    :pswitch_0
    iget-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAutoSignIn:Z

    if-eqz v1, :cond_0

    .line 373
    const-string v1, "onStart: Now connecting clients."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 374
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->startConnections()V

    .line 392
    :goto_0
    return-void

    .line 376
    :cond_0
    const-string v1, "onStart: Not connecting (user specifically signed out)."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    goto :goto_0

    .line 381
    :pswitch_1
    const-string v1, "onStart: connection process in progress, no action taken."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    goto :goto_0

    .line 385
    :pswitch_2
    const-string v1, "onStart: already connected (unusual, but ok)."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    goto :goto_0

    .line 369
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onStop()V
    .locals 4

    .prologue
    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onStop, state = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 397
    const-string v1, "onStop"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->assertConfigured(Ljava/lang/String;)V

    .line 398
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    packed-switch v1, :pswitch_data_0

    .line 409
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onStop: BUG: unexpected state "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 410
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logError(Ljava/lang/String;)V

    .line 411
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 402
    .end local v0    # "msg":Ljava/lang/String;
    :pswitch_0
    const-string v1, "onStop: Killing connections"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 403
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->killConnections()V

    .line 415
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    .line 416
    return-void

    .line 406
    :pswitch_1
    const-string v1, "onStop: not connected, so no action taken."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    goto :goto_0

    .line 398
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method printMisconfiguredDebugInfo()V
    .locals 3

    .prologue
    .line 1122
    const-string v1, "****"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1123
    const-string v1, "****"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1124
    const-string v1, "**** APP NOT CORRECTLY CONFIGURED TO USE GOOGLE PLAY GAME SERVICES"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1125
    const-string v1, "**** This is usually caused by one of these reasons:"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1126
    const-string v1, "**** (1) Your package name and certificate fingerprint do not match"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1127
    const-string v1, "****     the client ID you registered in Developer Console."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1128
    const-string v1, "**** (2) Your App ID was incorrectly entered."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1129
    const-string v1, "**** (3) Your game settings have not been published and you are "

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1130
    const-string v1, "****     trying to log in with an account that is not listed as"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1131
    const-string v1, "****     a test account."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1132
    const-string v1, "****"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1133
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1134
    .local v0, "ctx":Landroid/content/Context;
    if-nez v0, :cond_0

    .line 1135
    const-string v1, "*** (no Context, so can\'t print more debug info)"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1151
    :goto_0
    return-void

    .line 1139
    :cond_0
    const-string v1, "**** To help you debug, here is the information about this app"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1140
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "**** Package name         : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1141
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "**** Cert SHA1 fingerprint: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getSHA1CertFingerprint()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1142
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "**** App ID from          : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getAppIdFromResource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1143
    const-string v1, "****"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1144
    const-string v1, "**** Check that the above information matches your setup in "

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1145
    const-string v1, "**** Developer Console. Also, check that you\'re logging in with the"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1146
    const-string v1, "**** right account (it should be listed in the Testers section if"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1147
    const-string v1, "**** your project is not yet published)."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1148
    const-string v1, "****"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1149
    const-string v1, "**** For more information, refer to the troubleshooting guide:"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1150
    const-string v1, "****   http://developers.google.com/games/services/android/troubleshooting"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public reconnectClients(I)V
    .locals 8
    .param p1, "whatClients"    # I

    .prologue
    const/4 v7, 0x1

    .line 793
    const/16 v1, 0x3e9

    const-string v2, "reconnectClients"

    const-string v3, "reconnectClients should only be called when connected. Proceeding anyway."

    new-array v4, v7, [I

    const/4 v5, 0x0

    .line 794
    const/4 v6, 0x3

    aput v6, v4, v5

    .line 793
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    .line 795
    const/4 v0, 0x0

    .line 797
    .local v0, "actuallyReconnecting":Z
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v1, :cond_0

    .line 798
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v1}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 799
    const-string v1, "Reconnecting GamesClient."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 800
    const/4 v0, 0x1

    .line 801
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    and-int/lit8 v1, v1, -0x2

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 802
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v1}, Lcom/google/android/gms/games/GamesClient;->reconnect()V

    .line 804
    :cond_0
    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    if-eqz v1, :cond_1

    .line 805
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v1}, Lcom/google/android/gms/appstate/AppStateClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 806
    const-string v1, "Reconnecting AppStateClient."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 807
    const/4 v0, 0x1

    .line 808
    iget v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    and-int/lit8 v1, v1, -0x5

    iput v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectedClients:I

    .line 809
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    invoke-virtual {v1}, Lcom/google/android/gms/appstate/AppStateClient;->reconnect()V

    .line 811
    :cond_1
    and-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v1, :cond_2

    .line 812
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v1}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 814
    const-string v1, "GameHelper is ignoring your request to reconnect PlusClient because this is unnecessary."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logWarn(Ljava/lang/String;)V

    .line 818
    :cond_2
    if-eqz v0, :cond_3

    .line 819
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    .line 826
    :goto_0
    return-void

    .line 823
    :cond_3
    const-string v1, "No reconnections needed, so behaving as if sign in just succeeded"

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 824
    invoke-virtual {p0, v7}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    goto :goto_0
.end method

.method resolveConnectionResult()V
    .locals 7

    .prologue
    const/4 v4, 0x1

    .line 923
    .line 924
    const/16 v1, 0x3ea

    .line 925
    const-string v2, "resolveConnectionResult"

    .line 926
    const-string v3, "resolveConnectionResult should only be called when connecting. Proceeding anyway."

    new-array v4, v4, [I

    const/4 v5, 0x0

    .line 927
    const/4 v6, 0x2

    aput v6, v4, v5

    .line 923
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    .line 929
    iget-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mExpectingResolution:Z

    if-eqz v1, :cond_0

    .line 930
    const-string v1, "We\'re already expecting the result of a previous resolution."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 954
    :goto_0
    return-void

    .line 934
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "resolveConnectionResult: trying to resolve result: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 935
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 937
    const-string v1, "Result has resolution. Starting it."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 941
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mExpectingResolution:Z

    .line 942
    iget-object v1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    const/16 v3, 0x2329

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 943
    :catch_0
    move-exception v0

    .line 945
    .local v0, "e":Landroid/content/IntentSender$SendIntentException;
    const-string v1, "SendIntentException, so connecting again."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 946
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->connectCurrentClient()V

    goto :goto_0

    .line 951
    .end local v0    # "e":Landroid/content/IntentSender$SendIntentException;
    :cond_1
    const-string v1, "resolveConnectionResult: result has no resolution. Giving up."

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 952
    new-instance v1, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    iget-object v2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mConnectionResult:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v2}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->giveUp(Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;)V

    goto :goto_0
.end method

.method setState(I)V
    .locals 4
    .param p1, "newState"    # I

    .prologue
    .line 302
    sget-object v2, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    iget v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    aget-object v1, v2, v3

    .line 303
    .local v1, "oldStateName":Ljava/lang/String;
    sget-object v2, Lcom/cobra/zufflin/GooglePlay/GameHelper;->STATE_NAMES:[Ljava/lang/String;

    aget-object v0, v2, p1

    .line 304
    .local v0, "newStateName":Ljava/lang/String;
    iput p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    .line 305
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "State change "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 306
    return-void
.end method

.method public setup(Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

    .prologue
    .line 218
    const/4 v0, 0x1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {p0, p1, v0, v1}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setup(Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;I[Ljava/lang/String;)V

    .line 219
    return-void
.end method

.method public varargs setup(Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;I[Ljava/lang/String;)V
    .locals 9
    .param p1, "listener"    # Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;
    .param p2, "clientsToUse"    # I
    .param p3, "additionalScopes"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 237
    iget v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    if-eqz v4, :cond_0

    .line 238
    const-string v0, "GameHelper: you called GameHelper.setup() twice. You can only call it once."

    .line 240
    .local v0, "error":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->logError(Ljava/lang/String;)V

    .line 241
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 243
    .end local v0    # "error":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mListener:Lcom/cobra/zufflin/GooglePlay/GameHelper$GameHelperListener;

    .line 244
    iput p2, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mRequestedClients:I

    .line 246
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Setup: requested clients: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mRequestedClients:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 248
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 249
    .local v2, "scopesVector":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    and-int/lit8 v4, p2, 0x1

    if-eqz v4, :cond_1

    .line 250
    const-string v4, "https://www.googleapis.com/auth/games"

    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 252
    :cond_1
    and-int/lit8 v4, p2, 0x2

    if-eqz v4, :cond_2

    .line 253
    const-string v4, "https://www.googleapis.com/auth/plus.login"

    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 255
    :cond_2
    and-int/lit8 v4, p2, 0x4

    if-eqz v4, :cond_3

    .line 256
    const-string v4, "https://www.googleapis.com/auth/appstate"

    invoke-virtual {v2, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 259
    :cond_3
    if-eqz p3, :cond_4

    .line 260
    array-length v5, p3

    move v4, v3

    :goto_0
    if-lt v4, v5, :cond_8

    .line 265
    :cond_4
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    .line 266
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 268
    const-string v4, "setup: scopes:"

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 269
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    array-length v5, v4

    :goto_1
    if-lt v3, v5, :cond_9

    .line 273
    and-int/lit8 v3, p2, 0x1

    if-eqz v3, :cond_5

    .line 274
    const-string v3, "setup: creating GamesClient"

    invoke-virtual {p0, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 277
    new-instance v3, Lcom/google/android/gms/games/GamesClient$Builder;

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, p0, p0}, Lcom/google/android/gms/games/GamesClient$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    .line 278
    const/16 v4, 0x31

    invoke-virtual {v3, v4}, Lcom/google/android/gms/games/GamesClient$Builder;->setGravityForPopups(I)Lcom/google/android/gms/games/GamesClient$Builder;

    move-result-object v3

    .line 279
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/games/GamesClient$Builder;->setScopes([Ljava/lang/String;)Lcom/google/android/gms/games/GamesClient$Builder;

    move-result-object v3

    .line 280
    invoke-virtual {v3, v8}, Lcom/google/android/gms/games/GamesClient$Builder;->setShowConnectingPopup(Z)Lcom/google/android/gms/games/GamesClient$Builder;

    move-result-object v3

    .line 281
    invoke-virtual {v3}, Lcom/google/android/gms/games/GamesClient$Builder;->create()Lcom/google/android/gms/games/GamesClient;

    move-result-object v3

    .line 277
    iput-object v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    .line 285
    :cond_5
    and-int/lit8 v3, p2, 0x2

    if-eqz v3, :cond_6

    .line 286
    const-string v3, "setup: creating GamesPlusClient"

    invoke-virtual {p0, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 287
    new-instance v3, Lcom/google/android/gms/plus/PlusClient$Builder;

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, p0, p0}, Lcom/google/android/gms/plus/PlusClient$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    .line 288
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/plus/PlusClient$Builder;->setScopes([Ljava/lang/String;)Lcom/google/android/gms/plus/PlusClient$Builder;

    move-result-object v3

    .line 289
    invoke-virtual {v3}, Lcom/google/android/gms/plus/PlusClient$Builder;->build()Lcom/google/android/gms/plus/PlusClient;

    move-result-object v3

    .line 287
    iput-object v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    .line 292
    :cond_6
    and-int/lit8 v3, p2, 0x4

    if-eqz v3, :cond_7

    .line 293
    const-string v3, "setup: creating AppStateClient"

    invoke-virtual {p0, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 294
    new-instance v3, Lcom/google/android/gms/appstate/AppStateClient$Builder;

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, p0, p0}, Lcom/google/android/gms/appstate/AppStateClient$Builder;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/GooglePlayServicesClient$ConnectionCallbacks;Lcom/google/android/gms/common/GooglePlayServicesClient$OnConnectionFailedListener;)V

    .line 295
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mScopes:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/appstate/AppStateClient$Builder;->setScopes([Ljava/lang/String;)Lcom/google/android/gms/appstate/AppStateClient$Builder;

    move-result-object v3

    .line 296
    invoke-virtual {v3}, Lcom/google/android/gms/appstate/AppStateClient$Builder;->create()Lcom/google/android/gms/appstate/AppStateClient;

    move-result-object v3

    .line 294
    iput-object v3, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAppStateClient:Lcom/google/android/gms/appstate/AppStateClient;

    .line 298
    :cond_7
    invoke-virtual {p0, v8}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    .line 299
    return-void

    .line 260
    :cond_8
    aget-object v1, p3, v4

    .line 261
    .local v1, "scope":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 260
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 269
    .end local v1    # "scope":Ljava/lang/String;
    :cond_9
    aget-object v1, v4, v3

    .line 270
    .restart local v1    # "scope":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "  - "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 269
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1
.end method

.method public showAlert(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 426
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 427
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 428
    return-void
.end method

.method public showAlert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 420
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 421
    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 422
    return-void
.end method

.method showFailureDialog()V
    .locals 7

    .prologue
    .line 997
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 998
    .local v1, "ctx":Landroid/content/Context;
    if-nez v1, :cond_0

    .line 999
    const-string v4, "*** No context. Can\'t show failure dialog."

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1036
    :goto_0
    return-void

    .line 1002
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Making error dialog for failure: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1003
    const/4 v3, 0x0

    .line 1004
    .local v3, "errorDialog":Landroid/app/Dialog;
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    invoke-virtual {v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;->getServiceErrorCode()I

    move-result v2

    .line 1005
    .local v2, "errorCode":I
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    invoke-virtual {v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;->getActivityResultCode()I

    move-result v0

    .line 1007
    .local v0, "actResp":I
    packed-switch v0, :pswitch_data_0

    .line 1024
    iget-object v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mActivity:Landroid/app/Activity;

    .line 1025
    const/16 v5, 0x232a

    const/4 v6, 0x0

    .line 1024
    invoke-static {v2, v4, v5, v6}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorDialog(ILandroid/app/Activity;ILandroid/content/DialogInterface$OnCancelListener;)Landroid/app/Dialog;

    move-result-object v3

    .line 1026
    if-nez v3, :cond_1

    .line 1028
    const-string v4, "No standard error dialog available. Making fallback dialog."

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1029
    new-instance v4, Ljava/lang/StringBuilder;

    sget v5, Lcom/cobra/zufflin/R$string;->gamehelper_unknown_error:I

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1030
    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->errorCodeToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1029
    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->makeSimpleDialog(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v3

    .line 1034
    :cond_1
    :goto_1
    const-string v4, "Showing error dialog."

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 1035
    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 1010
    :pswitch_0
    sget v4, Lcom/cobra/zufflin/R$string;->gamehelper_app_misconfigured:I

    .line 1009
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->makeSimpleDialog(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v3

    .line 1011
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->printMisconfiguredDebugInfo()V

    goto :goto_1

    .line 1015
    :pswitch_1
    sget v4, Lcom/cobra/zufflin/R$string;->gamehelper_sign_in_failed:I

    .line 1014
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->makeSimpleDialog(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v3

    .line 1016
    goto :goto_1

    .line 1019
    :pswitch_2
    sget v4, Lcom/cobra/zufflin/R$string;->gamehelper_license_failed:I

    .line 1018
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->makeSimpleDialog(Ljava/lang/String;)Landroid/app/Dialog;

    move-result-object v3

    .line 1020
    goto :goto_1

    .line 1007
    :pswitch_data_0
    .packed-switch 0x2712
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public signOut()V
    .locals 2

    .prologue
    .line 500
    iget v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 502
    const-string v0, "signOut: state was already DISCONNECTED, ignoring."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 522
    :goto_0
    return-void

    .line 508
    :cond_0
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 509
    const-string v0, "Clearing default account on PlusClient."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 510
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mPlusClient:Lcom/google/android/gms/plus/PlusClient;

    invoke-virtual {v0}, Lcom/google/android/gms/plus/PlusClient;->clearDefaultAccount()V

    .line 514
    :cond_1
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 515
    const-string v0, "Signing out from GamesClient."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 516
    iget-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mGamesClient:Lcom/google/android/gms/games/GamesClient;

    invoke-virtual {v0}, Lcom/google/android/gms/games/GamesClient;->signOut()V

    .line 520
    :cond_2
    const-string v0, "Proceeding with disconnection."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 521
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->killConnections()V

    goto :goto_0
.end method

.method startConnections()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 704
    const/16 v0, 0x3ea

    const-string v1, "startConnections"

    const-string v2, "startConnections should only get called when disconnected."

    new-array v3, v5, [I

    const/4 v4, 0x0

    .line 705
    aput v5, v3, v4

    .line 704
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    move-result v0

    .line 705
    if-nez v0, :cond_0

    .line 712
    :goto_0
    return-void

    .line 708
    :cond_0
    const-string v0, "Starting connections."

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 709
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    .line 710
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mInvitationId:Ljava/lang/String;

    .line 711
    invoke-virtual {p0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->connectNextClient()V

    goto :goto_0
.end method

.method succeedSignIn()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 871
    const/16 v0, 0x3ea

    const-string v1, "succeedSignIn"

    const-string v2, "succeedSignIn should only get called in the connecting or connected state. Proceeding anyway."

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->checkState(ILjava/lang/String;Ljava/lang/String;[I)Z

    .line 874
    const-string v0, "All requested clients connected. Sign-in succeeded!"

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->debugLog(Ljava/lang/String;)V

    .line 875
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->setState(I)V

    .line 876
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mSignInFailureReason:Lcom/cobra/zufflin/GooglePlay/GameHelper$SignInFailureReason;

    .line 877
    iput-boolean v4, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mAutoSignIn:Z

    .line 878
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cobra/zufflin/GooglePlay/GameHelper;->mUserInitiatedSignIn:Z

    .line 879
    invoke-virtual {p0, v4}, Lcom/cobra/zufflin/GooglePlay/GameHelper;->notifyListener(Z)V

    .line 880
    return-void

    .line 871
    nop

    :array_0
    .array-data 4
        0x2
        0x3
    .end array-data
.end method
