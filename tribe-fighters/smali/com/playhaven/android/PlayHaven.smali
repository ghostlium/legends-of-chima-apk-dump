.class public Lcom/playhaven/android/PlayHaven;
.super Ljava/lang/Object;
.source "PlayHaven.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/playhaven/android/PlayHaven$Config;,
        Lcom/playhaven/android/PlayHaven$ConnectionType;,
        Lcom/playhaven/android/PlayHaven$LogName;
    }
.end annotation


# static fields
.field public static final ACTION_ACTIVITY:Ljava/lang/String; = "activity"

.field public static final ACTION_CONTENT_UNIT:Ljava/lang/String; = "content_id"

.field public static final ACTION_PLACEMENT:Ljava/lang/String; = "placement"

.field private static final SHARED_PREF_MODE:I = 0x0

.field private static final SHARED_PREF_NAME:Ljava/lang/String;

.field public static final TAG:Ljava/lang/String;

.field public static final URI_SCHEME:Ljava/lang/String; = "playhaven"

.field private static cachedCompat:Lcom/playhaven/android/compat/VendorCompat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-class v0, Lcom/playhaven/android/PlayHaven;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    .line 81
    const-class v0, Lcom/playhaven/android/PlayHaven;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/playhaven/android/PlayHaven;->SHARED_PREF_NAME:Ljava/lang/String;

    .line 772
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static configure(Landroid/content/Context;II)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "tokenResourceId"    # I
    .param p2, "secretResourceId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 216
    .local v0, "resources":Landroid/content/res/Resources;
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p0, v1, v2, v3}, Lcom/playhaven/android/PlayHaven;->configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method public static configure(Landroid/content/Context;III)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "tokenResourceId"    # I
    .param p2, "secretResourceId"    # I
    .param p3, "projectId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 232
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 233
    .local v0, "resources":Landroid/content/res/Resources;
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v1, v2, v3}, Lcom/playhaven/android/PlayHaven;->configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method public static configure(Landroid/content/Context;Ljava/lang/String;)V
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 339
    if-eqz p1, :cond_0

    const-string v8, "http"

    invoke-virtual {p1, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 341
    new-instance v0, Lcom/playhaven/android/cache/Cache;

    invoke-direct {v0, p0}, Lcom/playhaven/android/cache/Cache;-><init>(Landroid/content/Context;)V

    .line 342
    .local v0, "cache":Lcom/playhaven/android/cache/Cache;
    new-instance v3, Lcom/playhaven/android/PlayHaven$1;

    invoke-direct {v3, p0}, Lcom/playhaven/android/PlayHaven$1;-><init>(Landroid/content/Context;)V

    .line 364
    .local v3, "handler":Lcom/playhaven/android/cache/CacheResponseHandler;
    :try_start_0
    invoke-virtual {v0, p1, v3}, Lcom/playhaven/android/cache/Cache;->request(Ljava/lang/String;Lcom/playhaven/android/cache/CacheResponseHandler;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    .end local v0    # "cache":Lcom/playhaven/android/cache/Cache;
    .end local v3    # "handler":Lcom/playhaven/android/cache/CacheResponseHandler;
    :goto_0
    return-void

    .line 366
    .restart local v0    # "cache":Lcom/playhaven/android/cache/Cache;
    .restart local v3    # "handler":Lcom/playhaven/android/cache/CacheResponseHandler;
    :catch_0
    move-exception v1

    .line 367
    .local v1, "e":Ljava/net/MalformedURLException;
    new-instance v8, Lcom/playhaven/android/PlayHavenException;

    const-string v9, "Failed to configure PlayHaven"

    invoke-direct {v8, v9, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 372
    .end local v0    # "cache":Lcom/playhaven/android/cache/Cache;
    .end local v1    # "e":Ljava/net/MalformedURLException;
    .end local v3    # "handler":Lcom/playhaven/android/cache/CacheResponseHandler;
    :cond_0
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->defaultConfiguration(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 376
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    :try_start_1
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 378
    .local v6, "p":Ljava/util/Properties;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x9

    if-lt v8, v9, :cond_3

    .line 380
    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/util/Properties;->load(Ljava/io/Reader;)V

    .line 381
    invoke-virtual {v6}, Ljava/util/Properties;->stringPropertyNames()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_2

    .line 401
    :cond_1
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 410
    const-string v8, "PlayHaven initialized: %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    sget-object v11, Lcom/playhaven/android/Version;->BANNER:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Lcom/playhaven/android/PlayHaven;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 411
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->debugConfig(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 412
    .end local v6    # "p":Ljava/util/Properties;
    :catch_1
    move-exception v1

    .line 413
    .local v1, "e":Ljava/lang/Exception;
    new-instance v8, Lcom/playhaven/android/PlayHavenException;

    const-string v9, "Failed to configure PlayHaven"

    invoke-direct {v8, v9, v1}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 381
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v6    # "p":Ljava/util/Properties;
    :cond_2
    :try_start_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 383
    .local v4, "key":Ljava/lang/String;
    invoke-static {v4}, Lcom/playhaven/android/PlayHaven$Config;->valueOf(Ljava/lang/String;)Lcom/playhaven/android/PlayHaven$Config;

    move-result-object v7

    .line 384
    .local v7, "param":Lcom/playhaven/android/PlayHaven$Config;
    invoke-virtual {v7}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v2, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    .line 389
    .end local v4    # "key":Ljava/lang/String;
    .end local v7    # "param":Lcom/playhaven/android/PlayHaven$Config;
    :cond_3
    new-instance v8, Ljava/io/BufferedInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v6, v8}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 391
    invoke-virtual {v6}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v5

    .line 392
    .local v5, "keys":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 394
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 395
    .restart local v4    # "key":Ljava/lang/String;
    invoke-static {v4}, Lcom/playhaven/android/PlayHaven$Config;->valueOf(Ljava/lang/String;)Lcom/playhaven/android/PlayHaven$Config;

    move-result-object v7

    .line 396
    .restart local v7    # "param":Lcom/playhaven/android/PlayHaven$Config;
    invoke-virtual {v7}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2
.end method

.method public static configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "secret"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 285
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/playhaven/android/PlayHaven;->configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    return-void
.end method

.method public static configure(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "secret"    # Ljava/lang/String;
    .param p3, "projectId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 302
    invoke-static {p1}, Lcom/playhaven/android/PlayHaven;->validateToken(Ljava/lang/String;)V

    .line 303
    invoke-static {p2}, Lcom/playhaven/android/PlayHaven;->validateSecret(Ljava/lang/String;)V

    .line 306
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->defaultConfiguration(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 309
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->Token:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v1}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 310
    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v1}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 311
    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->PushProjectId:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v1}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 314
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 323
    const-string v1, "PlayHaven initialized: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/playhaven/android/Version;->BANNER:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/playhaven/android/PlayHaven;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 324
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->debugConfig(Landroid/content/Context;)V

    .line 325
    return-void
.end method

.method public static varargs d(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "fmt"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 649
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 650
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    :cond_0
    return-void
.end method

.method public static varargs d(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "fmt"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 634
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 635
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 636
    :cond_0
    return-void
.end method

.method private static debugConfig(Landroid/content/Context;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x0

    .line 488
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 490
    .local v0, "appContext":Landroid/content/Context;
    sget-object v4, Lcom/playhaven/android/PlayHaven;->SHARED_PREF_NAME:Ljava/lang/String;

    invoke-virtual {v0, v4, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 491
    .local v3, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v2

    .line 492
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    const-string v4, "Configuration Parameters"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 493
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 500
    return-void

    .line 493
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 496
    .local v1, "key":Ljava/lang/String;
    sget-object v5, Lcom/playhaven/android/PlayHaven$Config;->Secret:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v5}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 498
    const-string v5, "%s: %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v1, v6, v9

    const/4 v7, 0x1

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lcom/playhaven/android/PlayHaven;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static defaultConfiguration(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 427
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 430
    .local v1, "appContext":Landroid/content/Context;
    sget-object v8, Lcom/playhaven/android/PlayHaven;->SHARED_PREF_NAME:Ljava/lang/String;

    invoke-virtual {v1, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 431
    .local v7, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 433
    .local v4, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;

    move-result-object v2

    .line 436
    .local v2, "compat":Lcom/playhaven/android/compat/VendorCompat;
    sget-object v8, Lcom/playhaven/android/compat/VendorCompat$ResourceType;->string:Lcom/playhaven/android/compat/VendorCompat$ResourceType;

    const-string v9, "playhaven_public_api_server"

    invoke-virtual {v2, p0, v8, v9}, Lcom/playhaven/android/compat/VendorCompat;->getResourceId(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat$ResourceType;Ljava/lang/String;)I

    move-result v0

    .line 437
    .local v0, "apiServerResId":I
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->APIServer:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 438
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->SDKVersion:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/playhaven/android/Version;->PROJECT_VERSION:Ljava/lang/String;

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 441
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 442
    .local v6, "pkgName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 444
    .local v5, "packageInfo":Landroid/content/pm/PackageInfo;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v6, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 449
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->AppPkg:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 451
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->AppVersion:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 454
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->OSName:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 455
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->OSVersion:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 456
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->DeviceId:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/playhaven/android/DeviceId;

    invoke-direct {v9, p0}, Lcom/playhaven/android/DeviceId;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9}, Lcom/playhaven/android/DeviceId;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 457
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->DeviceModel:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 460
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 462
    return-object v4

    .line 445
    :catch_0
    move-exception v3

    .line 446
    .local v3, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v8, Lcom/playhaven/android/PlayHavenException;

    const-string v9, "Unable to obtain package inforamtion"

    invoke-direct {v8, v9, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method public static varargs e(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "fmt"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 752
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 753
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 737
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 738
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 739
    :cond_0
    return-void
.end method

.method public static varargs e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "fmt"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 768
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 769
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 770
    :cond_0
    return-void
.end method

.method public static getOptOut(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 550
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 551
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string v1, "1"

    sget-object v2, Lcom/playhaven/android/PlayHaven$Config;->OptOut:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v2}, Lcom/playhaven/android/PlayHaven$Config;->name()Ljava/lang/String;

    move-result-object v2

    const-string v3, "0"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static getPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 474
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 477
    .local v0, "appContext":Landroid/content/Context;
    sget-object v1, Lcom/playhaven/android/PlayHaven;->SHARED_PREF_NAME:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    return-object v1
.end method

.method public static getVendorCompat(Landroid/content/Context;)Lcom/playhaven/android/compat/VendorCompat;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x0

    .line 797
    sget-object v8, Lcom/playhaven/android/PlayHaven;->cachedCompat:Lcom/playhaven/android/compat/VendorCompat;

    if-eqz v8, :cond_0

    .line 798
    sget-object v2, Lcom/playhaven/android/PlayHaven;->cachedCompat:Lcom/playhaven/android/compat/VendorCompat;

    .line 823
    :goto_0
    return-object v2

    .line 801
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 804
    .local v0, "appContext":Landroid/content/Context;
    sget-object v8, Lcom/playhaven/android/PlayHaven;->SHARED_PREF_NAME:Ljava/lang/String;

    invoke-virtual {v0, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 806
    .local v7, "pref":Landroid/content/SharedPreferences;
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->PluginType:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    const-class v9, Lcom/playhaven/android/compat/VendorCompat;

    invoke-virtual {v9}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 807
    .local v6, "pluginType":Ljava/lang/String;
    sget-object v8, Lcom/playhaven/android/PlayHaven$Config;->PluginIdentifer:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v8}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "android"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 808
    .local v5, "pluginId":Ljava/lang/String;
    const/4 v2, 0x0

    .line 809
    .local v2, "compat":Lcom/playhaven/android/compat/VendorCompat;
    if-eqz v5, :cond_1

    if-eqz v6, :cond_1

    .line 812
    :try_start_0
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 813
    .local v1, "cls":Ljava/lang/Class;
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/content/Context;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual {v1, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 814
    .local v3, "con":Ljava/lang/reflect/Constructor;
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p0, v8, v9

    const/4 v9, 0x1

    aput-object v5, v8, v9

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    check-cast v2, Lcom/playhaven/android/compat/VendorCompat;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 822
    .end local v1    # "cls":Ljava/lang/Class;
    .end local v3    # "con":Ljava/lang/reflect/Constructor;
    .restart local v2    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    :goto_1
    invoke-static {p0, v2}, Lcom/playhaven/android/PlayHaven;->setVendorCompat(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat;)V

    goto :goto_0

    .line 815
    .end local v2    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    :catch_0
    move-exception v4

    .line 816
    .local v4, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/playhaven/android/compat/VendorCompat;

    const-string v8, "android"

    invoke-direct {v2, v8}, Lcom/playhaven/android/compat/VendorCompat;-><init>(Ljava/lang/String;)V

    .line 818
    .restart local v2    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    goto :goto_1

    .line 819
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_1
    new-instance v2, Lcom/playhaven/android/compat/VendorCompat;

    .end local v2    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    const-string v8, "android"

    invoke-direct {v2, v8}, Lcom/playhaven/android/compat/VendorCompat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "compat":Lcom/playhaven/android/compat/VendorCompat;
    goto :goto_1
.end method

.method public static varargs i(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "fmt"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 680
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 681
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    :cond_0
    return-void
.end method

.method public static varargs i(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "fmt"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 665
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 666
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 667
    :cond_0
    return-void
.end method

.method public static isLoggable(I)Z
    .locals 4
    .param p0, "logLevel"    # I

    .prologue
    const/4 v1, 0x1

    .line 584
    sget-object v2, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {v2, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 588
    :cond_0
    :goto_0
    return v1

    .line 587
    :cond_1
    sget-object v2, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    const-string v3, "4"

    invoke-static {v2, v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 588
    .local v0, "stored":I
    if-le v0, p0, :cond_0

    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static setLogLevel(I)V
    .locals 2
    .param p0, "logLevel"    # I

    .prologue
    .line 573
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 574
    return-void
.end method

.method public static setLogLevel(Ljava/lang/String;)V
    .locals 1
    .param p0, "logLevel"    # Ljava/lang/String;

    .prologue
    .line 562
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven$LogName;->valueOf(Ljava/lang/String;)Lcom/playhaven/android/PlayHaven$LogName;

    move-result-object v0

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven$LogName;->access$2(Lcom/playhaven/android/PlayHaven$LogName;)I

    move-result v0

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->setLogLevel(I)V

    .line 563
    return-void
.end method

.method public static setOptOut(Landroid/content/Context;Z)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "option"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 538
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->defaultConfiguration(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 539
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v1, Lcom/playhaven/android/PlayHaven$Config;->OptOut:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v1}, Lcom/playhaven/android/PlayHaven$Config;->name()Ljava/lang/String;

    move-result-object v2

    if-eqz p1, :cond_0

    const-string v1, "1"

    :goto_0
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 540
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 541
    return-void

    .line 539
    :cond_0
    const-string v1, "0"

    goto :goto_0
.end method

.method public static setVendorCompat(Landroid/content/Context;Lcom/playhaven/android/compat/VendorCompat;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "compat"    # Lcom/playhaven/android/compat/VendorCompat;

    .prologue
    const/4 v6, 0x0

    .line 776
    sput-object p1, Lcom/playhaven/android/PlayHaven;->cachedCompat:Lcom/playhaven/android/compat/VendorCompat;

    .line 779
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 782
    .local v0, "appContext":Landroid/content/Context;
    sget-object v3, Lcom/playhaven/android/PlayHaven;->SHARED_PREF_NAME:Ljava/lang/String;

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 783
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 786
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v3, Lcom/playhaven/android/PlayHaven$Config;->PluginIdentifer:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v3}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/playhaven/android/compat/VendorCompat;->getVendorId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 787
    sget-object v3, Lcom/playhaven/android/PlayHaven$Config;->PluginType:Lcom/playhaven/android/PlayHaven$Config;

    invoke-virtual {v3}, Lcom/playhaven/android/PlayHaven$Config;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 790
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 792
    const-string v3, "PlayHaven plugin identifier set: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/playhaven/android/compat/VendorCompat;->getVendorId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Lcom/playhaven/android/PlayHaven;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 793
    invoke-static {p0}, Lcom/playhaven/android/PlayHaven;->debugConfig(Landroid/content/Context;)V

    .line 794
    return-void
.end method

.method public static varargs v(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "fmt"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 618
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 619
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 620
    :cond_0
    return-void
.end method

.method public static varargs v(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "fmt"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 603
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 604
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 605
    :cond_0
    return-void
.end method

.method private static validateHex(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 245
    if-nez p1, :cond_0

    new-instance v1, Lcom/playhaven/android/PlayHavenException;

    const-string v2, "%s must be set."

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v4

    invoke-direct {v1, v2, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 246
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Lcom/playhaven/android/PlayHavenException;

    const-string v2, "%s must not be empty."

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v4

    invoke-direct {v1, v2, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 248
    :cond_1
    :try_start_0
    new-instance v1, Ljava/math/BigInteger;

    const/16 v2, 0x10

    invoke-direct {v1, p1, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    return-void

    .line 249
    :catch_0
    move-exception v0

    .line 250
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/playhaven/android/PlayHavenException;

    const-string v2, "%s must be a hex value"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v4

    invoke-direct {v1, v0, v2, v3}, Lcom/playhaven/android/PlayHavenException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1
.end method

.method private static validateSecret(Ljava/lang/String;)V
    .locals 0
    .param p0, "secret"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 282
    return-void
.end method

.method private static validateToken(Ljava/lang/String;)V
    .locals 0
    .param p0, "token"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/playhaven/android/PlayHavenException;
        }
    .end annotation

    .prologue
    .line 267
    return-void
.end method

.method public static varargs w(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "fmt"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 724
    const/4 v0, 0x5

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 725
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 693
    const/4 v0, 0x5

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 694
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 695
    :cond_0
    return-void
.end method

.method public static varargs w(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "fmt"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 709
    const/4 v0, 0x5

    invoke-static {v0}, Lcom/playhaven/android/PlayHaven;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    sget-object v0, Lcom/playhaven/android/PlayHaven;->TAG:Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 711
    :cond_0
    return-void
.end method
