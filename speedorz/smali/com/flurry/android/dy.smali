.class final Lcom/flurry/android/dy;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized ao()V
    .locals 4

    .prologue
    .line 71
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 80
    :goto_0
    monitor-exit v1

    return-void

    .line 74
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 75
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 76
    const-string v2, "flurry_last_user_session"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 78
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 71
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized ap()Lcom/flurry/android/AppCloudUser;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 83
    const-class v2, Lcom/flurry/android/dy;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    .line 102
    :cond_0
    :goto_0
    monitor-exit v2

    return-object v0

    .line 86
    :cond_1
    :try_start_1
    new-instance v1, Lcom/flurry/android/AppCloudUser;

    invoke-direct {v1}, Lcom/flurry/android/AppCloudUser;-><init>()V

    .line 88
    invoke-static {}, Lcom/flurry/android/dy;->aq()Ljava/lang/String;

    move-result-object v3

    .line 89
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 90
    invoke-virtual {v1, v3}, Lcom/flurry/android/AppCloudUser;->setId(Ljava/lang/String;)V

    .line 94
    invoke-static {}, Lcom/flurry/android/dy;->ar()Ljava/lang/String;

    move-result-object v0

    .line 95
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 96
    invoke-virtual {v1, v0}, Lcom/flurry/android/AppCloudUser;->setUsername(Ljava/lang/String;)V

    .line 98
    :cond_2
    invoke-static {}, Lcom/flurry/android/dy;->as()Ljava/lang/String;

    move-result-object v0

    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 100
    invoke-virtual {v1, v0}, Lcom/flurry/android/AppCloudUser;->setEmail(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    move-object v0, v1

    .line 102
    goto :goto_0

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0
.end method

.method static declared-synchronized aq()Ljava/lang/String;
    .locals 4

    .prologue
    .line 106
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 107
    const-string v0, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :goto_0
    monitor-exit v1

    return-object v0

    .line 109
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 110
    const-string v2, "flurry_last_user_id"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized ar()Ljava/lang/String;
    .locals 4

    .prologue
    .line 117
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 118
    const-string v0, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    :goto_0
    monitor-exit v1

    return-object v0

    .line 120
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 121
    const-string v2, "flurry_last_user_name"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized as()Ljava/lang/String;
    .locals 4

    .prologue
    .line 128
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 129
    const-string v0, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    :goto_0
    monitor-exit v1

    return-object v0

    .line 131
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 132
    const-string v2, "flurry_last_user_email"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized at()Ljava/lang/String;
    .locals 4

    .prologue
    .line 139
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 140
    const-string v0, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    :goto_0
    monitor-exit v1

    return-object v0

    .line 142
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 143
    const-string v2, "flurry_last_user_pass"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized au()Ljava/lang/String;
    .locals 5

    .prologue
    .line 150
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 151
    const-string v0, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    :goto_0
    monitor-exit v1

    return-object v0

    .line 153
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 154
    const-string v2, "flurry_last_user_session"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 155
    const-string v2, "AppCloudUserHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "User Session = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 150
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 42
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 56
    :goto_0
    monitor-exit v1

    return-void

    .line 45
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 46
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 47
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 48
    const-string v2, "flurry_last_user_name"

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 49
    :cond_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 50
    const-string v2, "flurry_last_user_email"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 51
    :cond_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 52
    const-string v2, "flurry_last_user_session"

    invoke-interface {v0, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 54
    :cond_3
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 55
    const-string v0, "AppCloudUserHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveLastLoggedInUserData, (Name, Email, Token) = ( "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " , "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " , "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " )"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static f(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 26
    sput-object p0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    .line 27
    return-void
.end method

.method static declared-synchronized y(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 30
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 39
    :goto_0
    monitor-exit v1

    return-void

    .line 33
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 34
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 35
    const-string v2, "flurry_last_user_id"

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 36
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 38
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/flurry/android/FlurryAppCloud;->e(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized z(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 59
    const-class v1, Lcom/flurry/android/dy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 68
    :goto_0
    monitor-exit v1

    return-void

    .line 62
    :cond_0
    :try_start_1
    sget-object v0, Lcom/flurry/android/dy;->mContext:Landroid/content/Context;

    const-string v2, "FLURRY_SHARED_PREFERENCES"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 63
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 65
    const-string v2, "flurry_last_user_pass"

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 67
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
