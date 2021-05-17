.class public Lcom/amazon/ags/constants/nonjs/MetricsParserConstants;
.super Ljava/lang/Object;
.source "MetricsParserConstants.java"


# static fields
.field public static final COUNT_METRIC_KEY_PREFIX:Ljava/lang/String; = "Count"

.field public static final METRIC_KEY_PREFIX_DELIMITER:Ljava/lang/String; = "::"

.field public static final TIME_METRIC_KEY_PREFIX:Ljava/lang/String; = "Time"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertCountKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "countKey"    # Ljava/lang/String;

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Count::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertTimeKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "timeKey"    # Ljava/lang/String;

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Time::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
