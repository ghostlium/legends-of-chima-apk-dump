.class public Lcom/amazon/insights/core/util/DateUtil;
.super Ljava/lang/Object;
.source "DateUtil.java"


# static fields
.field private static final DATE_FORMAT_STRING:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

.field private static final ISO_DATE_FORMATTER_UTC:Ljava/text/DateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 19
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/amazon/insights/core/util/DateUtil;->ISO_DATE_FORMATTER_UTC:Ljava/text/DateFormat;

    .line 20
    sget-object v0, Lcom/amazon/insights/core/util/DateUtil;->ISO_DATE_FORMATTER_UTC:Ljava/text/DateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 21
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createLocaleIndependentDateFormatter(Ljava/lang/String;)Ljava/text/DateFormat;
    .locals 2
    .param p0, "dateFormatString"    # Ljava/lang/String;

    .prologue
    .line 41
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, p0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    return-object v0
.end method

.method private static declared-synchronized getDateFormat()Ljava/text/DateFormat;
    .locals 2

    .prologue
    .line 28
    const-class v0, Lcom/amazon/insights/core/util/DateUtil;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/amazon/insights/core/util/DateUtil;->ISO_DATE_FORMATTER_UTC:Ljava/text/DateFormat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized isoDateFromMillis(J)Ljava/lang/String;
    .locals 3
    .param p0, "millis"    # J

    .prologue
    .line 32
    const-class v1, Lcom/amazon/insights/core/util/DateUtil;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/amazon/insights/core/util/DateUtil;->getDateFormat()Ljava/text/DateFormat;

    move-result-object v0

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
