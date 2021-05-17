.class public Lcom/amazon/ags/client/whispersync/clock/ClockUtil;
.super Ljava/lang/Object;
.source "ClockUtil.java"


# static fields
.field private static theClock:Lcom/amazon/ags/client/whispersync/clock/Clock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    new-instance v0, Lcom/amazon/ags/client/whispersync/clock/LocalClock;

    invoke-direct {v0}, Lcom/amazon/ags/client/whispersync/clock/LocalClock;-><init>()V

    sput-object v0, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->theClock:Lcom/amazon/ags/client/whispersync/clock/Clock;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public static getCurrentTime()J
    .locals 2

    .prologue
    .line 19
    sget-object v0, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->theClock:Lcom/amazon/ags/client/whispersync/clock/Clock;

    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/clock/Clock;->getCurrentTimeSeconds()J

    move-result-wide v0

    return-wide v0
.end method

.method public static setGlobalClock(Lcom/amazon/ags/client/whispersync/clock/Clock;)V
    .locals 0
    .param p0, "clock"    # Lcom/amazon/ags/client/whispersync/clock/Clock;

    .prologue
    .line 27
    sput-object p0, Lcom/amazon/ags/client/whispersync/clock/ClockUtil;->theClock:Lcom/amazon/ags/client/whispersync/clock/Clock;

    .line 28
    return-void
.end method
