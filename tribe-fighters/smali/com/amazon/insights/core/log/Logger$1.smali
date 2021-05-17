.class final Lcom/amazon/insights/core/log/Logger$1;
.super Ljava/lang/Object;
.source "Logger.java"

# interfaces
.implements Lcom/amazon/insights/core/log/LogInitializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazon/insights/core/log/Logger;->tryInitialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public tryInitialize()V
    .locals 1

    .prologue
    .line 294
    sget-object v0, Lcom/amazon/insights/core/log/Logger$LogLevel;->WARN:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->setGlobalLevel(Lcom/amazon/insights/core/log/Logger$LogLevel;)V

    .line 295
    new-instance v0, Lcom/amazon/insights/core/log/appender/DeveloperLogCatAppender;

    invoke-direct {v0}, Lcom/amazon/insights/core/log/appender/DeveloperLogCatAppender;-><init>()V

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->attachAppender(Lcom/amazon/insights/core/log/appender/LogAppender;)V

    .line 296
    return-void
.end method
