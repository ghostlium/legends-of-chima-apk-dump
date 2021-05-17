.class public Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;
.super Ljava/lang/Object;
.source "GameCircleNativeHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GameCircleNativeHandler"

.field private static amazonGames:Lcom/amazon/ags/api/AmazonGames;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static initializeNativeHandler(Lcom/amazon/ags/api/AmazonGames;)V
    .locals 0
    .param p0, "amazonGamesClient"    # Lcom/amazon/ags/api/AmazonGames;

    .prologue
    .line 23
    sput-object p0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    .line 24
    return-void
.end method

.method public static showGameCircle(IJ)V
    .locals 4
    .param p0, "developerTag"    # I
    .param p1, "callbackPointer"    # J

    .prologue
    .line 27
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    if-nez v0, :cond_0

    .line 28
    const-string v0, "GameCircleNativeHandler"

    const-string v1, "showGameCircle - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    :goto_0
    return-void

    .line 31
    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGames;->showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/jni/gamecircle/ShowGameCircleJniRespHandler;

    invoke-direct {v1, p0, p1, p2}, Lcom/amazon/ags/jni/gamecircle/ShowGameCircleJniRespHandler;-><init>(IJ)V

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    goto :goto_0
.end method

.method public static showGameCircleHandle(I)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p0, "developerTag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    if-nez v0, :cond_0

    .line 36
    const-string v0, "GameCircleNativeHandler"

    const-string v1, "showGameCircle - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    const/4 v0, 0x0

    .line 39
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGames;->showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method

.method public static showSignInPage(IJ)V
    .locals 4
    .param p0, "developerTag"    # I
    .param p1, "callbackPointer"    # J

    .prologue
    .line 43
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    if-nez v0, :cond_0

    .line 44
    const-string v0, "GameCircleNativeHandler"

    const-string v1, "showSignInPage - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :goto_0
    return-void

    .line 47
    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGames;->showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    new-instance v1, Lcom/amazon/ags/jni/gamecircle/ShowGameCircleJniRespHandler;

    invoke-direct {v1, p0, p1, p2}, Lcom/amazon/ags/jni/gamecircle/ShowGameCircleJniRespHandler;-><init>(IJ)V

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AGResponseHandle;->setCallback(Lcom/amazon/ags/api/AGResponseCallback;)V

    goto :goto_0
.end method

.method public static showSignInPageHandle(I)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p0, "developerTag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    if-nez v0, :cond_0

    .line 52
    const-string v0, "GameCircleNativeHandler"

    const-string v1, "showSignInPage - initializeJni was not called beforehand."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/4 v0, 0x0

    .line 55
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/amazon/ags/jni/gamecircle/GameCircleNativeHandler;->amazonGames:Lcom/amazon/ags/api/AmazonGames;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGames;->showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method
