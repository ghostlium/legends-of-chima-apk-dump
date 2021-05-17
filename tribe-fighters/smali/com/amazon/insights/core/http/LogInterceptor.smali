.class public final Lcom/amazon/insights/core/http/LogInterceptor;
.super Ljava/lang/Object;
.source "LogInterceptor.java"

# interfaces
.implements Lcom/amazon/insights/core/http/HttpClient$Interceptor;


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/amazon/insights/core/http/LogInterceptor;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/core/http/LogInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public after(Lcom/amazon/insights/core/http/HttpClient$Response;)V
    .locals 2
    .param p1, "response"    # Lcom/amazon/insights/core/http/HttpClient$Response;

    .prologue
    .line 25
    sget-object v0, Lcom/amazon/insights/core/http/LogInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    sget-object v0, Lcom/amazon/insights/core/http/LogInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->v(Ljava/lang/String;)V

    .line 28
    :cond_0
    return-void
.end method

.method public before(Lcom/amazon/insights/core/http/HttpClient$Request;)V
    .locals 2
    .param p1, "request"    # Lcom/amazon/insights/core/http/HttpClient$Request;

    .prologue
    .line 18
    sget-object v0, Lcom/amazon/insights/core/http/LogInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    sget-object v1, Lcom/amazon/insights/core/log/Logger$LogLevel;->VERBOSE:Lcom/amazon/insights/core/log/Logger$LogLevel;

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->isLoggingEnabled(Lcom/amazon/insights/core/log/Logger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 19
    sget-object v0, Lcom/amazon/insights/core/http/LogInterceptor;->logger:Lcom/amazon/insights/core/log/Logger;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->v(Ljava/lang/String;)V

    .line 21
    :cond_0
    return-void
.end method
