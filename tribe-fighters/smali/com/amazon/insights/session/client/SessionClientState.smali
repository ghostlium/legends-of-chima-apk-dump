.class public abstract Lcom/amazon/insights/session/client/SessionClientState;
.super Ljava/lang/Object;
.source "SessionClientState.java"


# instance fields
.field protected final client:Lcom/amazon/insights/session/client/DefaultSessionClient;


# direct methods
.method public constructor <init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V
    .locals 0
    .param p1, "client"    # Lcom/amazon/insights/session/client/DefaultSessionClient;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    .line 25
    return-void
.end method


# virtual methods
.method protected executePause()V
    .locals 4

    .prologue
    .line 83
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v1}, Lcom/amazon/insights/session/Session;->pause()V

    .line 84
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Session Paused: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v3, v3, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v3}, Lcom/amazon/insights/session/Session;->getSessionID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;)V

    .line 85
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Session Paused."

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 88
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Firing Session Event: _session.pause"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devv(Ljava/lang/String;)V

    .line 89
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v2, "_session.pause"

    invoke-interface {v1, v2}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 90
    .local v0, "e":Lcom/amazon/insights/Event;
    const-string v1, "_session.duration"

    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->getSessionDuration()Ljava/lang/Number;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/Event;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    .line 91
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v1, v0}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;)V

    .line 94
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->sessionStore:Lcom/amazon/insights/session/SessionStore;

    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-interface {v1, v2}, Lcom/amazon/insights/session/SessionStore;->storeSession(Lcom/amazon/insights/session/Session;)V

    .line 97
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    sget-object v2, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->PAUSED:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    invoke-virtual {v1, v2}, Lcom/amazon/insights/session/client/DefaultSessionClient;->changeState(Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;)V

    .line 98
    return-void
.end method

.method protected executeResume()V
    .locals 4

    .prologue
    .line 106
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v1}, Lcom/amazon/insights/session/Session;->resume()V

    .line 109
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Firing Session Event: _session.resume"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devv(Ljava/lang/String;)V

    .line 110
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v2, "_session.resume"

    invoke-interface {v1, v2}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 111
    .local v0, "e":Lcom/amazon/insights/Event;
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v1, v0}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;)V

    .line 114
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Session Resumed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v3, v3, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v3}, Lcom/amazon/insights/session/Session;->getSessionID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;)V

    .line 115
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Session Resumed."

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 118
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    sget-object v2, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->ACTIVE:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    invoke-virtual {v1, v2}, Lcom/amazon/insights/session/client/DefaultSessionClient;->changeState(Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;)V

    .line 119
    return-void
.end method

.method protected executeStart()V
    .locals 4

    .prologue
    .line 35
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-static {v2}, Lcom/amazon/insights/session/Session;->newInstance(Lcom/amazon/insights/core/InsightsContext;)Lcom/amazon/insights/session/Session;

    move-result-object v2

    iput-object v2, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    .line 38
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v2, "_session.id"

    iget-object v3, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v3, v3, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v3}, Lcom/amazon/insights/session/Session;->getSessionID()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/amazon/insights/event/InternalEventClient;->addGlobalAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Firing Session Event: _session.start"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devv(Ljava/lang/String;)V

    .line 42
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v2, "_session.start"

    invoke-interface {v1, v2}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 43
    .local v0, "e":Lcom/amazon/insights/Event;
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v1, v0}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;)V

    .line 46
    iget-object v1, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    sget-object v2, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->ACTIVE:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    invoke-virtual {v1, v2}, Lcom/amazon/insights/session/client/DefaultSessionClient;->changeState(Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;)V

    .line 47
    return-void
.end method

.method protected executeStop()V
    .locals 5

    .prologue
    .line 53
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->isPaused()Z

    move-result v2

    if-nez v2, :cond_0

    .line 54
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->pause()V

    .line 57
    :cond_0
    sget-object v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "Firing Session Event: _session.stop"

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devv(Ljava/lang/String;)V

    .line 58
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v3, "_session.stop"

    invoke-interface {v2, v3}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 59
    .local v0, "e":Lcom/amazon/insights/Event;
    const-string v2, "_session.duration"

    iget-object v3, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v3, v3, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v3}, Lcom/amazon/insights/session/Session;->getSessionDuration()Ljava/lang/Number;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/amazon/insights/Event;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    .line 60
    const-string v2, "_session.id"

    iget-object v3, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v3, v3, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v3}, Lcom/amazon/insights/session/Session;->getSessionID()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->getStopTime()Ljava/lang/Long;

    move-result-object v2

    if-nez v2, :cond_1

    const-wide/16 v2, 0x0

    :goto_0
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 62
    .local v1, "stopTime":Ljava/lang/Long;
    const-string v2, "_session.startTime"

    iget-object v3, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v3, v3, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v3}, Lcom/amazon/insights/session/Session;->getStartTime()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string v2, "_session.stopTime"

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v2, v0}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;)V

    .line 67
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v3, "_session.id"

    invoke-interface {v2, v3}, Lcom/amazon/insights/event/InternalEventClient;->removeGlobalAttribute(Ljava/lang/String;)V

    .line 70
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    .line 73
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    sget-object v3, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->INACTIVE:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    invoke-virtual {v2, v3}, Lcom/amazon/insights/session/client/DefaultSessionClient;->changeState(Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;)V

    .line 74
    return-void

    .line 61
    .end local v1    # "stopTime":Ljava/lang/Long;
    :cond_1
    iget-object v2, p0, Lcom/amazon/insights/session/client/SessionClientState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->getStopTime()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_0
.end method

.method public abstract pause()V
.end method

.method public abstract resume()V
.end method

.method public abstract start()V
.end method

.method public abstract stop()V
.end method
