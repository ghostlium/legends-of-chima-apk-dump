.class public Lcom/amazon/identity/auth/device/token/MAPCookie;
.super Ljava/lang/Object;
.source "MAPCookie.java"

# interfaces
.implements Lorg/apache/http/cookie/Cookie;
.implements Lcom/amazon/identity/auth/device/token/Token;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/token/MAPCookie$CookieAttribute;
    }
.end annotation


# static fields
.field private static final COOKIE_ATTRIBUTE_SEPERATOR:Ljava/lang/String; = ";"

.field public static final COOKIE_DATE_FORMAT:Ljava/lang/String; = "dd MMM yyyy kk:mm:ss z"

.field private static final COOKIE_NAME_VALUE_SEPERATOR:Ljava/lang/String; = "="

.field private static final DOMAIN_PREFIX:Ljava/lang/String; = "www"

.field private static final DOT:Ljava/lang/String; = "."

.field private static final EMPTY_COOKIE:Ljava/lang/String; = ""

.field private static final GMT:Ljava/lang/String; = "GMT"

.field public static final KEY_COMMENT:Ljava/lang/String; = "Comment"

.field public static final KEY_COMMENT_URL:Ljava/lang/String; = "CommentUrl"

.field public static final KEY_DIRECTED_ID:Ljava/lang/String; = "DirectedId"

.field public static final KEY_DOMAIN:Ljava/lang/String; = "Domain"

.field public static final KEY_EXPIRES:Ljava/lang/String; = "Expires"

.field public static final KEY_HTTP_ONLY:Ljava/lang/String; = "HttpOnly"

.field public static final KEY_NAME:Ljava/lang/String; = "Name"

.field public static final KEY_PATH:Ljava/lang/String; = "Path"

.field public static final KEY_PERSISTANT:Ljava/lang/String; = "Persistant"

.field public static final KEY_SECURE:Ljava/lang/String; = "Secure"

.field public static final KEY_VALUE:Ljava/lang/String; = "Value"

.field public static final KEY_VERSION:Ljava/lang/String; = "Version"

.field private static final LOG_TAG:Ljava/lang/String;

.field public static final NO_VERSION:I = -0x1

.field private static final serialVersionUID:J = 0x8056234039L


# instance fields
.field private final _cookieData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final transient _localCreationTimestamp:Landroid/text/format/Time;

.field private _ports:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    const-class v0, Lcom/amazon/identity/auth/device/token/MAPCookie;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "domain"    # Ljava/lang/String;
    .param p4, "directedId"    # Ljava/lang/String;
    .param p5, "isSecure"    # Z

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_localCreationTimestamp:Landroid/text/format/Time;

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    .line 100
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    const-string v1, "Name"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    const-string v1, "Value"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    const-string v1, "DirectedId"

    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    const-string v1, "Domain"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    invoke-virtual {p0, p5}, Lcom/amazon/identity/auth/device/token/MAPCookie;->setSecure(Z)V

    .line 105
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->logCookie()V

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "cookieData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_localCreationTimestamp:Landroid/text/format/Time;

    .line 111
    iput-object p1, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    .line 112
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->logCookie()V

    .line 113
    return-void
.end method

.method public static clearCookieInCookieManager(Landroid/content/Context;Lorg/apache/http/cookie/Cookie;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "directedId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 476
    const/4 v3, 0x0

    .line 479
    .local v3, "manager":Landroid/webkit/CookieSyncManager;
    :try_start_0
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 487
    :goto_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    .line 488
    .local v0, "cookieManager":Landroid/webkit/CookieManager;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 489
    invoke-virtual {v3}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 490
    invoke-static {p1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getClearSetCookieHeader(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object v1

    .line 491
    .local v1, "cookieString":Ljava/lang/String;
    invoke-virtual {v0, p2, v1}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    invoke-virtual {v3}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 493
    return-void

    .line 481
    .end local v0    # "cookieManager":Landroid/webkit/CookieManager;
    .end local v1    # "cookieString":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 483
    .local v2, "e":Ljava/lang/IllegalStateException;
    sget-object v4, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    const-string v5, "CookieSyncManager not yet created... creating"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    invoke-static {p0}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 485
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v3

    goto :goto_0
.end method

.method public static extractCookieStringArray(Ljava/util/List;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 278
    .local p0, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    if-eqz p0, :cond_1

    .line 280
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 281
    .local v2, "returnCookies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/cookie/Cookie;

    .line 283
    .local v0, "cookie":Lorg/apache/http/cookie/Cookie;
    invoke-static {v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getSetCookieHeader(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 285
    .end local v0    # "cookie":Lorg/apache/http/cookie/Cookie;
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 287
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "returnCookies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static formatDate(Ljava/util/Date;)Ljava/lang/String;
    .locals 3
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 469
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd MMM yyyy kk:mm:ss z"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 470
    .local v0, "format":Ljava/text/DateFormat;
    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 471
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static final getClearSetCookieHeader(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;
    .locals 6
    .param p0, "cookie"    # Lorg/apache/http/cookie/Cookie;

    .prologue
    .line 336
    const/4 v2, 0x0

    .line 338
    .local v2, "isHttpOnly":Z
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 339
    .local v0, "cookieSB":Ljava/lang/StringBuilder;
    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    const-string v3, "; path=/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "; domain="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->isSecure()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 345
    const-string v3, "; secure"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    :cond_0
    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getExpiryDate()Ljava/util/Date;

    move-result-object v1

    .line 352
    .local v1, "date":Ljava/util/Date;
    if-eqz v1, :cond_2

    .line 354
    const-string v3, "; expires="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 357
    sget-object v3, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cookie "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " expired : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    :cond_1
    invoke-static {v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getCookieExpireDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 3
    .param p0, "expiryDate"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 449
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd MMM yyyy kk:mm:ss z"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 450
    .local v0, "format":Ljava/text/DateFormat;
    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 451
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static getCookiesFromCookieManager(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 402
    invoke-static {p0, p1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getCookiesStringFromCookieManager(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 404
    .local v9, "cookies":Ljava/lang/String;
    sget-object v0, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Extracting cookie list for domain="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "directedId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 406
    .local v7, "cookieList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    if-eqz v9, :cond_2

    .line 408
    new-instance v10, Ljava/util/StringTokenizer;

    const-string v0, ";"

    invoke-direct {v10, v9, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .local v10, "cookiesParser":Ljava/util/StringTokenizer;
    :cond_0
    :goto_0
    invoke-virtual {v10}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 412
    invoke-virtual {v10}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 413
    .local v6, "cookie":Ljava/lang/String;
    new-instance v8, Ljava/util/StringTokenizer;

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v3, "="

    invoke-direct {v8, v0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    .local v8, "cookieParser":Ljava/util/StringTokenizer;
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 416
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 417
    .local v1, "cookieName":Ljava/lang/String;
    const-string v2, ""

    .line 418
    .local v2, "cookieValue":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 420
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 422
    :cond_1
    new-instance v0, Lcom/amazon/identity/auth/device/token/MAPCookie;

    const/4 v5, 0x0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/amazon/identity/auth/device/token/MAPCookie;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 429
    .end local v1    # "cookieName":Ljava/lang/String;
    .end local v2    # "cookieValue":Ljava/lang/String;
    .end local v6    # "cookie":Ljava/lang/String;
    .end local v8    # "cookieParser":Ljava/util/StringTokenizer;
    .end local v10    # "cookiesParser":Ljava/util/StringTokenizer;
    :cond_2
    sget-object v0, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No cookies in Cookie manager for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :cond_3
    return-object v7
.end method

.method public static getCookiesStringFromCookieManager(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 366
    const/4 v4, 0x0

    .line 369
    .local v4, "manager":Landroid/webkit/CookieSyncManager;
    :try_start_0
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 377
    :goto_0
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    .line 378
    .local v0, "cookieManager":Landroid/webkit/CookieManager;
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V

    .line 379
    invoke-virtual {v4}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 381
    move-object v3, p1

    .line 382
    .local v3, "getCookieDomain":Ljava/lang/String;
    const-string v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 384
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "www"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 387
    :cond_0
    invoke-virtual {v0, v3}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 388
    .local v1, "cookies":Ljava/lang/String;
    sget-object v5, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Extracting cookies from CookieManager for domain="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    return-object v1

    .line 371
    .end local v0    # "cookieManager":Landroid/webkit/CookieManager;
    .end local v1    # "cookies":Ljava/lang/String;
    .end local v3    # "getCookieDomain":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 373
    .local v2, "e":Ljava/lang/IllegalStateException;
    sget-object v5, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    const-string v6, "CookieSyncManager not yet created... creating"

    invoke-static {v5, v6}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    invoke-static {p0}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 375
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v4

    goto :goto_0
.end method

.method public static final getSetCookieHeader(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;
    .locals 6
    .param p0, "cookie"    # Lorg/apache/http/cookie/Cookie;

    .prologue
    .line 299
    const/4 v2, 0x0

    .line 301
    .local v2, "isHttpOnly":Z
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 302
    .local v0, "cookieSB":Ljava/lang/StringBuilder;
    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    const-string v3, "; path=/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "; domain="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->isSecure()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 308
    const-string v3, "; secure"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    :cond_0
    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getExpiryDate()Ljava/util/Date;

    move-result-object v1

    .line 315
    .local v1, "date":Ljava/util/Date;
    if-eqz v1, :cond_2

    .line 317
    const-string v3, "; expires="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 320
    sget-object v3, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cookie "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p0}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " expired : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    :cond_1
    invoke-static {v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private logCookie()V
    .locals 4

    .prologue
    .line 116
    sget-object v0, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating Cookie from data. name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "domain:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getDomain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " directedId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getDirectedId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " cookie:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    return-void
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 261
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    const-string v0, "Comment"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCommentURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    const-string v0, "CommentUrl"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 131
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    return-object v0
.end method

.method public getDirectedId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    const-string v0, "DirectedId"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    const-string v0, "Domain"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExpiryDate()Ljava/util/Date;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 175
    const-string v3, "Expires"

    invoke-virtual {p0, v3}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 176
    .local v1, "sExpiryDate":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 179
    :try_start_0
    invoke-static {v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getCookieExpireDate(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 185
    :cond_0
    :goto_0
    return-object v2

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/text/ParseException;
    sget-object v3, Lcom/amazon/identity/auth/device/token/MAPCookie;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Date parse error on MAP Cookie"

    invoke-static {v3, v4, v0}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public getLocalTimestamp()Landroid/text/format/Time;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_localCreationTimestamp:Landroid/text/format/Time;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    const-string v0, "Name"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    const-string v0, "Path"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPorts()[I
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_ports:[I

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    const-string v0, "Value"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()I
    .locals 2

    .prologue
    .line 223
    const-string v1, "Version"

    invoke-virtual {p0, v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 224
    .local v0, "version":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 226
    const/4 v1, -0x1

    .line 228
    :goto_0
    return v1

    :cond_0
    const-string v1, "Version"

    invoke-virtual {p0, v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method public hasExpired()Z
    .locals 1

    .prologue
    .line 121
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->isExpired(Ljava/util/Date;)Z

    move-result v0

    return v0
.end method

.method public isExpired(Ljava/util/Date;)Z
    .locals 1
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 233
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getExpiryDate()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_0

    .line 235
    const/4 v0, 0x0

    .line 242
    :goto_0
    return v0

    .line 237
    :cond_0
    if-nez p1, :cond_1

    .line 239
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    .line 242
    :cond_1
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getExpiryDate()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v0

    goto :goto_0
.end method

.method public isHttpOnly()Z
    .locals 2

    .prologue
    .line 143
    const-string v1, "HttpOnly"

    invoke-virtual {p0, v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "httpOnly":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 146
    const/4 v1, 0x0

    .line 148
    :goto_0
    return v1

    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isPersistent()Z
    .locals 1

    .prologue
    .line 247
    const-string v0, "Persistant"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .prologue
    .line 252
    const-string v0, "Secure"

    invoke-virtual {p0, v0}, Lcom/amazon/identity/auth/device/token/MAPCookie;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 266
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public setExpiryDate(Ljava/lang/String;)V
    .locals 1
    .param p1, "expiryDate"    # Ljava/lang/String;

    .prologue
    .line 189
    const-string v0, "Expires"

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setHttpOnly(Z)V
    .locals 3
    .param p1, "httpOnly"    # Z

    .prologue
    .line 155
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_cookieData:Ljava/util/Map;

    const-string v1, "HttpOnly"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 203
    const-string v0, "Path"

    invoke-virtual {p0, v0, p1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 204
    return-void
.end method

.method public setPorts([I)V
    .locals 3
    .param p1, "ports"    # [I

    .prologue
    const/4 v2, 0x0

    .line 212
    array-length v0, p1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_ports:[I

    .line 213
    iget-object v0, p0, Lcom/amazon/identity/auth/device/token/MAPCookie;->_ports:[I

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 214
    return-void
.end method

.method protected setSecure(Z)V
    .locals 2
    .param p1, "isSecure"    # Z

    .prologue
    .line 256
    const-string v0, "Secure"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/token/MAPCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 257
    return-void
.end method
