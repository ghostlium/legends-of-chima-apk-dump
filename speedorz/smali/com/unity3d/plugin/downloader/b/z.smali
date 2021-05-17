.class public final Lcom/unity3d/plugin/downloader/b/z;
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

.field h:Landroid/app/Notification;


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v0, p0, Lcom/unity3d/plugin/downloader/b/z;->d:J

    iput-wide v0, p0, Lcom/unity3d/plugin/downloader/b/z;->e:J

    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    iput-object v0, p0, Lcom/unity3d/plugin/downloader/b/z;->h:Landroid/app/Notification;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/app/Notification;
    .locals 12

    const/16 v9, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/z;->h:Landroid/app/Notification;

    iget v0, p0, Lcom/unity3d/plugin/downloader/b/z;->c:I

    iput v0, v3, Landroid/app/Notification;->icon:I

    iget v0, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, v3, Landroid/app/Notification;->flags:I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xa

    if-le v0, v4, :cond_0

    iget v0, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, v3, Landroid/app/Notification;->flags:I

    :cond_0
    new-instance v4, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v5, "status_bar_ongoing_event_progress_bar"

    invoke-static {p1, v5}, Lcom/unity3d/plugin/downloader/a/m;->c(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    invoke-direct {v4, v0, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const-string v0, "title"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/z;->a:Ljava/lang/CharSequence;

    invoke-virtual {v4, v0, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v0, "description"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4, v0, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const-string v0, "description"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iget-wide v5, p0, Lcom/unity3d/plugin/downloader/b/z;->e:J

    iget-wide v7, p0, Lcom/unity3d/plugin/downloader/b/z;->d:J

    invoke-static {v5, v6, v7, v8}, Lcom/unity3d/plugin/downloader/a/m;->a(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v0, "progress_bar_frame"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4, v0, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const-string v0, "progress_bar"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    iget-wide v6, p0, Lcom/unity3d/plugin/downloader/b/z;->d:J

    shr-long/2addr v6, v9

    long-to-int v6, v6

    iget-wide v7, p0, Lcom/unity3d/plugin/downloader/b/z;->e:J

    shr-long/2addr v7, v9

    long-to-int v7, v7

    iget-wide v8, p0, Lcom/unity3d/plugin/downloader/b/z;->d:J

    const-wide/16 v10, 0x0

    cmp-long v0, v8, v10

    if-gtz v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v4, v5, v6, v7, v0}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    const-string v0, "time_remaining"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v4, v0, v2}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const-string v0, "time_remaining"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const-string v5, "time_remaining_notification"

    invoke-static {p1, v5}, Lcom/unity3d/plugin/downloader/a/m;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/unity3d/plugin/downloader/b/z;->f:J

    invoke-static {v6, v7}, Lcom/unity3d/plugin/downloader/a/m;->a(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v1, v2

    invoke-virtual {p1, v5, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v0, "progress_text"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iget-wide v1, p0, Lcom/unity3d/plugin/downloader/b/z;->e:J

    iget-wide v5, p0, Lcom/unity3d/plugin/downloader/b/z;->d:J

    invoke-static {v1, v2, v5, v6}, Lcom/unity3d/plugin/downloader/a/m;->b(JJ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v0, "appIcon"

    invoke-static {p1, v0}, Lcom/unity3d/plugin/downloader/a/m;->d(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iget v1, p0, Lcom/unity3d/plugin/downloader/b/z;->c:I

    invoke-virtual {v4, v0, v1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    iput-object v4, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/z;->g:Landroid/app/PendingIntent;

    iput-object v0, v3, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    return-object v3

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method public final a()V
    .locals 1

    const v0, 0x1080081

    iput v0, p0, Lcom/unity3d/plugin/downloader/b/z;->c:I

    return-void
.end method

.method public final a(J)V
    .locals 0

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/z;->d:J

    return-void
.end method

.method public final a(Landroid/app/PendingIntent;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/z;->g:Landroid/app/PendingIntent;

    return-void
.end method

.method public final a(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/z;->a:Ljava/lang/CharSequence;

    return-void
.end method

.method public final b(J)V
    .locals 0

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/z;->e:J

    return-void
.end method

.method public final b(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/z;->b:Ljava/lang/CharSequence;

    return-void
.end method

.method public final c(J)V
    .locals 0

    iput-wide p1, p0, Lcom/unity3d/plugin/downloader/b/z;->f:J

    return-void
.end method
