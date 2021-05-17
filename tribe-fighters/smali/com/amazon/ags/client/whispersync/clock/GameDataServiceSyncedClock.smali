.class public Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;
.super Ljava/lang/Object;
.source "GameDataServiceSyncedClock.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/clock/Clock;


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whipsersync"


# instance fields
.field private final clockSkewStorage:Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;

.field private final localClock:Lcom/amazon/ags/client/whispersync/clock/Clock;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/clock/Clock;Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;)V
    .locals 0
    .param p1, "localClock"    # Lcom/amazon/ags/client/whispersync/clock/Clock;
    .param p2, "clockSkewStorage"    # Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->localClock:Lcom/amazon/ags/client/whispersync/clock/Clock;

    .line 25
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->clockSkewStorage:Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;

    .line 26
    return-void
.end method

.method private getCurrentLocalTimeSeconds()J
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->localClock:Lcom/amazon/ags/client/whispersync/clock/Clock;

    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/clock/Clock;->getCurrentTimeSeconds()J

    move-result-wide v0

    return-wide v0
.end method

.method private parseServerTime(Ljava/lang/String;)J
    .locals 6
    .param p1, "currentServerTime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE, dd MMM yyyy HH:mm:ss z"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 60
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 61
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x1

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    div-long/2addr v1, v3

    return-wide v1
.end method


# virtual methods
.method public getCurrentTimeSeconds()J
    .locals 4

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->getCurrentLocalTimeSeconds()J

    move-result-wide v0

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->clockSkewStorage:Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;

    invoke-interface {v2}, Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;->getClockSkew()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public synchronizeClock(Ljava/lang/String;)V
    .locals 10
    .param p1, "currentServerTime"    # Ljava/lang/String;

    .prologue
    .line 38
    if-nez p1, :cond_0

    .line 39
    const-string v7, "GC_Whipsersync"

    const-string v8, "Received a null date from the service, cannot synchronize with server clock"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :goto_0
    return-void

    .line 44
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->parseServerTime(Ljava/lang/String;)J

    move-result-wide v2

    .line 45
    .local v2, "currentServerTimeSeconds":J
    invoke-direct {p0}, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->getCurrentLocalTimeSeconds()J

    move-result-wide v0

    .line 46
    .local v0, "currentLocalTimeSeconds":J
    sub-long v5, v0, v2

    .line 47
    .local v5, "newClockSkew":J
    iget-object v7, p0, Lcom/amazon/ags/client/whispersync/clock/GameDataServiceSyncedClock;->clockSkewStorage:Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;

    invoke-interface {v7, v5, v6}, Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;->setClockSkew(J)V

    .line 48
    const-string v7, "GC_Whipsersync"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Measured clock skew as: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 49
    .end local v0    # "currentLocalTimeSeconds":J
    .end local v2    # "currentServerTimeSeconds":J
    .end local v5    # "newClockSkew":J
    :catch_0
    move-exception v4

    .line 50
    .local v4, "e":Ljava/text/ParseException;
    const-string v7, "GC_Whipsersync"

    const-string v8, "Failed to synchronize with server clock, received an invalid date format"

    invoke-static {v7, v8, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
