.class public Lcom/playhaven/android/util/TimeZoneFormatter;
.super Ljava/lang/Object;
.source "TimeZoneFormatter.java"


# static fields
.field private static final ONE_HOUR_IN_MS:F = 3600000.0f

.field private static final ONE_MINUTE_IN_MS:F = 60000.0f

.field private static final ONE_SECOND_IN_MS:F = 1000.0f


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static formatTimezone(Ljava/util/TimeZone;)Ljava/lang/String;
    .locals 8
    .param p0, "tz"    # Ljava/util/TimeZone;

    .prologue
    const/4 v4, 0x0

    .line 42
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 43
    .local v2, "now":Ljava/util/Date;
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v5

    int-to-float v5, v5

    const v6, 0x4a5bba00    # 3600000.0f

    div-float v3, v5, v6

    .line 44
    .local v3, "offset":F
    float-to-int v0, v3

    .line 45
    .local v0, "hours":I
    int-to-float v5, v0

    sub-float v5, v3, v5

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-nez v5, :cond_0

    move v1, v4

    .line 46
    .local v1, "minutes":I
    :goto_0
    const-string v5, "%d.%02d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    const/4 v4, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 45
    .end local v1    # "minutes":I
    :cond_0
    const/16 v1, 0x1e

    goto :goto_0
.end method

.method public static getDefaultTimezone()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Lcom/playhaven/android/util/TimeZoneFormatter;->formatTimezone(Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTimezone(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Lcom/playhaven/android/util/TimeZoneFormatter;->formatTimezone(Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
