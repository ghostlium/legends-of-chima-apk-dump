.class public Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;
.super Ljava/lang/Object;
.source "ConnectivityPolicy.java"

# interfaces
.implements Lcom/amazon/insights/delivery/policy/DeliveryPolicy;


# static fields
.field private static final ALLOW_WAN_DEFAULT:Z = true

.field private static final ALLOW_WAN_KEY:Ljava/lang/String; = "allowWANEventDelivery"


# instance fields
.field private final connectivity:Lcom/amazon/insights/core/system/Connectivity;

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private final isWanAllowed:Z


# direct methods
.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;Z)V
    .locals 1
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "isWanAllowed"    # Z

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 21
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/insights/core/system/System;->getConnectivity()Lcom/amazon/insights/core/system/Connectivity;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    .line 22
    iput-boolean p2, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->isWanAllowed:Z

    .line 23
    return-void
.end method


# virtual methods
.method public handleDeliveryAttempt(Z)V
    .locals 0
    .param p1, "successful"    # Z

    .prologue
    .line 41
    return-void
.end method

.method public isAllowed()Z
    .locals 7

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 27
    const/4 v0, 0x0

    .line 30
    .local v0, "allowed":Z
    iget-object v4, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v4}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v4

    const-string v5, "allowWANEventDelivery"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lcom/amazon/insights/core/configuration/Configuration;->optBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->isWanAllowed:Z

    if-eqz v4, :cond_2

    move v1, v2

    .line 32
    .local v1, "canTrasmitOnWAN":Z
    :goto_0
    iget-object v4, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    invoke-interface {v4}, Lcom/amazon/insights/core/system/Connectivity;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 33
    iget-object v4, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    invoke-interface {v4}, Lcom/amazon/insights/core/system/Connectivity;->hasWifi()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;->connectivity:Lcom/amazon/insights/core/system/Connectivity;

    invoke-interface {v4}, Lcom/amazon/insights/core/system/Connectivity;->hasWAN()Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz v1, :cond_3

    :cond_0
    move v0, v2

    .line 35
    :cond_1
    :goto_1
    return v0

    .end local v1    # "canTrasmitOnWAN":Z
    :cond_2
    move v1, v3

    .line 30
    goto :goto_0

    .restart local v1    # "canTrasmitOnWAN":Z
    :cond_3
    move v0, v3

    .line 33
    goto :goto_1
.end method
