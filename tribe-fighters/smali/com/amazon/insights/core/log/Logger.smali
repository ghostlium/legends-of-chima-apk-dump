.class public Lcom/amazon/insights/core/log/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/core/log/Logger$LogLevel;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final TAG:Ljava/lang/String; = "AmazonInsightsSDK"

.field private static appenders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/amazon/insights/core/log/appender/LogAppender;",
            ">;"
        }
    .end annotation
.end field

.field private static globalLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field private static initialized:Z

.field private static loggers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/amazon/insights/core/log/Logger;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private classLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;

.field private cls:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 14
    const-class v0, Lcom/amazon/insights/core/log/Logger;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/amazon/insights/core/log/Logger;->$assertionsDisabled:Z

    .line 17
    sget-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    sput-object v0, Lcom/amazon/insights/core/log/Logger;->globalLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 18
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/amazon/insights/core/log/Logger;->appenders:Ljava/util/Map;

    .line 19
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/amazon/insights/core/log/Logger;->loggers:Ljava/util/Map;

    .line 287
    sput-boolean v1, Lcom/amazon/insights/core/log/Logger;->initialized:Z

    return-void

    :cond_0
    move v0, v1

    .line 14
    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object v0, p0, Lcom/amazon/insights/core/log/Logger;->classLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 22
    iput-object v0, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    .line 23
    const-string v0, "AmazonInsightsSDK"

    iput-object v0, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    .line 35
    sget-boolean v0, Lcom/amazon/insights/core/log/Logger;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p2, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 36
    :cond_0
    iput-object p2, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    .line 37
    iput-object p1, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public static attachAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V
    .locals 2
    .param p0, "appender"    # Lcom/amazon/insights/core/log/appender/LogAppender;

    .prologue
    .line 102
    if-nez p0, :cond_1

    .line 109
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    sget-object v0, Lcom/amazon/insights/core/log/Logger;->appenders:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    sget-object v0, Lcom/amazon/insights/core/log/Logger;->appenders:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static attachLogAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V
    .locals 0
    .param p0, "appender"    # Lcom/amazon/insights/core/log/appender/LogAppender;

    .prologue
    .line 71
    invoke-static {p0}, Lcom/amazon/insights/core/log/Logger;->attachAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V

    .line 72
    return-void
.end method

.method public static detachAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V
    .locals 2
    .param p0, "appender"    # Lcom/amazon/insights/core/log/appender/LogAppender;

    .prologue
    .line 112
    if-nez p0, :cond_1

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 116
    :cond_1
    sget-object v0, Lcom/amazon/insights/core/log/Logger;->appenders:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    sget-object v0, Lcom/amazon/insights/core/log/Logger;->appenders:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public static detachLogAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V
    .locals 0
    .param p0, "appender"    # Lcom/amazon/insights/core/log/appender/LogAppender;

    .prologue
    .line 75
    invoke-static {p0}, Lcom/amazon/insights/core/log/Logger;->detachAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V

    .line 76
    return-void
.end method

.method public static getAppenders()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/amazon/insights/core/log/appender/LogAppender;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    sget-object v0, Lcom/amazon/insights/core/log/Logger;->appenders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method static declared-synchronized getClassLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/amazon/insights/core/log/Logger;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lcom/amazon/insights/core/log/Logger;

    monitor-enter v2

    if-nez p0, :cond_0

    .line 88
    :try_start_0
    const-class p0, Lcom/amazon/insights/core/log/Logger;

    .line 90
    :cond_0
    sget-object v1, Lcom/amazon/insights/core/log/Logger;->loggers:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    sget-object v1, Lcom/amazon/insights/core/log/Logger;->loggers:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/insights/core/log/Logger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    :goto_0
    monitor-exit v2

    return-object v1

    .line 93
    :cond_1
    :try_start_1
    new-instance v0, Lcom/amazon/insights/core/log/Logger;

    const-string v1, "AmazonInsightsSDK"

    invoke-direct {v0, v1, p0}, Lcom/amazon/insights/core/log/Logger;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 96
    .local v0, "logger":Lcom/amazon/insights/core/log/Logger;
    sget-object v1, Lcom/amazon/insights/core/log/Logger;->loggers:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v0

    .line 97
    goto :goto_0

    .line 87
    .end local v0    # "logger":Lcom/amazon/insights/core/log/Logger;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static getGlobalLevel()Lcom/amazon/insights/core/log/Logger$LogLevel;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/amazon/insights/core/log/Logger;->globalLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;

    return-object v0
.end method

.method public static getLogAppenders()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/amazon/insights/core/log/appender/LogAppender;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getAppenders()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/amazon/insights/core/log/Logger;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/amazon/insights/core/log/Logger;->getClassLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized setGlobalLevel(Lcom/amazon/insights/core/log/Logger$LogLevel;)V
    .locals 2
    .param p0, "level"    # Lcom/amazon/insights/core/log/Logger$LogLevel;

    .prologue
    .line 59
    const-class v0, Lcom/amazon/insights/core/log/Logger;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lcom/amazon/insights/core/log/Logger;->globalLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit v0

    return-void

    .line 59
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized tryInitialize()V
    .locals 2

    .prologue
    .line 290
    const-class v1, Lcom/amazon/insights/core/log/Logger;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/amazon/insights/core/log/Logger;->initialized:Z

    if-nez v0, :cond_0

    .line 291
    new-instance v0, Lcom/amazon/insights/core/log/Logger$1;

    invoke-direct {v0}, Lcom/amazon/insights/core/log/Logger$1;-><init>()V

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->tryInitialize(Lcom/amazon/insights/core/log/LogInitializer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    :cond_0
    monitor-exit v1

    return-void

    .line 290
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized tryInitialize(Lcom/amazon/insights/core/log/LogInitializer;)V
    .locals 2
    .param p0, "initializer"    # Lcom/amazon/insights/core/log/LogInitializer;

    .prologue
    .line 302
    const-class v1, Lcom/amazon/insights/core/log/Logger;

    monitor-enter v1

    :try_start_0
    sget-boolean v0, Lcom/amazon/insights/core/log/Logger;->initialized:Z

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    .line 303
    invoke-interface {p0}, Lcom/amazon/insights/core/log/LogInitializer;->tryInitialize()V

    .line 304
    const/4 v0, 0x1

    sput-boolean v0, Lcom/amazon/insights/core/log/Logger;->initialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 306
    :cond_0
    monitor-exit v1

    return-void

    .line 302
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public d(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 134
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->DEBUG:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 136
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 139
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 142
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->DEBUG:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 143
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 144
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 147
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public devd(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 151
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->devd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 153
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devd(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 156
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 157
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->devd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 159
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public deve(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 276
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 277
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    iget-object v2, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->deve(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 279
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public deve(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 282
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 283
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    iget-object v2, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->deve(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 285
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devi(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 207
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->devi(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 209
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devi(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 212
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 213
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->devi(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 215
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devv(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 178
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 179
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->devv(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 181
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devv(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 184
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 185
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->devv(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 187
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devw(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 242
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 243
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->devw(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 245
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devw(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 254
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 255
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->devw(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 257
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public devw(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 248
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 249
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->devw(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 251
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 260
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->ERROR:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 261
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 262
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    iget-object v2, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 265
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 268
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->ERROR:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 269
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 270
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    iget-object v2, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 273
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method getLogClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    return-object v0
.end method

.method declared-synchronized getLogLevel()Lcom/amazon/insights/core/log/Logger$LogLevel;
    .locals 2

    .prologue
    .line 49
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->OFF:Lcom/amazon/insights/core/log/Logger$LogLevel;

    .line 50
    .local v0, "level":Lcom/amazon/insights/core/log/Logger$LogLevel;
    iget-object v1, p0, Lcom/amazon/insights/core/log/Logger;->classLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;

    if-eqz v1, :cond_0

    .line 51
    iget-object v0, p0, Lcom/amazon/insights/core/log/Logger;->classLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    :goto_0
    monitor-exit p0

    return-object v0

    .line 53
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getGlobalLevel()Lcom/amazon/insights/core/log/Logger$LogLevel;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 49
    .end local v0    # "level":Lcom/amazon/insights/core/log/Logger$LogLevel;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/amazon/insights/core/log/Logger;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public i(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 190
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->INFO:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 191
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 192
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 195
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public i(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 198
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->INFO:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 199
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 200
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 203
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public declared-synchronized isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z
    .locals 2
    .param p1, "requestedLevel"    # Lcom/amazon/insights/core/log/Logger$LogLevel;

    .prologue
    .line 41
    monitor-enter p0

    const/4 v0, 0x0

    .line 42
    .local v0, "isEnabled":Z
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getLogLevel()Lcom/amazon/insights/core/log/Logger$LogLevel;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/amazon/insights/core/log/Logger$LogLevel;->compareTo(Ljava/lang/Enum;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-ltz v1, :cond_0

    .line 43
    const/4 v0, 0x1

    .line 45
    :cond_0
    monitor-exit p0

    return v0

    .line 41
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setLevel(Lcom/amazon/insights/core/log/Logger$LogLevel;)V
    .locals 1
    .param p1, "level"    # Lcom/amazon/insights/core/log/Logger$LogLevel;

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/amazon/insights/core/log/Logger;->classLevel:Lcom/amazon/insights/core/log/Logger$LogLevel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public v(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 162
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 163
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 164
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 167
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public v(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 170
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 171
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 172
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 175
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 218
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 219
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 220
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/amazon/insights/core/log/appender/LogAppender;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 223
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public w(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 234
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 235
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 236
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/core/log/Logger;->cls:Ljava/lang/Class;

    invoke-virtual {v0, v3, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->decorateMessage(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3, p2}, Lcom/amazon/insights/core/log/appender/LogAppender;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 239
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public w(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 226
    sget-object v2, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {p0, v2}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 227
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->getLogAppenders()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/insights/core/log/appender/LogAppender;

    .line 228
    .local v0, "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    invoke-virtual {p0}, Lcom/amazon/insights/core/log/Logger;->getTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/amazon/insights/core/log/appender/LogAppender;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 231
    .end local v0    # "appender":Lcom/amazon/insights/core/log/appender/LogAppender;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method
