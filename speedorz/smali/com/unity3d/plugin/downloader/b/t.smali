.class final Lcom/unity3d/plugin/downloader/b/t;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unity3d/plugin/downloader/c/n;


# instance fields
.field final synthetic a:Lcom/unity3d/plugin/downloader/c/b;

.field final synthetic b:Lcom/unity3d/plugin/downloader/b/s;


# direct methods
.method constructor <init>(Lcom/unity3d/plugin/downloader/b/s;Lcom/unity3d/plugin/downloader/c/b;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iput-object p2, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 12

    const/16 v11, 0xc8

    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-virtual {v0}, Lcom/unity3d/plugin/downloader/c/b;->b()I

    move-result v3

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/u;->a(Landroid/content/Context;)Lcom/unity3d/plugin/downloader/b/u;

    move-result-object v4

    if-eqz v3, :cond_3

    move v2, v1

    move v0, v1

    :goto_0
    if-ge v2, v3, :cond_4

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-virtual {v5, v2}, Lcom/unity3d/plugin/downloader/c/b;->b(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    new-instance v6, Lcom/unity3d/plugin/downloader/b/h;

    iget-object v7, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v7, v7, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    invoke-direct {v6, v2, v5}, Lcom/unity3d/plugin/downloader/b/h;-><init>(ILjava/lang/String;)V

    iget-object v7, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-virtual {v7, v2}, Lcom/unity3d/plugin/downloader/c/b;->c(I)J

    move-result-wide v7

    iget-object v9, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v9, v9, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v9, v4, v5, v7, v8}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/u;Ljava/lang/String;J)Z

    move-result v5

    if-eqz v5, :cond_1

    or-int/lit8 v0, v0, -0x1

    const-wide/16 v9, 0x0

    iput-wide v9, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    const-string v5, ""

    iput-object v5, v6, Lcom/unity3d/plugin/downloader/b/h;->d:Ljava/lang/String;

    const-wide/16 v9, 0x0

    iput-wide v9, v6, Lcom/unity3d/plugin/downloader/b/h;->g:J

    const/4 v5, 0x0

    iput v5, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    const/4 v5, 0x0

    iput v5, v6, Lcom/unity3d/plugin/downloader/b/h;->i:I

    const/4 v5, 0x0

    iput v5, v6, Lcom/unity3d/plugin/downloader/b/h;->j:I

    const/4 v5, 0x0

    iput v5, v6, Lcom/unity3d/plugin/downloader/b/h;->k:I

    const/4 v5, 0x0

    iput v5, v6, Lcom/unity3d/plugin/downloader/b/h;->l:I

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-virtual {v5, v2}, Lcom/unity3d/plugin/downloader/c/b;->a(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v6, Lcom/unity3d/plugin/downloader/b/h;->a:Ljava/lang/String;

    iput-wide v7, v6, Lcom/unity3d/plugin/downloader/b/h;->e:J

    iput v0, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    invoke-virtual {v4, v6}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z

    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v5, v6, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/unity3d/plugin/downloader/b/u;->a(Ljava/lang/String;)Lcom/unity3d/plugin/downloader/b/h;

    move-result-object v5

    if-nez v5, :cond_2

    const-string v5, "LVLDL"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "file "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, v6, Lcom/unity3d/plugin/downloader/b/h;->c:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " found. Not downloading."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v5, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v5, 0xc8

    iput v5, v6, Lcom/unity3d/plugin/downloader/b/h;->h:I

    iput-wide v7, v6, Lcom/unity3d/plugin/downloader/b/h;->e:J

    iput-wide v7, v6, Lcom/unity3d/plugin/downloader/b/h;->f:J

    iget-object v5, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-virtual {v5, v2}, Lcom/unity3d/plugin/downloader/c/b;->a(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v6, Lcom/unity3d/plugin/downloader/b/h;->a:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    throw v0

    :cond_2
    :try_start_1
    iget v6, v5, Lcom/unity3d/plugin/downloader/b/h;->h:I

    if-eq v6, v11, :cond_0

    iget-object v6, p0, Lcom/unity3d/plugin/downloader/b/t;->a:Lcom/unity3d/plugin/downloader/c/b;

    invoke-virtual {v6, v2}, Lcom/unity3d/plugin/downloader/c/b;->a(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/unity3d/plugin/downloader/b/h;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/unity3d/plugin/downloader/b/u;->b(Lcom/unity3d/plugin/downloader/b/h;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    or-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    move v0, v1

    :cond_4
    :try_start_2
    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v2, v2, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v3, v3, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v4, v2, v0}, Lcom/unity3d/plugin/downloader/b/u;->a(II)Z

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v2, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v2, v2, Lcom/unity3d/plugin/downloader/b/s;->a:Landroid/content/Context;

    iget-object v3, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v3, v3, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v3}, Lcom/unity3d/plugin/downloader/b/p;->b(Lcom/unity3d/plugin/downloader/b/p;)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_2
    invoke-static {v1}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    return-void

    :pswitch_0
    :try_start_3
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;

    move-result-object v0

    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_4
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Error with getting information from package name"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :pswitch_1
    :try_start_5
    const-string v0, "LVLDL"

    const-string v2, "In LVL checking loop!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;

    move-result-object v0

    const/16 v2, 0xf

    invoke-virtual {v0, v2}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Error with LVL checking and database integrity"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final a(I)V
    .locals 3

    const/4 v2, 0x0

    sparse-switch p1, :sswitch_data_0

    :goto_0
    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    return-void

    :sswitch_0
    :try_start_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;

    move-result-object v0

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    throw v0

    :sswitch_1
    :try_start_1
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x123 -> :sswitch_1
        0x231 -> :sswitch_0
    .end sparse-switch
.end method

.method public final b()V
    .locals 3

    const/4 v2, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/unity3d/plugin/downloader/b/t;->b:Lcom/unity3d/plugin/downloader/b/s;

    iget-object v0, v0, Lcom/unity3d/plugin/downloader/b/s;->b:Lcom/unity3d/plugin/downloader/b/p;

    invoke-static {v0}, Lcom/unity3d/plugin/downloader/b/p;->a(Lcom/unity3d/plugin/downloader/b/p;)Lcom/unity3d/plugin/downloader/b/i;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/unity3d/plugin/downloader/b/i;->a(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    return-void

    :catchall_0
    move-exception v0

    invoke-static {v2}, Lcom/unity3d/plugin/downloader/b/p;->a(Z)V

    throw v0
.end method
