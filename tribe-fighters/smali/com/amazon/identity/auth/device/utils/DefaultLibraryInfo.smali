.class public abstract Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;
.super Ljava/lang/Object;
.source "DefaultLibraryInfo.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    const-class v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->TAG:Ljava/lang/String;

    .line 9
    sget-object v0, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->NO_FORCE:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    sput-object v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getOverrideLibraryState()Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;
    .locals 2

    .prologue
    .line 18
    const-class v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized isProd()Z
    .locals 3

    .prologue
    .line 13
    const-class v1, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    sget-object v2, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->FORCE_PROD:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    if-eq v0, v2, :cond_0

    sget-object v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    sget-object v2, Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;->NO_FORCE:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v2, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized setOverrideAppState(Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;)V
    .locals 4
    .param p0, "state"    # Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    .prologue
    .line 26
    const-class v1, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;

    monitor-enter v1

    :try_start_0
    sput-object p0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    .line 27
    sget-object v0, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "App State overwritten : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/amazon/identity/auth/device/utils/DefaultLibraryInfo;->eState:Lcom/amazon/identity/auth/device/AccountManagerConstants$OVERIDE_APP_STATE;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    monitor-exit v1

    return-void

    .line 26
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
