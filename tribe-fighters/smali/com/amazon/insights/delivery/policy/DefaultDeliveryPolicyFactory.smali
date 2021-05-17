.class public Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;
.super Ljava/lang/Object;
.source "DefaultDeliveryPolicyFactory.java"

# interfaces
.implements Lcom/amazon/insights/delivery/policy/DeliveryPolicyFactory;


# static fields
.field private static final BG_SUBMISSION_WAIT_TIME_SEC:J = 0x0L

.field private static final FORCE_SUBMISSION_WAIT_TIME_SEC:J = 0x3cL


# instance fields
.field private final backgroundSubmissionInterval:J

.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private final forceSubmissionInterval:J

.field private final isWanAllowed:Z


# direct methods
.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;Z)V
    .locals 6
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "isWanAllowed"    # Z

    .prologue
    const-wide/16 v4, 0x3e8

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 23
    iput-boolean p2, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->isWanAllowed:Z

    .line 24
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "forceSubmissionWaitTime"

    const-wide/16 v2, 0x3c

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    mul-long/2addr v0, v4

    iput-wide v0, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->forceSubmissionInterval:J

    .line 25
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getConfiguration()Lcom/amazon/insights/core/configuration/Configuration;

    move-result-object v0

    const-string v1, "backgroundSubmissionWaitTime"

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazon/insights/core/configuration/Configuration;->optLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    mul-long/2addr v0, v4

    iput-wide v0, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->backgroundSubmissionInterval:J

    .line 26
    return-void
.end method


# virtual methods
.method public newBackgroundSubmissionTimePolicy()Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    .locals 4

    .prologue
    .line 40
    new-instance v0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;

    iget-object v1, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->context:Lcom/amazon/insights/core/InsightsContext;

    iget-wide v2, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->backgroundSubmissionInterval:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;-><init>(Lcom/amazon/insights/core/InsightsContext;Ljava/lang/Long;)V

    return-object v0
.end method

.method public newConnectivityPolicy()Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    .locals 3

    .prologue
    .line 30
    new-instance v0, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;

    iget-object v1, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->context:Lcom/amazon/insights/core/InsightsContext;

    iget-boolean v2, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->isWanAllowed:Z

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/delivery/policy/ConnectivityPolicy;-><init>(Lcom/amazon/insights/core/InsightsContext;Z)V

    return-object v0
.end method

.method public newForceSubmissionTimePolicy()Lcom/amazon/insights/delivery/policy/DeliveryPolicy;
    .locals 4

    .prologue
    .line 35
    new-instance v0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;

    iget-object v1, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->context:Lcom/amazon/insights/core/InsightsContext;

    iget-wide v2, p0, Lcom/amazon/insights/delivery/policy/DefaultDeliveryPolicyFactory;->forceSubmissionInterval:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;-><init>(Lcom/amazon/insights/core/InsightsContext;Ljava/lang/Long;)V

    return-object v0
.end method
