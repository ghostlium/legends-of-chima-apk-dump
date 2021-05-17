.class public Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;
.super Ljava/lang/Object;
.source "SubmissionTimePolicy.java"

# interfaces
.implements Lcom/amazon/insights/delivery/policy/DeliveryPolicy;


# static fields
.field static final SUBMITTED_TIME_KEY:Ljava/lang/String; = "SubmissionTimePolicy.submissionTime"


# instance fields
.field private final context:Lcom/amazon/insights/core/InsightsContext;

.field private lastSubmittedTime:Ljava/lang/Long;

.field private final waitInterval:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Lcom/amazon/insights/core/InsightsContext;Ljava/lang/Long;)V
    .locals 4
    .param p1, "context"    # Lcom/amazon/insights/core/InsightsContext;
    .param p2, "waitInterval"    # Ljava/lang/Long;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->context:Lcom/amazon/insights/core/InsightsContext;

    .line 19
    iput-object p2, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->waitInterval:Ljava/lang/Long;

    .line 22
    invoke-interface {p1}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v0

    const-string v1, "SubmissionTimePolicy.submissionTime"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/amazon/insights/core/system/Preferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->lastSubmittedTime:Ljava/lang/Long;

    .line 23
    return-void
.end method


# virtual methods
.method public handleDeliveryAttempt(Z)V
    .locals 4
    .param p1, "successful"    # Z

    .prologue
    .line 33
    if-eqz p1, :cond_0

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->lastSubmittedTime:Ljava/lang/Long;

    .line 35
    iget-object v0, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->context:Lcom/amazon/insights/core/InsightsContext;

    invoke-interface {v0}, Lcom/amazon/insights/core/InsightsContext;->getSystem()Lcom/amazon/insights/core/system/System;

    move-result-object v0

    invoke-interface {v0}, Lcom/amazon/insights/core/system/System;->getPreferences()Lcom/amazon/insights/core/system/Preferences;

    move-result-object v0

    const-string v1, "SubmissionTimePolicy.submissionTime"

    iget-object v2, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->lastSubmittedTime:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lcom/amazon/insights/core/system/Preferences;->putLong(Ljava/lang/String;J)V

    .line 37
    :cond_0
    return-void
.end method

.method public isAllowed()Z
    .locals 6

    .prologue
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->lastSubmittedTime:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 28
    .local v0, "timeSinceSubmission":J
    iget-object v2, p0, Lcom/amazon/insights/delivery/policy/SubmissionTimePolicy;->waitInterval:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
