.class public final Lcom/unity3d/plugin/downloader/b/y;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unity3d/plugin/downloader/b/j;


# instance fields
.field a:Ljava/lang/CharSequence;

.field b:Ljava/lang/CharSequence;

.field c:I

.field d:J

.field e:J

.field f:J

.field g:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v0, p0, Lcom/unity3d/plugin/downloader/b/y;->d:J

    iput-wide v0, p0, Lcom/unity3d/plugin/downloader/b/y;->e:J

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/app/Notification;
    .locals 8

    const/16 v7, 0x8

    const/4 v6, 0x1

    const/4 v5, 0x0

    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/y;->a:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    iget-wide v1, p0, Lcom/unity3d/plugin/downloader/b/y;->d:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    const-wide/16 v1, -0x1

    iget-wide v3, p0, Lcom/unity3d/plugin/downloader/b/y;->e:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/unity3d/plugin/downloader/b/y;->d:J

    shr-long/2addr v1, v7

    long-to-int v1, v1

    iget-wide v2, p0, Lcom/unity3d/plugin/downloader/b/y;->e:J

    shr-long/2addr v2, v7

    long-to-int v2, v2

    invoke-virtual {v0, v1, v2, v5}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    :goto_0
    iget-wide v1, p0, Lcom/unity3d/plugin/downloader/b/y;->e:J

    iget-wide v3, p0, Lcom/unity3d/plugin/downloader/b/y;->d:J

    invoke-static {v1, v2, v3, v4}, Lcom/unity3d/plugin/downloader/a/m;->a(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const-string v1, "time_remaining_notification"

    invoke-static {p1, v1}, Lcom/unity3d/plugin/downloader/a/m;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    new-array v2, v6, [Ljava/lang/Object;

    iget-wide v3, p0, Lcom/unity3d/plugin/downloader/b/y;->f:J

    invoke-static {v3, v4}, Lcom/unity3d/plugin/downloader/a/m;->a(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    iget v1, p0, Lcom/unity3d/plugin/downloader/b/y;->c:I

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/unity3d/plugin/downloader/b/y;->c:I

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    :goto_1
    invoke-virtual {v0, v6}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/y;->b:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    iget-object v1, p0, Lcom/unity3d/plugin/downloader/b/y;->g:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    invoke-virtual {v0, v6}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {v0, v5, v5, v6}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    goto :goto_0

    :cond_1
    const v1, 0x1080081

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    goto :goto_1
.end method

.method public final a()V
    .locals 1

    const v0, 0x1080081

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/y;->c:I

    return-void
.end method

.method public final a(J)V
    .locals 0

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/y;->d:J

    return-void
.end method

.method public final a(Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/y;->g:Landroid/app/PendingIntent;

    return-void
.end method

.method public final a(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/y;->a:Ljava/lang/CharSequence;

    return-void
.end method

.method public final b(J)V
    .locals 0

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/y;->e:J

    return-void
.end method

.method public final b(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/y;->b:Ljava/lang/CharSequence;

    return-void
.end method

.method public final c(J)V
    .locals 0

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/y;->f:J

    return-void
.end method
