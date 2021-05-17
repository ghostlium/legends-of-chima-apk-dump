.class public Lcom/amazon/insights/event/adapter/JSONEventAdapter;
.super Ljava/lang/Object;
.source "JSONEventAdapter.java"

# interfaces
.implements Lcom/amazon/insights/event/adapter/EventAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazon/insights/event/adapter/EventAdapter",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# static fields
.field private static logger:Lcom/amazon/insights/core/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lcom/amazon/insights/event/adapter/JSONEventAdapter;

    invoke-static {v0}, Lcom/amazon/insights/core/log/Logger;->getLogger(Ljava/lang/Class;)Lcom/amazon/insights/core/log/Logger;

    move-result-object v0

    sput-object v0, Lcom/amazon/insights/event/adapter/JSONEventAdapter;->logger:Lcom/amazon/insights/core/log/Logger;

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
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lcom/amazon/insights/core/util/JSONBuilder;

    invoke-direct {v0, p0}, Lcom/amazon/insights/core/util/JSONBuilder;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/amazon/insights/core/util/JSONBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lcom/amazon/insights/event/InternalEvent;

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/amazon/insights/event/adapter/JSONEventAdapter;->translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public translateFromEvent(Lcom/amazon/insights/event/InternalEvent;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "source"    # Lcom/amazon/insights/event/InternalEvent;

    .prologue
    .line 18
    if-nez p1, :cond_1

    .line 19
    sget-object v1, Lcom/amazon/insights/event/adapter/JSONEventAdapter;->logger:Lcom/amazon/insights/core/log/Logger;

    const-string v2, "The Event provided was null"

    invoke-virtual {v1, v2}, Lcom/amazon/insights/core/log/Logger;->i(Ljava/lang/String;)V

    .line 20
    const/4 v0, 0x0

    .line 30
    :cond_0
    :goto_0
    return-object v0

    .line 23
    :cond_1
    invoke-interface {p1}, Lcom/amazon/insights/event/InternalEvent;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    .line 24
    .local v0, "json":Lorg/json/JSONObject;
    const-string v1, "class"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 25
    const-string v1, "class"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    :cond_2
    const-string v1, "hashCode"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    const-string v1, "hashCode"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0
.end method
