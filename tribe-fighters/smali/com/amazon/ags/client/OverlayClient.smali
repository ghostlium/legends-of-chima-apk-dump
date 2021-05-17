.class public Lcom/amazon/ags/client/OverlayClient;
.super Lcom/amazon/ags/client/ClientBase;
.source "OverlayClient.java"


# direct methods
.method public constructor <init>(Lcom/amazon/ags/html5/service/ServiceHelper;)V
    .locals 0
    .param p1, "serviceHelper"    # Lcom/amazon/ags/html5/service/ServiceHelper;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/ClientBase;-><init>(Lcom/amazon/ags/html5/service/ServiceHelper;)V

    .line 30
    return-void
.end method

.method private showOverlayPage(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
    .locals 1
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "pageCode"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/amazon/ags/client/OverlayClient;->showOverlayPage(Ljava/lang/String;Ljava/lang/Object;Ljava/util/Map;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;

    move-result-object v0

    return-object v0
.end method

.method private showOverlayPage(Ljava/lang/String;Ljava/lang/Object;Ljava/util/Map;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;
    .locals 1
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "pageCode"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "requestParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    new-instance v0, Lcom/amazon/ags/client/OverlayClient$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/amazon/ags/client/OverlayClient$1;-><init>(Lcom/amazon/ags/client/OverlayClient;Ljava/lang/String;Ljava/lang/Object;Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public varargs showAchievementsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 2
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    const-string v0, "Show Achievements Overlay"

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/amazon/ags/client/OverlayClient;->showOverlayPage(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    return-object v0
.end method

.method public varargs showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 2
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    const-string v0, "Show Game Circle"

    const-string v1, "SHOW_GAME_CIRCLE"

    invoke-direct {p0, v0, v1}, Lcom/amazon/ags/client/OverlayClient;->showOverlayPage(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    return-object v0
.end method

.method public varargs showLeaderboardOverlay(Ljava/lang/String;[Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 3
    .param p1, "leaderboardId"    # Ljava/lang/String;
    .param p2, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 81
    .local v0, "requestParameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    const-string v1, "LEADERBOARD_ID"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    const-string v1, "Show Leaderboard Overlay"

    const/16 v2, 0x1c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {p0, v1, v2, v0}, Lcom/amazon/ags/client/OverlayClient;->showOverlayPage(Ljava/lang/String;Ljava/lang/Object;Ljava/util/Map;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v1

    return-object v1
.end method

.method public varargs showLeaderboardsOverlay([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 2
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    const-string v0, "Show Leaderboards Overlay"

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/amazon/ags/client/OverlayClient;->showOverlayPage(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    return-object v0
.end method

.method public varargs showSignInPage([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;
    .locals 2
    .param p1, "userData"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Lcom/amazon/ags/api/AGResponseHandle",
            "<",
            "Lcom/amazon/ags/api/RequestResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    const-string v0, "Show Sign In Overlay"

    const-string v1, "SHOW_SIGN_IN_PAGE"

    invoke-direct {p0, v0, v1}, Lcom/amazon/ags/client/OverlayClient;->showOverlayPage(Ljava/lang/String;Ljava/lang/Object;)Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/amazon/ags/client/ClientBase$AsyncTaskWrapper;->execute([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    move-result-object v0

    return-object v0
.end method
