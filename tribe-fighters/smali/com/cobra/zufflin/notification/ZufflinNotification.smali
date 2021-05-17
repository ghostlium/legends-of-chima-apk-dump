.class public Lcom/cobra/zufflin/notification/ZufflinNotification;
.super Ljava/lang/Object;
.source "ZufflinNotification.java"


# static fields
.field static notificationIcon:I

.field public static singleton:Lcom/cobra/zufflin/notification/ZufflinNotification;


# instance fields
.field currentNotifications:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field mgr:Landroid/app/AlarmManager;

.field notificationID:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/notification/ZufflinNotification;->singleton:Lcom/cobra/zufflin/notification/ZufflinNotification;

    .line 22
    sget v0, Lcom/cobra/zufflin/R$drawable;->cobra:I

    sput v0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationIcon:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->currentNotifications:Ljava/util/HashMap;

    .line 19
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v0

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Lcom/cobra/zufflin/ZufflinActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    iput-object v0, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->mgr:Landroid/app/AlarmManager;

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationID:I

    .line 31
    sput-object p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->singleton:Lcom/cobra/zufflin/notification/ZufflinNotification;

    .line 32
    return-void
.end method

.method public static setNotificationIcon(I)V
    .locals 0
    .param p0, "i"    # I

    .prologue
    .line 26
    sput p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationIcon:I

    .line 27
    return-void
.end method


# virtual methods
.method public createNotification(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 10
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "seconds"    # I
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "Override"    # Z

    .prologue
    .line 42
    if-eqz p4, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/cobra/zufflin/notification/ZufflinNotification;->removeAllNotifications()V

    .line 47
    :cond_0
    mul-int/lit16 v2, p2, 0x3e8

    .line 52
    .local v2, "milliseconds":I
    new-instance v1, Landroid/content/Intent;

    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v4

    const-class v5, Lcom/cobra/zufflin/notification/ScheduledAction;

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 53
    .local v1, "i":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 54
    .local v0, "extras":Landroid/os/Bundle;
    const-string v4, "title"

    invoke-virtual {v0, v4, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string v4, "message"

    invoke-virtual {v0, v4, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string v4, "ID"

    iget v5, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationID:I

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 57
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 59
    invoke-static {}, Lcom/cobra/zufflin/ZufflinActivity;->getActivity()Lcom/cobra/zufflin/ZufflinActivity;

    move-result-object v4

    iget v5, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationID:I

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v4, v5, v1, v6}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 60
    .local v3, "pi":Landroid/app/PendingIntent;
    iget-object v4, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->mgr:Landroid/app/AlarmManager;

    const/4 v5, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    int-to-long v8, v2

    add-long/2addr v6, v8

    invoke-virtual {v4, v5, v6, v7, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 62
    iget-object v4, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->currentNotifications:Ljava/util/HashMap;

    invoke-virtual {v4, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget v4, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationID:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->notificationID:I

    .line 64
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    sput-object v0, Lcom/cobra/zufflin/notification/ZufflinNotification;->singleton:Lcom/cobra/zufflin/notification/ZufflinNotification;

    .line 37
    return-void
.end method

.method public getNotificationByName(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 80
    iget-object v1, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->currentNotifications:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 82
    .local v0, "found":Z
    return v0
.end method

.method public removeAllNotifications()V
    .locals 4

    .prologue
    .line 88
    iget-object v3, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->mgr:Landroid/app/AlarmManager;

    if-eqz v3, :cond_0

    .line 90
    iget-object v3, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->currentNotifications:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 91
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/app/PendingIntent;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 99
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/app/PendingIntent;>;>;"
    :cond_0
    return-void

    .line 92
    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Landroid/app/PendingIntent;>;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 93
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/app/PendingIntent;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/PendingIntent;

    .line 95
    .local v2, "pi":Landroid/app/PendingIntent;
    iget-object v3, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->mgr:Landroid/app/AlarmManager;

    invoke-virtual {v3, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 96
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method

.method public removeNotificationByName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v1, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->mgr:Landroid/app/AlarmManager;

    if-eqz v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->currentNotifications:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    .line 71
    .local v0, "pi":Landroid/app/PendingIntent;
    if-eqz v0, :cond_0

    .line 72
    iget-object v1, p0, Lcom/cobra/zufflin/notification/ZufflinNotification;->mgr:Landroid/app/AlarmManager;

    invoke-virtual {v1, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 75
    .end local v0    # "pi":Landroid/app/PendingIntent;
    :cond_0
    return-void
.end method
