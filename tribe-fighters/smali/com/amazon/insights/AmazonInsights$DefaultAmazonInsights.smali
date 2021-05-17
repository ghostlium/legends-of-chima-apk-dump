.class final Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;
.super Lcom/amazon/insights/AmazonInsights;
.source "AmazonInsights.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/insights/AmazonInsights;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DefaultAmazonInsights"
.end annotation


# instance fields
.field private final abClient:Lcom/amazon/insights/ABTestClient;

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private final eventClient:Lcom/amazon/insights/event/InternalEventClient;

.field private final sessionClient:Lcom/amazon/insights/session/InternalSessionClient;


# direct methods
.method constructor <init>(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/InsightsOptions;Lcom/amazon/insights/InsightsCallback;)V
    .locals 5
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "options"    # Lcom/amazon/insights/InsightsOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/insights/core/InsightsContext;",
            "Lcom/amazon/insights/InsightsOptions;",
            "Lcom/amazon/insights/InsightsCallback",
            "<",
            "Lcom/amazon/insights/AmazonInsights;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p3, "initCompletionCallback":Lcom/amazon/insights/InsightsCallback;, "Lcom/amazon/insights/InsightsCallback<Lcom/amazon/insights/AmazonInsights;>;"
    invoke-direct {p0}, Lcom/amazon/insights/AmazonInsights;-><init>()V

    .line 335
    const-string v0, "The InsightsContext provided must not be null"

    invoke-static {p1, v0}, Lcom/amazon/insights/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    iput-object p1, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 338
    invoke-static {}, Lcom/amazon/insights/core/log/Logger;->tryInitialize()V

    .line 339
    if-eqz p2, :cond_1

    .line 340
    invoke-interface {p2}, Lcom/amazon/insights/InsightsOptions;->getAllowEventCollection()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/amazon/insights/event/DefaultEventClient;->newInstance(Lcom/amazon/insights/core/InsightsContext;Z)Lcom/amazon/insights/event/DefaultEventClient;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    .line 345
    :goto_0
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-static {p1, v0}, Lcom/amazon/insights/session/client/DefaultSessionClient;->newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/event/InternalEventClient;)Lcom/amazon/insights/session/client/DefaultSessionClient;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->sessionClient:Lcom/amazon/insights/session/InternalSessionClient;

    .line 346
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getHttpClient()Lcom/amazon/insights/core/http/HttpClient;

    move-result-object v0

    new-instance v1, Lcom/amazon/insights/core/http/RequestTimingInterceptor;

    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v2

    invoke-interface {v2}, Lcom/amazon/insights/core/system/System;->getConnectivity()Lcom/amazon/insights/core/system/Connectivity;

    move-result-object v2

    iget-object v3, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-direct {v1, v2, v3}, Lcom/amazon/insights/core/http/RequestTimingInterceptor;-><init>(Lcom/amazon/insights/core/system/Connectivity;Lcom/amazon/insights/event/InternalEventClient;)V

    invoke-interface {v0, v1}, Lcom/amazon/insights/core/http/HttpClient;->addInterceptor(Lcom/amazon/insights/core/http/HttpClient$Interceptor;)V

    .line 347
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    invoke-static {p1, v0}, Lcom/amazon/insights/abtest/DefaultABTestClient;->newInstance(Lcom/amazon/insights/core/InsightsContext;Lcom/amazon/insights/event/InternalEventClient;)Lcom/amazon/insights/abtest/DefaultABTestClient;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->abClient:Lcom/amazon/insights/ABTestClient;

    .line 349
    if-eqz p3, :cond_0

    .line 350
    invoke-virtual {p3, p0}, Lcom/amazon/insights/InsightsCallback;->onComplete(Ljava/lang/Object;)V

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->sessionClient:Lcom/amazon/insights/session/InternalSessionClient;

    invoke-interface {v0}, Lcom/amazon/insights/session/InternalSessionClient;->startSession()V

    .line 354
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->synchronize()V

    .line 356
    invoke-static {}, Lcom/amazon/insights/AmazonInsights;->access$000()Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    const-string v1, "Amazon Insights SDK(%s) initialization successfully completed"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "2.1.16.0"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazon/insights/core/log/Logger;->devi(Ljava/lang/String;)V

    .line 357
    return-void

    .line 342
    :cond_1
    invoke-static {}, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->newDefaultOptions()Lcom/amazon/insights/InsightsOptions;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/insights/InsightsOptions;->getAllowEventCollection()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/amazon/insights/event/DefaultEventClient;->newInstance(Lcom/amazon/insights/core/InsightsContext;Z)Lcom/amazon/insights/event/DefaultEventClient;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    goto :goto_0
.end method


# virtual methods
.method public getABTestClient()Lcom/amazon/insights/ABTestClient;
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->abClient:Lcom/amazon/insights/ABTestClient;

    return-object v0
.end method

.method public getEventClient()Lcom/amazon/insights/EventClient;
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->eventClient:Lcom/amazon/insights/event/InternalEventClient;

    return-object v0
.end method

.method public getSessionClient()Lcom/amazon/insights/SessionClient;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->sessionClient:Lcom/amazon/insights/session/InternalSessionClient;

    return-object v0
.end method

.method public getUserProfile()Lcom/amazon/insights/UserProfile;
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lcom/amazon/insights/AmazonInsights$DefaultAmazonInsights;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v0}, Lcom/amazon/insights/core/InsightsContext;->getUserProfile()Lcom/amazon/insights/UserProfile;

    move-result-object v0

    return-object v0
.end method
