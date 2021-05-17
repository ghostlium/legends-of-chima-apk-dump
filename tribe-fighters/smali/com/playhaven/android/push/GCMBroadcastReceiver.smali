.class public Lcom/playhaven/android/push/GCMBroadcastReceiver;
.super Lcom/playhaven/android/push/PushReceiver;
.source "GCMBroadcastReceiver.java"


# static fields
.field public static final C2DM_RECEIVE:Ljava/lang/String; = "com.google.android.c2dm.intent.RECEIVE"

.field public static final C2DM_REGISTER:Ljava/lang/String; = "com.google.android.c2dm.intent.REGISTER"

.field public static final C2DM_REGISTRATION:Ljava/lang/String; = "com.google.android.c2dm.intent.REGISTRATION"

.field public static final C2DM_UNREGISTER:Ljava/lang/String; = "com.google.android.c2dm.intent.UNREGISTER"

.field public static final ERROR:Ljava/lang/String; = "error"

.field public static final REGID:Ljava/lang/String; = "registration_id"

.field public static final SERVICE_NOT_AVAILABLE:Ljava/lang/String; = "SERVICE_NOT_AVAILABLE"

.field public static final UNREGISTERED:Ljava/lang/String; = "unregistered"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/playhaven/android/push/PushReceiver;-><init>()V

    return-void
.end method

.method private registration(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 57
    const-string v6, "registration_id"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 58
    .local v3, "registrationId":Ljava/lang/String;
    const-string v6, "error"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "error":Ljava/lang/String;
    const-string v6, "unregistered"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 61
    .local v5, "unregistered":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 62
    invoke-static {p2}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 63
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 64
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v6, "registration_id"

    invoke-interface {v0, v6, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 65
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 68
    new-instance v4, Lcom/playhaven/android/req/PushTrackingRequest;

    invoke-direct {v4, v3, v7, v7}, Lcom/playhaven/android/req/PushTrackingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .local v4, "trackingRequest":Lcom/playhaven/android/req/PushTrackingRequest;
    invoke-virtual {v4, p2}, Lcom/playhaven/android/req/PushTrackingRequest;->send(Landroid/content/Context;)V

    .line 72
    .end local v0    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "pref":Landroid/content/SharedPreferences;
    .end local v4    # "trackingRequest":Lcom/playhaven/android/req/PushTrackingRequest;
    :cond_0
    if-eqz v5, :cond_1

    .line 74
    invoke-static {p2}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 75
    .restart local v2    # "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 76
    .restart local v0    # "edit":Landroid/content/SharedPreferences$Editor;
    const-string v6, "registration_id"

    invoke-interface {v0, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 77
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 80
    new-instance v4, Lcom/playhaven/android/req/PushTrackingRequest;

    const-string v6, ""

    invoke-direct {v4, v6, v7, v7}, Lcom/playhaven/android/req/PushTrackingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .restart local v4    # "trackingRequest":Lcom/playhaven/android/req/PushTrackingRequest;
    invoke-virtual {v4, p2}, Lcom/playhaven/android/req/PushTrackingRequest;->send(Landroid/content/Context;)V

    .line 83
    const-string v6, "GCM has unregistered this application: %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v5, v7, v8

    invoke-static {v6, v7}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 87
    .end local v0    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "pref":Landroid/content/SharedPreferences;
    .end local v4    # "trackingRequest":Lcom/playhaven/android/req/PushTrackingRequest;
    :cond_1
    if-eqz v1, :cond_2

    .line 88
    const-string v6, "SERVICE_NOT_AVAILABLE"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 89
    const-string v6, "GCM registration service unavailable."

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v6, v7}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    :cond_2
    :goto_0
    return-void

    .line 91
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "GCM registration error: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v6, v7}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/playhaven/android/push/GCMBroadcastReceiver;->mContext:Landroid/content/Context;

    .line 41
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, p0, Lcom/playhaven/android/push/GCMBroadcastReceiver;->mBundle:Landroid/os/Bundle;

    .line 43
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "action":Ljava/lang/String;
    const-string v1, "Received broadcast: %s."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/playhaven/android/PlayHaven;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 46
    const-string v1, "com.google.android.c2dm.intent.REGISTRATION"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 47
    invoke-direct {p0, p2, p1}, Lcom/playhaven/android/push/GCMBroadcastReceiver;->registration(Landroid/content/Intent;Landroid/content/Context;)V

    .line 51
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    const-string v1, "com.google.android.c2dm.intent.RECEIVE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    invoke-virtual {p0, p2, p1}, Lcom/playhaven/android/push/GCMBroadcastReceiver;->interpretPush(Landroid/content/Intent;Landroid/content/Context;)V

    goto :goto_0
.end method
