.class public Lcom/amazon/ags/html5/util/GlobalState;
.super Ljava/lang/Object;
.source "GlobalState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final globalState:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-class v0, Lcom/amazon/ags/html5/util/GlobalState;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->TAG:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    .line 27
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->listeners:Ljava/util/Set;

    .line 90
    return-void
.end method


# virtual methods
.method public addListener(Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 31
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getCountrySupport()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    const-string v1, "countrySupport"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPlayerId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    const-string v1, "playerId"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public isGuestMode()Z
    .locals 3

    .prologue
    .line 38
    iget-object v1, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    const-string v2, "guestMode"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 40
    .local v0, "guestMode":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isHidden()Ljava/lang/Boolean;
    .locals 3

    .prologue
    .line 48
    iget-object v1, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    const-string v2, "hidden"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 51
    .local v0, "hiddenFlag":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 59
    iget-object v3, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    iget-object v3, p0, Lcom/amazon/ags/html5/util/GlobalState;->listeners:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    .line 61
    .local v1, "listener":Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    invoke-interface {v1, p1, p2}, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;->notifyStateSet(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 63
    .end local v1    # "listener":Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    :cond_0
    const-string v3, "playerId"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 64
    iget-object v3, p0, Lcom/amazon/ags/html5/util/GlobalState;->listeners:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    .line 65
    .restart local v1    # "listener":Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    invoke-interface {v1, p2}, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;->notifyPlayerIdSet(Ljava/lang/String;)V

    goto :goto_1

    .line 68
    .end local v1    # "listener":Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    :cond_1
    const-string v3, "guestMode"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 69
    iget-object v3, p0, Lcom/amazon/ags/html5/util/GlobalState;->listeners:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    .line 71
    .restart local v1    # "listener":Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    :try_start_0
    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-interface {v1, v3}, Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;->notifyIsGuestModeSet(Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 72
    :catch_0
    move-exception v2

    .line 73
    .local v2, "t":Ljava/lang/Throwable;
    iget-object v3, p0, Lcom/amazon/ags/html5/util/GlobalState;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not notify guest mode state change: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 77
    .end local v1    # "listener":Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_2
    return-void
.end method

.method public removeListener(Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/amazon/ags/html5/util/GlobalState$GlobalStateListener;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/amazon/ags/html5/util/GlobalState;->listeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 35
    return-void
.end method

.method public toJSON()Lorg/json/JSONObject;
    .locals 3

    .prologue
    .line 85
    iget-object v1, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    monitor-enter v1

    .line 86
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/amazon/ags/html5/util/GlobalState;->globalState:Ljava/util/Map;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    monitor-exit v1

    return-object v0

    .line 87
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
