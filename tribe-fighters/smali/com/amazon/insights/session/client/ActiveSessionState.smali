.class public final Lcom/amazon/insights/session/client/ActiveSessionState;
.super Lcom/amazon/insights/session/client/SessionClientState;
.source "ActiveSessionState.java"


# direct methods
.method public constructor <init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V
    .locals 0
    .param p1, "client"    # Lcom/amazon/insights/session/client/DefaultSessionClient;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/amazon/insights/session/client/SessionClientState;-><init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V

    .line 13
    return-void
.end method


# virtual methods
.method public pause()V
    .locals 0

    .prologue
    .line 29
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executePause()V

    .line 30
    return-void
.end method

.method public resume()V
    .locals 2

    .prologue
    .line 21
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v1, "Session Resume Failed: Session is already running."

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 22
    return-void
.end method

.method public start()V
    .locals 4

    .prologue
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/amazon/insights/session/client/ActiveSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    iget-object v2, v2, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v2}, Lcom/amazon/insights/session/Session;->getStartTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iget-object v2, p0, Lcom/amazon/insights/session/client/ActiveSessionState;->client:Lcom/amazon/insights/session/client/DefaultSessionClient;

    invoke-virtual {v2}, Lcom/amazon/insights/session/client/DefaultSessionClient;->getRestartDelay()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 41
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStop()V

    .line 42
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStart()V

    .line 47
    :goto_0
    return-void

    .line 45
    :cond_0
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v1, "Session Start Failed: Previous session was started too recently"

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 54
    invoke-super {p0}, Lcom/amazon/insights/session/client/SessionClientState;->executeStop()V

    .line 55
    return-void
.end method
