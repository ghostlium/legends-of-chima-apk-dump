.class public Lcom/prime31/UnityPlayerProxyActivity;
.super Landroid/app/Activity;
.source "UnityPlayerProxyActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 14
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    const/4 v8, 0x2

    new-array v1, v8, [Ljava/lang/String;

    const-string v8, "com.prime31.UnityPlayerActivity"

    aput-object v8, v1, v7

    const-string v8, "com.prime31.UnityPlayerNativeActivity"

    aput-object v8, v1, v6

    .line 23
    .local v1, "classNames":[Ljava/lang/String;
    :try_start_0
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x9

    if-lt v8, v9, :cond_1

    move v5, v6

    .line 24
    .local v5, "supportsNative":Z
    :goto_0
    if-eqz v5, :cond_2

    :goto_1
    aget-object v6, v1, v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 25
    .local v0, "activity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 26
    .local v4, "intent":Landroid/content/Intent;
    const/high16 v6, 0x10000

    invoke-virtual {v4, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 28
    invoke-virtual {p0}, Lcom/prime31/UnityPlayerProxyActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 29
    .local v3, "extras":Landroid/os/Bundle;
    if-eqz v3, :cond_0

    .line 30
    invoke-virtual {v4, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 32
    :cond_0
    invoke-virtual {p0, v4}, Lcom/prime31/UnityPlayerProxyActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    invoke-virtual {p0}, Lcom/prime31/UnityPlayerProxyActivity;->finish()V

    .line 42
    .end local v0    # "activity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "extras":Landroid/os/Bundle;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "supportsNative":Z
    :goto_2
    return-void

    :cond_1
    move v5, v7

    .line 23
    goto :goto_0

    .restart local v5    # "supportsNative":Z
    :cond_2
    move v6, v7

    .line 24
    goto :goto_1

    .line 34
    .end local v5    # "supportsNative":Z
    :catch_0
    move-exception v2

    .line 36
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    invoke-virtual {p0}, Lcom/prime31/UnityPlayerProxyActivity;->finish()V

    goto :goto_2

    .line 39
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v6

    .line 40
    invoke-virtual {p0}, Lcom/prime31/UnityPlayerProxyActivity;->finish()V

    .line 41
    throw v6
.end method
