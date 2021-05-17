.class public Lcom/amazon/ags/jni/player/ProfilesNativeHandler;
.super Ljava/lang/Object;
.source "ProfilesNativeHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->TAG:Ljava/lang/String;

    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLocalPlayer(IJ)V
    .locals 2
    .param p0, "developerTag"    # I
    .param p1, "callbackPointer"    # J

    .prologue
    .line 41
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    if-nez v0, :cond_0

    .line 42
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->TAG:Ljava/lang/String;

    const-string v1, "requestLocalPlayerProfile - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/player/PlayerClient;->getLocalPlayer([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;

    invoke-direct {v1, p0, p1, p2}, Lcom/amazon/ags/jni/player/RequestLocalPlayerProfileJniResponseHandler;-><init>(IJ)V

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    goto :goto_0
.end method

.method public static getLocalPlayerHandle(I)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p0, "developerTag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/player/RequestPlayerResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    if-nez v0, :cond_0

    .line 52
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->TAG:Ljava/lang/String;

    const-string v1, "requestLocalPlayerProfileHandle - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/4 v0, 0x0

    .line 56
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/player/PlayerClient;->getLocalPlayer([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method

.method public static initializeNativeHandler(Lcom/amazon/ags/api/AmazonGamesClient;)V
    .locals 1
    .param p0, "amazonGamesClient"    # Lcom/amazon/ags/api/AmazonGamesClient;

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/amazon/ags/api/AmazonGamesClient;->getPlayerClient()Lcom/amazon/ags/api/player/PlayerClient;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    .line 38
    return-void
.end method

.method public static isSignedIn(I)Z
    .locals 2
    .param p0, "developerTag"    # I

    .prologue
    .line 61
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    if-nez v0, :cond_0

    .line 62
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->TAG:Ljava/lang/String;

    const-string v1, "isSignedIn - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const/4 v0, 0x0

    .line 66
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/player/ProfilesNativeHandler;->m_PlayerClient:Lcom/amazon/ags/api/player/PlayerClient;

    invoke-interface {v0}, Lcom/amazon/ags/api/player/PlayerClient;->isSignedIn()Z

    move-result v0

    goto :goto_0
.end method
