.class public Lcom/amazon/insights/impl/DefaultInsightsOptions;
.super Ljava/lang/Object;
.source "DefaultInsightsOptions.java"

# interfaces
.implements Lcom/amazon/insights/InsightsOptions;


# instance fields
.field private final allowEventCollection:Z

.field private final allowWANDelivery:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 0
    .param p1, "allowEventCollection"    # Z
    .param p2, "allowWANDelivery"    # Z

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-boolean p1, p0, Lcom/amazon/insights/impl/DefaultInsightsOptions;->allowEventCollection:Z

    .line 16
    iput-boolean p2, p0, Lcom/amazon/insights/impl/DefaultInsightsOptions;->allowWANDelivery:Z

    .line 17
    return-void
.end method


# virtual methods
.method public getAllowEventCollection()Z
    .locals 1

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/amazon/insights/impl/DefaultInsightsOptions;->allowEventCollection:Z

    return v0
.end method

.method public getAllowWANDelivery()Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/amazon/insights/impl/DefaultInsightsOptions;->allowWANDelivery:Z

    return v0
.end method
