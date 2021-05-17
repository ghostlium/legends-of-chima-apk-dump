.class public Lcom/amazon/insights/session/client/PausedSessionState;
.super Lcom/amazon/insights/session/client/SessionClientState;
.source "PausedSessionState.java"


# direct methods
.method public constructor <init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V
    .locals 0
    .param p1, "client"    # Lcom/amazon/insights/session/client/DefaultSessionClient;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/amazon/insights/session/client/SessionClientState;-><init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V

    .line 12
    return-void
.end method


# virtual methods
.method public pause()V
    .locals 2

    .prologue
    .line 36
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v1, "Session Pause Failed: Session is already paused."

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public resume()V
    .locals 4

    .prologue
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/amazon/insights/session/client/PausedSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->getStopTime()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iget-object v2, p0, Lcom/amazon/insights/session/client/PausedSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    invoke-virtual {v2}, Lcom/amazon/insights/session/client/DefaultSessionClient;->getResumeDelay()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 22
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeResume()V

    .line 28
    :goto_0
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v1, "Session has expired. Starting a fresh one..."

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 26
    invoke-virtual {p0}, Lcom/amazon/insights/session/client/PausedSessionState;->start()V

    goto :goto_0
.end method

.method public start()V
    .locals 0

    .prologue
    .line 44
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStop()V

    .line 45
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStart()V

    .line 46
    return-void
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 53
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStop()V

    .line 54
    return-void
.end method
