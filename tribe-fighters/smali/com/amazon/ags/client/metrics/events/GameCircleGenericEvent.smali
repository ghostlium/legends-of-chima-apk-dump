.class public Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
.super Ljava/lang/Object;
.source "GameCircleGenericEvent.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private countMetrics:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private eventName:Ljava/lang/String;

.field private timeMetrics:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GC_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 3
    .param p1, "eventName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/metrics/IllegalConstructionException;
        }
    .end annotation

    .prologue
    .line 28
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "countMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    .local p4, "timeMetrics":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->attributes:Ljava/util/Map;

    .line 22
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->countMetrics:Ljava/util/Map;

    .line 23
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->timeMetrics:Ljava/util/Map;

    .line 30
    if-nez p1, :cond_0

    .line 31
    const-string v0, "EventName is empty. This event cannot be constructed."

    .line 32
    .local v0, "errMsg":Ljava/lang/String;
    new-instance v1, Lcom/amazon/ags/client/metrics/IllegalConstructionException;

    const-string v2, "EventName is empty. This event cannot be constructed."

    invoke-direct {v1, v2}, Lcom/amazon/ags/client/metrics/IllegalConstructionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    .end local v0    # "errMsg":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->eventName:Ljava/lang/String;

    .line 36
    if-eqz p2, :cond_1

    .line 37
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->attributes:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 40
    :cond_1
    if-eqz p3, :cond_2

    .line 41
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->countMetrics:Ljava/util/Map;

    invoke-interface {v1, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 44
    :cond_2
    if-eqz p4, :cond_3

    .line 45
    iget-object v1, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->timeMetrics:Ljava/util/Map;

    invoke-interface {v1, p4}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 47
    :cond_3
    return-void
.end method


# virtual methods
.method public getAttributes()Ljava/util/Map;
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
    .line 63
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->attributes:Ljava/util/Map;

    return-object v0
.end method

.method public getCountMetrics()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->countMetrics:Ljava/util/Map;

    return-object v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->eventName:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeMetrics()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;->timeMetrics:Ljava/util/Map;

    return-object v0
.end method
