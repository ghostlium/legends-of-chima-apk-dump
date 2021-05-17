.class public Lcom/playhaven/android/push/NotificationBuilder;
.super Ljava/lang/Object;
.source "NotificationBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/push/NotificationBuilder$Keys;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/playhaven/android/push/NotificationBuilder;->mContext:Landroid/content/Context;

    .line 37
    return-void
.end method


# virtual methods
.method public makeNotification(Landroid/os/Bundle;Landroid/app/PendingIntent;)Landroid/app/Notification;
    .locals 4
    .param p1, "extras"    # Landroid/os/Bundle;
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;

    .prologue
    .line 44
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Landroid/os/Bundle;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_1

    .line 45
    :cond_0
    new-instance v2, Lcom/playhaven/android/PlayHavenException;

    invoke-direct {v2}, Lcom/playhaven/android/PlayHavenException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "Unable to create Notification from intent."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/playhaven/android/PlayHaven;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    const/4 v2, 0x0

    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-object v2

    .line 47
    :cond_1
    :try_start_1
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    iget-object v2, p0, Lcom/playhaven/android/push/NotificationBuilder;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 48
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    sget-object v2, Lcom/playhaven/android/push/NotificationBuilder$Keys;->TITLE:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v2}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 49
    sget-object v2, Lcom/playhaven/android/push/NotificationBuilder$Keys;->TEXT:Lcom/playhaven/android/push/NotificationBuilder$Keys;

    invoke-virtual {v2}, Lcom/playhaven/android/push/NotificationBuilder$Keys;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 50
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 51
    iget-object v2, p0, Lcom/playhaven/android/push/NotificationBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 52
    invoke-virtual {v0, p2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 53
    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->getNotification()Landroid/app/Notification;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    goto :goto_0
.end method
