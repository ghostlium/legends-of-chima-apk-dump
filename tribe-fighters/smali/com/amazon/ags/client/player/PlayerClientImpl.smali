.class public Lcom/amazon/ags/client/player/PlayerClientImpl;
.super Lcom/amazon/ags/client/ClientBase;
.source "PlayerClientImpl.java"

# interfaces
.implements Lcom/amazon/ags/api/player/PlayerClient;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static globalStateListener:Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;


# instance fields
.field private final globalState:Lcom/amazon/ags/html5/util/GlobalState;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/client/player/PlayerClientImpl;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/client/player/PlayerClientImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/service/ServiceHelper;Lcom/amazon/ags/html5/util/GlobalState;)V
    .locals 0
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;
    .param p2, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/ClientBase;-><init>(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 42
    iput-object p2, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/amazon/ags/html5/util/GlobalState;)V
    .locals 0
    .param p1, "globalState"    # Lcom/amazon/ags/html5/util/GlobalState;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/amazon/ags/client/ClientBase;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    .line 38
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/amazon/ags/client/player/PlayerClientImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public varargs getLocalPlayer([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 4
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/player/RequestPlayerResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/amazon/ags/client/player/PlayerClientImpl;->isClientReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 52
    new-instance v0, Lcom/amazon/ags/client/AGResponseHandleImpl;

    invoke-direct {v0, p1}, Lcom/amazon/ags/client/AGResponseHandleImpl;-><init>([Ljava/lang/Object;)V

    .line 53
    .local v0, "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/player/RequestPlayerResponse;>;"
    new-instance v1, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;

    const/16 v2, 0x1d

    sget-object v3, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    invoke-direct {v1, v2, v3}, Lcom/amazon/ags/client/player/RequestPlayerResponseImpl;-><init>(ILcom/amazon/ags/api/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/amazon/ags/client/AGResponseHandleImpl;->setResponse(Lcom/amazon/ags/api/RequestResponse;)V

    .line 54
    sget-object v1, Lcom/amazon/ags/client/player/PlayerClientImpl;->TAG:Ljava/lang/String;

    const-string v2, "getLocalPlayer called before AmazonGamesClient initialized; returning empty response"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .end local v0    # "emptyHandle":Lcom/amazon/ags/client/AGResponseHandleImpl;, "Lcom/amazon/ags/client/AGResponseHandleImpl<Lcom/amazon/ags/api/player/RequestPlayerResponse;>;"
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/amazon/ags/client/player/PlayerClientImpl$1;

    const-string v2, "Get Local Player"

    invoke-direct {v1, p0, v2}, Lcom/amazon/ags/client/player/PlayerClientImpl$1;-><init>(Lcom/amazon/ags/client/player/PlayerClientImpl;Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Lcom/amazon/ags/client/player/PlayerClientImpl$1;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    goto :goto_0
.end method

.method public isSignedIn()Z
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v0}, Lcom/amazon/ags/html5/util/GlobalState;->isGuestMode()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setSignedInListener(Lcom/amazon/ags/api/player/AGSignedInListener;)V
    .locals 4
    .param p1, "listener"    # Lcom/amazon/ags/api/player/AGSignedInListener;

    .prologue
    .line 87
    sget-object v1, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalStateListener:Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    if-eqz v1, :cond_0

    .line 89
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    sget-object v2, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalStateListener:Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/html5/util/GlobalState;->removeListener(Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :cond_0
    :goto_0
    new-instance v1, Lcom/amazon/ags/client/player/PlayerClientImpl$2;

    invoke-direct {v1, p0, p1}, Lcom/amazon/ags/client/player/PlayerClientImpl$2;-><init>(Lcom/amazon/ags/client/player/PlayerClientImpl;Lcom/amazon/ags/api/player/AGSignedInListener;)V

    sput-object v1, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalStateListener:Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    .line 118
    iget-object v1, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    sget-object v2, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalStateListener:Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    invoke-virtual {v1, v2}, Lcom/amazon/ags/html5/util/GlobalState;->addListener(Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;)V

    .line 119
    sget-object v2, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalStateListener:Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    iget-object v1, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->globalState:Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v1}, Lcom/amazon/ags/html5/util/GlobalState;->isGuestMode()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-interface {v2, v1}, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;->notifyIsGuestModeSet(Z)V

    .line 120
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "throwable":Ljava/lang/Throwable;
    sget-object v1, Lcom/amazon/ags/client/player/PlayerClientImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not remove global state listener: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 119
    .end local v0    # "throwable":Ljava/lang/Throwable;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/amazon/ags/client/player/PlayerClientImpl;->isReady:Z

    .line 47
    return-void
.end method
