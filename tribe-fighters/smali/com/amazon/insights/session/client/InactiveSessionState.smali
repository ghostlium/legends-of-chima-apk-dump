.class public Lcom/amazon/insights/session/client/InactiveSessionState;
.super Lcom/amazon/insights/session/client/SessionClientState;
.source "InactiveSessionState.java"


# direct methods
.method public constructor <init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V
    .locals 0
    .param p1, "client"    # Lcom/amazon/insights/session/client/DefaultSessionClient;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/amazon/insights/session/client/SessionClientState;-><init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V

    .line 15
    return-void
.end method


# virtual methods
.method public pause()V
    .locals 3

    .prologue
    .line 42
    iget-object v1, p0, Lcom/amazon/insights/session/client/InactiveSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v2, "_session.pause"

    invoke-interface {v1, v2}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 43
    .local v0, "e":Lcom/amazon/insights/Event;
    iget-object v1, p0, Lcom/amazon/insights/session/client/InactiveSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v1, v0}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;)V

    .line 46
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Session Pause Failed: No session is running."

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public resume()V
    .locals 3

    .prologue
    .line 26
    iget-object v1, p0, Lcom/amazon/insights/session/client/InactiveSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    const-string v2, "_session.resume"

    invoke-interface {v1, v2}, Lcom/amazon/insights/event/InternalEventClient;->createEvent(Ljava/lang/String;)Lcom/amazon/insights/Event;

    move-result-object v0

    .line 27
    .local v0, "e":Lcom/amazon/insights/Event;
    iget-object v1, p0, Lcom/amazon/insights/session/client/InactiveSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v1, v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-interface {v1, v0}, Lcom/amazon/insights/event/InternalEventClient;->recordEvent(Lcom/amazon/insights/Event;)V

    .line 30
    sget-object v1, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "Session Resume Failed: No session is paused."

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public start()V
    .locals 0

    .prologue
    .line 57
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStart()V

    .line 58
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 66
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v1, "Session Stop Failed: No session is running."

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 67
    return-void
.end method
