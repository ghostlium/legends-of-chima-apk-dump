.class public Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;
.super Ljava/lang/Object;
.source "KindleFireSoftkeyBeachballManager.java"


# static fields
.field private static final APK_PACKAGE_NAME:Ljava/lang/String; = "com.amazon.ags.app"

.field private static final SOFTKEY_BAR_WRAPPER_CLASS_NAME:Ljava/lang/String; = "com.amazon.ags.app.util.SoftkeyBarWrapper"

.field private static final SOFTKEY_BAR_WRAPPER_SETUP_METHOD_NAME:Ljava/lang/String; = "setup"

.field private static final TAG:Ljava/lang/String; = "KindleFireSoftkeyBeachballManager"


# instance fields
.field private application:Landroid/app/Application;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .locals 0
    .param p1, "application"    # Landroid/app/Application;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;->application:Landroid/app/Application;

    .line 29
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;->enableSoftKeyButton()V

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;->handleSoftkeyButtonPress()V

    return-void
.end method

.method private enableSoftKeyButton()V
    .locals 11

    .prologue
    .line 34
    :try_start_0
    iget-object v7, p0, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;->application:Landroid/app/Application;

    invoke-virtual {v7}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v8, "com.amazon.ags.app"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 35
    .local v3, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v0, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 36
    .local v0, "apkName":Ljava/lang/String;
    new-instance v5, Ldalvik/system/PathClassLoader;

    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    invoke-direct {v5, v0, v7}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 37
    .local v5, "myClassLoader":Ldalvik/system/PathClassLoader;
    const-string v7, "com.amazon.ags.app.util.SoftkeyBarWrapper"

    const/4 v8, 0x1

    invoke-static {v7, v8, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 38
    .local v1, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v7, "setup"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/app/Application;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-class v10, Landroid/content/BroadcastReceiver;

    aput-object v10, v8, v9

    invoke-virtual {v1, v7, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 39
    .local v6, "setupMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .line 41
    .local v4, "instance":Ljava/lang/Object;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;->application:Landroid/app/Application;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    new-instance v9, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager$1;

    invoke-direct {v9, p0}, Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager$1;-><init>(Lcom/amazon/ags/client/KindleFireSoftkeyBeachballManager;)V

    aput-object v9, v7, v8

    invoke-virtual {v6, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_6

    .line 66
    .end local v0    # "apkName":Ljava/lang/String;
    .end local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "info":Landroid/content/pm/ApplicationInfo;
    .end local v4    # "instance":Ljava/lang/Object;
    .end local v5    # "myClassLoader":Ldalvik/system/PathClassLoader;
    .end local v6    # "setupMethod":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 51
    :catch_0
    move-exception v2

    .line 52
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 53
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v2

    .line 54
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 55
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catch_2
    move-exception v2

    .line 56
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/NoSuchMethodException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 57
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v2

    .line 58
    .local v2, "e":Ljava/lang/InstantiationException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/InstantiationException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 59
    .end local v2    # "e":Ljava/lang/InstantiationException;
    :catch_4
    move-exception v2

    .line 60
    .local v2, "e":Ljava/lang/IllegalAccessException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 61
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_5
    move-exception v2

    .line 62
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 63
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catch_6
    move-exception v2

    .line 64
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v7, "KindleFireSoftkeyBeachballManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to enable softkey button: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private handleSoftkeyButtonPress()V
    .locals 2

    .prologue
    .line 69
    invoke-static {}, Lcom/amazon/ags/api/AmazonGamesClient;->getInstance()Lcom/amazon/ags/api/AmazonGames;

    move-result-object v0

    .line 70
    .local v0, "amazonGames":Lcom/amazon/ags/api/AmazonGames;
    if-eqz v0, :cond_0

    .line 71
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/amazon/ags/api/AmazonGames;->showGameCircle([Ljava/lang/Object;)Lcom/amazon/ags/api/AGResponseHandle;

    .line 73
    :cond_0
    return-void
.end method
