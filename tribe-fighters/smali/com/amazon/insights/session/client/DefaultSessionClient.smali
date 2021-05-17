.class public Lcom/amazon/insights/session/client/DefaultSessionClient;
.super Ljava/lang/Object;
.source "DefaultSessionClient.java"

# interfaces
.implements Lcom/amazon/insights/session/InternalSessionClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/session/client/DefaultSessionClient$1;,
        Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;
    }
.end annotation


# static fields
.field protected static final DEFAULT_RESTART_DELAY:J = 0x7530L

.field protected static final DEFAULT_RESUME_DELAY:J = 0x1388L

.field protected static final RESTART_DELAY_CONFIG_KEY:Ljava/lang/String; = "sessionRestartDelay"

.field protected static final RESUME_DELAY_CONFIG_KEY:Ljava/lang/String; = "sessionResumeDelay"

.field public static final SESSION_DURATION_METRIC_KEY:Ljava/lang/String; = "_session.duration"

.field public static final SESSION_ID_ATTRIBUTE_KEY:Ljava/lang/String; = "_session.id"

.field public static final SESSION_PAUSE_EVENT_TYPE:Ljava/lang/String; = "_session.pause"

.field public static final SESSION_RESUME_EVENT_TYPE:Ljava/lang/String; = "_session.resume"

.field public static final SESSION_START_EVENT_TYPE:Ljava/lang/String; = "_session.start"

.field public static final SESSION_START_TIME_ATTRIBUTE_KEY:Ljava/lang/String; = "_session.startTime"

.field public static final SESSION_STOP_EVENT_TYPE:Ljava/lang/String; = "_session.stop"

.field public static final SESSION_STOP_TIME_ATTRIBUTE_KEY:Ljava/lang/String; = "_session.stopTime"

.field protected static final logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final ACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

.field private final INACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

.field private final PAUSED_STATE:Lcom/amazon/insights/session/client/SessionClientState;

.field protected final context:Lcom/amazon/insights/core/InsightsContext;

.field protected final eventClient:Lcom/amazon/insights/event/InternalEventClient;

.field private final restartDelay:J

.field private final resumeDelay:J

.field protected session:Lcom/amazon/insights/session/Session;

.field protected final sessionStore:Lcom/amazon/insights/session/SessionStore;

.field protected state:Lcom/amazon/insights/session/client/SessionClientState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/amazon/insights/session/client/DefaultSessionClient;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/event/InternalEventClient;Lcom/amazon/insights/session/SessionStore;)V
    .locals 4
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "eventClient"    # Lcom/amazon/insights/event/InternalEventClient;
    .param p3, "sessionStore"    # Lcom/amazon/insights/session/SessionStore;

    .prologue
    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Lcom/amazon/insights/session/client/InactiveSessionState;

    invoke-direct {v0, p0}, Lcom/amazon/insights/session/client/InactiveSessionState;-><init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->INACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    .line 67
    new-instance v0, Lcom/amazon/insights/session/client/ActiveSessionState;

    invoke-direct {v0, p0}, Lcom/amazon/insights/session/client/ActiveSessionState;-><init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->ACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    .line 68
    new-instance v0, Lcom/amazon/insights/session/client/PausedSessionState;

    invoke-direct {v0, p0}, Lcom/amazon/insights/session/client/PausedSessionState;-><init>(Lcom/amazon/insights/session/client/DefaultSessionClient;)V

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->PAUSED_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    .line 140
    const-string v0, "A valid InsightsContext must be provided!"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string v0, "A valid EventClient must be provided!"

    invoke-static {p2, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v0, "A valid SessionStore must be provided!"

    invoke-static {p3, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    iput-object p3, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->sessionStore:Lcom/amazon/insights/session/SessionStore;

    .line 145
    iput-object p2, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    .line 146
    iput-object p1, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 147
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->sessionStore:Lcom/amazon/insights/session/SessionStore;

    invoke-interface {v0}, Lcom/amazon/insights/session/SessionStore;->getSession()Lcom/amazon/insights/session/Session;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    .line 148
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->INACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    :goto_0
    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;

    .line 150
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "sessionRestartDelay"

    const-wide/16 v2, 0x7530

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->restartDelay:J

    .line 151
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "sessionResumeDelay"

    const-wide/16 v2, 0x1388

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->resumeDelay:J

    .line 152
    return-void

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->PAUSED_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    goto :goto_0
.end method

.method public static newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/event/InternalEventClient;)Lcom/amazon/insights/session/client/DefaultSessionClient;
    .locals 2
    .param p0, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p1, "eventClient"    # Lcom/amazon/insights/event/InternalEventClient;

    .prologue
    .line 81
    new-instance v0, Lcom/amazon/insights/session/FileSessionStore;

    invoke-direct {v0, p0}, Lcom/amazon/insights/session/FileSessionStore;-><init>(Lcom/amazon/insights/core/InsightsContext;)V

    .line 82
    .local v0, "sessionStore":Lcom/amazon/insights/session/SessionStore;
    new-instance v1, Lcom/amazon/insights/session/client/DefaultSessionClient;

    invoke-direct {v1, p0, p1, v0}, Lcom/amazon/insights/session/client/DefaultSessionClient;-><init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/event/InternalEventClient;Lcom/amazon/insights/session/SessionStore;)V

    return-object v1
.end method


# virtual methods
.method protected declared-synchronized changeState(Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;)V
    .locals 2
    .param p1, "s"    # Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    .prologue
    .line 186
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient$1;->$SwitchMap$com$amazon$insights$session$client$DefaultSessionClient$SessionState:[I

    invoke-virtual {p1}, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->ordinal()I

    move-result v1

    aget v0, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v0, :pswitch_data_0

    .line 199
    :goto_0
    monitor-exit p0

    return-void

    .line 188
    :pswitch_0
    :try_start_1
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->INACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 186
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 191
    :pswitch_1
    :try_start_2
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->ACTIVE_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;

    goto :goto_0

    .line 194
    :pswitch_2
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->PAUSED_STATE:Lcom/amazon/insights/session/client/SessionClientState;

    iput-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 186
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getRestartDelay()J
    .locals 2

    .prologue
    .line 161
    iget-wide v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->restartDelay:J

    return-wide v0
.end method

.method public getResumeDelay()J
    .locals 2

    .prologue
    .line 164
    iget-wide v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->resumeDelay:J

    return-wide v0
.end method

.method protected getSession()Lcom/amazon/insights/session/Session;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    return-object v0
.end method

.method protected getSessionState()Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    if-eqz v0, :cond_1

    .line 180
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v0}, Lcom/amazon/insights/session/Session;->isPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->PAUSED:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    .line 182
    :goto_0
    return-object v0

    .line 180
    :cond_0
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->ACTIVE:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    goto :goto_0

    .line 182
    :cond_1
    sget-object v0, Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;->INACTIVE:Lcom/amazon/insights/session/client/DefaultSessionClient$SessionState;

    goto :goto_0
.end method

.method public declared-synchronized pauseSession()V
    .locals 1

    .prologue
    .line 107
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;

    invoke-virtual {v0}, Lcom/amazon/insights/session/client/SessionClientState;->pause()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    monitor-exit p0

    return-void

    .line 107
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resumeSession()V
    .locals 1

    .prologue
    .line 117
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;

    invoke-virtual {v0}, Lcom/amazon/insights/session/client/SessionClientState;->resume()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    monitor-exit p0

    return-void

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startSession()V
    .locals 1

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;

    invoke-virtual {v0}, Lcom/amazon/insights/session/client/SessionClientState;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    monitor-exit p0

    return-void

    .line 91
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopSession()V
    .locals 1

    .prologue
    .line 99
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->state:Lcom/amazon/insights/session/client/SessionClientState;

    invoke-virtual {v0}, Lcom/amazon/insights/session/client/SessionClientState;->stop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    monitor-exit p0

    return-void

    .line 99
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[DefaultSessionClient]\n- session: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    if-nez v0, :cond_0

    const-string v0, "<null>"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v0}, Lcom/amazon/insights/session/Session;->isPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ": paused"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/session/client/DefaultSessionClient;->session:Lcom/amazon/insights/session/Session;

    invoke-virtual {v0}, Lcom/amazon/insights/session/Session;->getSessionID()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, ""

    goto :goto_1
.end method
