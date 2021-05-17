.class public Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;
.super Ljava/lang/Object;
.source "ClockSkewSharedPrefs.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/clock/ClockSkewStorage;


# instance fields
.field private final CLOCK_SKEW_KEY:Ljava/lang/String;

.field private final PREFS_NAME:Ljava/lang/String;

.field private final clockSkewSharedPrefs:Landroid/content/SharedPreferences;

.field private final editor:Landroid/content/SharedPreferences$Editor;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-string v0, "ClockSkewSharedPrefs"

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->PREFS_NAME:Ljava/lang/String;

    .line 16
    const-string v0, "clockSkewKey"

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->CLOCK_SKEW_KEY:Ljava/lang/String;

    .line 22
    const-string v0, "ClockSkewSharedPrefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->clockSkewSharedPrefs:Landroid/content/SharedPreferences;

    .line 23
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->clockSkewSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->editor:Landroid/content/SharedPreferences$Editor;

    .line 24
    return-void
.end method


# virtual methods
.method public getClockSkew()J
    .locals 4

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->clockSkewSharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "clockSkewKey"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized setClockSkew(J)V
    .locals 2
    .param p1, "clockSkew"    # J

    .prologue
    .line 33
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->editor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "clockSkewKey"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 34
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/clock/ClockSkewSharedPrefs;->editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    monitor-exit p0

    return-void

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
