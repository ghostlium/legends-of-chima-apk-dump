.class public Lcom/playhaven/android/push/GCMRegistrationRequest;
.super Ljava/lang/Object;
.source "GCMRegistrationRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deregister(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const-string v0, "com.google.android.c2dm.intent.UNREGISTER"

    invoke-virtual {p0, p1, v0}, Lcom/playhaven/android/push/GCMRegistrationRequest;->send(Landroid/content/Context;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public register(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    const-string v0, "com.google.android.c2dm.intent.REGISTER"

    invoke-virtual {p0, p1, v0}, Lcom/playhaven/android/push/GCMRegistrationRequest;->send(Landroid/content/Context;Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public send(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "which"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 27
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 28
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v2, "Starting %s request."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 30
    .local v1, "registrationIntent":Landroid/content/Intent;
    const-string v2, "app"

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-static {p1, v4, v3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 31
    const-string v2, "sender"

    sget-object v3, Lcom/playhaven/android/PlayHaven$Config;->PushProjectId:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v3}, Lcom/playhaven/android/PlayHaven$Config;->name()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 33
    return-void
.end method
