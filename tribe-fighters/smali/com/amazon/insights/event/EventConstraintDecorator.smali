.class public Lcom/amazon/insights/event/EventConstraintDecorator;
.super Ljava/lang/Object;
.source "EventConstraintDecorator.java"

# interfaces
.implements Lcom/amazon/insights/Event;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/insights/event/EventConstraintDecorator$Pair;
    }
.end annotation


# static fields
.field private static final MAX_EVENT_ATTRIBUTE_METRIC_KEY_LENGTH:I = 0x32

.field private static final MAX_EVENT_ATTRIBUTE_VALUE_LENGTH:I = 0x3e8

.field private static final MAX_NUM_OF_METRICS_AND_ATTRIBUTES:I = 0x14

.field private static logger:Lcom/amazon/insights/core/log/Logger;


# instance fields
.field private final currentNumOfAttributesAndMetrics:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final decoratedEvent:Lcom/amazon/insights/Event;

.field private final maxAttributesAndMetrics:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/amazon/insights/event/EventConstraintDecorator;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/amazon/insights/Event;I)V
    .locals 2
    .param p1, "eventToDecorate"    # Lcom/amazon/insights/Event;
    .param p2, "maxAttributesAndMetrics"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->currentNumOfAttributesAndMetrics:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 50
    iput-object p1, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    .line 51
    iput p2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->maxAttributesAndMetrics:I

    .line 52
    return-void
.end method

.method public static newInstance(Lcom/amazon/insights/Event;)Lcom/amazon/insights/event/EventConstraintDecorator;
    .locals 2
    .param p0, "eventToDecorate"    # Lcom/amazon/insights/Event;

    .prologue
    .line 46
    new-instance v0, Lcom/amazon/insights/event/EventConstraintDecorator;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lcom/amazon/insights/event/EventConstraintDecorator;-><init>(Lcom/amazon/insights/Event;I)V

    return-object v0
.end method

.method private static processAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/event/EventConstraintDecorator$Pair;
    .locals 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/amazon/insights/event/EventConstraintDecorator$Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 155
    const/16 v2, 0x32

    invoke-static {p0, v2, v4}, Lcom/amazon/insights/core/util/StringUtil;->clipString(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, "trimmedKey":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 157
    sget-object v2, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "The attribute key has been trimmed to a length of 50 characters"

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 159
    :cond_0
    const/16 v2, 0x3e8

    invoke-static {p1, v2, v4}, Lcom/amazon/insights/core/util/StringUtil;->clipString(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "trimmedValue":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 161
    sget-object v2, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "The attribute value has been trimmed to a length of 1000 characters"

    invoke-virtual {v2, v3}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 164
    :cond_1
    new-instance v2, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;

    invoke-direct {v2, v0, v1}, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method private static processMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/event/EventConstraintDecorator$Pair;
    .locals 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ")",
            "Lcom/amazon/insights/event/EventConstraintDecorator$Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    const/16 v1, 0x32

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/amazon/insights/core/util/StringUtil;->clipString(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "trimmedKey":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 171
    sget-object v1, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "The metric key has been trimmed to a length of 50 characters"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->devw(Ljava/lang/String;)V

    .line 174
    :cond_0
    new-instance v1, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;

    invoke-direct {v1, v0, p1}, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method


# virtual methods
.method public declared-synchronized addAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 57
    monitor-enter p0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v2, p1}, Lcom/amazon/insights/Event;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 58
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->currentNumOfAttributesAndMetrics:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    iget v3, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->maxAttributesAndMetrics:I

    if-ge v2, v3, :cond_0

    .line 59
    invoke-static {p1, p2}, Lcom/amazon/insights/event/EventConstraintDecorator;->processAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/event/EventConstraintDecorator$Pair;

    move-result-object v1

    .line 60
    .local v1, "trimmedResult":Lcom/amazon/insights/event/EventConstraintDecorator$Pair;, "Lcom/amazon/insights/event/EventConstraintDecorator$Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-static {v1}, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;->access$000(Lcom/amazon/insights/event/EventConstraintDecorator$Pair;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v1}, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;->access$100(Lcom/amazon/insights/event/EventConstraintDecorator$Pair;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v4, v2, v3}, Lcom/amazon/insights/Event;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->currentNumOfAttributesAndMetrics:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .end local v1    # "trimmedResult":Lcom/amazon/insights/event/EventConstraintDecorator$Pair;, "Lcom/amazon/insights/event/EventConstraintDecorator$Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v2, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "addAttribute"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 57
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized addMetric(Ljava/lang/String;Ljava/lang/Number;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 83
    monitor-enter p0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v2, p1}, Lcom/amazon/insights/Event;->hasMetric(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 84
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->currentNumOfAttributesAndMetrics:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    iget v3, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->maxAttributesAndMetrics:I

    if-ge v2, v3, :cond_0

    .line 85
    invoke-static {p1, p2}, Lcom/amazon/insights/event/EventConstraintDecorator;->processMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/event/EventConstraintDecorator$Pair;

    move-result-object v1

    .line 86
    .local v1, "trimmedResult":Lcom/amazon/insights/event/EventConstraintDecorator$Pair;, "Lcom/amazon/insights/event/EventConstraintDecorator$Pair<Ljava/lang/String;Ljava/lang/Number;>;"
    iget-object v4, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-static {v1}, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;->access$000(Lcom/amazon/insights/event/EventConstraintDecorator$Pair;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v1}, Lcom/amazon/insights/event/EventConstraintDecorator$Pair;->access$100(Lcom/amazon/insights/event/EventConstraintDecorator$Pair;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-interface {v4, v2, v3}, Lcom/amazon/insights/Event;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V

    .line 87
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->currentNumOfAttributesAndMetrics:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .end local v1    # "trimmedResult":Lcom/amazon/insights/event/EventConstraintDecorator$Pair;, "Lcom/amazon/insights/event/EventConstraintDecorator$Pair<Ljava/lang/String;Ljava/lang/Number;>;"
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v2, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "addMetric"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 83
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getAllAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v0}, Lcom/amazon/insights/Event;->getAllAttributes()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getAllMetrics()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Number;",
            ">;"
        }
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v0}, Lcom/amazon/insights/Event;->getAllMetrics()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v0, p1}, Lcom/amazon/insights/Event;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v0}, Lcom/amazon/insights/Event;->getEventType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMetric(Ljava/lang/String;)Ljava/lang/Number;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v0, p1}, Lcom/amazon/insights/Event;->getMetric(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    return-object v0
.end method

.method public hasAttribute(Ljava/lang/String;)Z
    .locals 4
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v1, 0x0

    .line 73
    .local v1, "hasAttribute":Z
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v2, p1}, Lcom/amazon/insights/Event;->hasAttribute(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 77
    :goto_0
    return v1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "hasAttribute"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public hasMetric(Ljava/lang/String;)Z
    .locals 4
    .param p1, "metricName"    # Ljava/lang/String;

    .prologue
    .line 97
    const/4 v1, 0x0

    .line 99
    .local v1, "hasMetric":Z
    :try_start_0
    iget-object v2, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    invoke-interface {v2, p1}, Lcom/amazon/insights/Event;->hasMetric(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 103
    :goto_0
    return v1

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v3, "hasMetric"

    invoke-virtual {v2, v3, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public withAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/Event;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 124
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/event/EventConstraintDecorator;->addAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :goto_0
    iget-object v1, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    return-object v1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "withAttribute"

    invoke-virtual {v1, v2, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public withMetric(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/Event;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 135
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/amazon/insights/event/EventConstraintDecorator;->addMetric(Ljava/lang/String;Ljava/lang/Number;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    :goto_0
    iget-object v1, p0, Lcom/amazon/insights/event/EventConstraintDecorator;->decoratedEvent:Lcom/amazon/insights/Event;

    return-object v1

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/amazon/insights/event/EventConstraintDecorator;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "withMetric"

    invoke-virtual {v1, v2, v0}, Lcom/amazon/insights/core/log/Logger;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
