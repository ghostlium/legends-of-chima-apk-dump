.class public Lcom/flurry/android/FlurryAds;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/flurry/android/FlurryAds;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static clearLocation()V
    .locals 2

    .prologue
    .line 412
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 413
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    :goto_0
    return-void

    .line 416
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->k()V

    goto :goto_0
.end method

.method public static clearTargetingKeywords()V
    .locals 2

    .prologue
    .line 516
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 517
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 521
    :goto_0
    return-void

    .line 520
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->x()V

    goto :goto_0
.end method

.method public static clearUserCookies()V
    .locals 2

    .prologue
    .line 470
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 471
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    :goto_0
    return-void

    .line 474
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->v()V

    goto :goto_0
.end method

.method public static displayAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V
    .locals 3

    .prologue
    .line 297
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 298
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    :goto_0
    return-void

    .line 301
    :cond_0
    if-nez p0, :cond_1

    .line 302
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Context passed to displayAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 305
    :cond_1
    if-nez p1, :cond_2

    .line 306
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Ad space name passed to displayAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 309
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 310
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Ad space name passed to displayAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 313
    :cond_3
    if-nez p2, :cond_4

    .line 314
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "ViewGroup  passed to displayAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 319
    :cond_4
    :try_start_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V

    .line 320
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 321
    :catch_0
    move-exception v0

    .line 322
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Exception while displaying Ad: "

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static enableTestAds(Z)V
    .locals 2

    .prologue
    .line 548
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 549
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    :goto_0
    return-void

    .line 552
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Z)V

    goto :goto_0
.end method

.method public static fetchAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;)V
    .locals 6

    .prologue
    .line 246
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 247
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    :goto_0
    return-void

    .line 250
    :cond_0
    if-nez p0, :cond_1

    .line 251
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Context passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 254
    :cond_1
    if-nez p1, :cond_2

    .line 255
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Ad space name passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 258
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 259
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Ad space name passed to fetchAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 262
    :cond_3
    if-nez p2, :cond_4

    .line 263
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "ViewGroup passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 266
    :cond_4
    if-nez p3, :cond_5

    .line 267
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "FlurryAdSize passed to fetchAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 272
    :cond_5
    :try_start_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V

    .line 273
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 274
    :catch_0
    move-exception v0

    .line 275
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Exception while fetching Ad: "

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;J)Z
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 68
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    .line 69
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Device SDK Version older than 10"

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    :goto_0
    return v0

    .line 72
    :cond_0
    if-nez p0, :cond_1

    .line 73
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Context passed to getAd was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 76
    :cond_1
    if-nez p1, :cond_2

    .line 77
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Ad space name passed to getAd was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 81
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Ad space name passed to getAd was empty."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 84
    :cond_3
    if-nez p2, :cond_4

    .line 85
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "ViewGroup passed to getAd was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 88
    :cond_4
    if-nez p3, :cond_5

    .line 89
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "FlurryAdSize passed to getAd was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 94
    :cond_5
    :try_start_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V

    .line 96
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v1

    invoke-virtual {v1, p0, p1, p2, p3}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;Lcom/flurry/android/FlurryAdSize;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 97
    :catch_0
    move-exception v1

    .line 98
    sget-object v2, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v3, "Exception while getting Ad : "

    invoke-static {v2, v3, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static initializeAds(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 119
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 120
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    :goto_0
    return-void

    .line 123
    :cond_0
    if-nez p0, :cond_1

    .line 124
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Context passed to initializeAds was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 129
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V

    .line 130
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->e(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 131
    :catch_0
    move-exception v0

    .line 132
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Exception while initializing Ads: "

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static isAdAvailable(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;J)Z
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 161
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    .line 162
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Device SDK Version older than 10"

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    :goto_0
    return v0

    .line 165
    :cond_0
    if-nez p0, :cond_1

    .line 166
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Context passed to isAdAvailable was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 169
    :cond_1
    if-nez p1, :cond_2

    .line 170
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Ad space name passed to isAdAvailable was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 173
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 174
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Ad space name passed to isAdAvailable was empty."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 177
    :cond_3
    if-nez p2, :cond_4

    .line 178
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "FlurryAdSize passed to isAdAvailable was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 183
    :cond_4
    :try_start_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V

    .line 185
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v1

    invoke-virtual {v1, p0, p1, p2}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/FlurryAdSize;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v1

    .line 187
    sget-object v2, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v3, "Exception while checking Ads if available: "

    invoke-static {v2, v3, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static isAdReady(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 201
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    .line 202
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Device SDK Version older than 10"

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    :goto_0
    return v0

    .line 205
    :cond_0
    if-nez p0, :cond_1

    .line 206
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Ad space name passed to isAdReady was null."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 209
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 210
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Ad space name passed to isAdReady was empty."

    invoke-static {v1, v2}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 213
    :cond_2
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/u;->a(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method static printCounters()V
    .locals 1

    .prologue
    .line 562
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->l()V

    .line 563
    return-void
.end method

.method public static removeAd(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)V
    .locals 3

    .prologue
    .line 344
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 345
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    :goto_0
    return-void

    .line 348
    :cond_0
    if-nez p0, :cond_1

    .line 349
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Context passed to removeAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 352
    :cond_1
    if-nez p1, :cond_2

    .line 353
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Ad space name passed to removeAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 356
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_3

    .line 357
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Ad space name passed to removeAd was empty."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 360
    :cond_3
    if-nez p2, :cond_4

    .line 361
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "ViewGroup passed to removeAd was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 366
    :cond_4
    :try_start_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V

    .line 367
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b()Lcom/flurry/sdk/u;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 368
    :catch_0
    move-exception v0

    .line 369
    sget-object v1, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v2, "Exception while removing Ad: "

    invoke-static {v1, v2, v0}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static setAdListener(Lcom/flurry/android/FlurryAdListener;)V
    .locals 2

    .prologue
    .line 382
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 383
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    :goto_0
    return-void

    .line 386
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/FlurryAdListener;)V

    goto :goto_0
.end method

.method public static setAdLogUrl(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 534
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 535
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    :goto_0
    return-void

    .line 538
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setAdServerUrl(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 526
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 527
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    :goto_0
    return-void

    .line 530
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setCustomAdNetworkHandler(Lcom/flurry/android/ICustomAdNetworkHandler;)V
    .locals 2

    .prologue
    .line 426
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 427
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    :goto_0
    return-void

    .line 430
    :cond_0
    if-nez p0, :cond_1

    .line 431
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "ICustomAdNetworkHandler passed to setCustomAdNetworkHandler was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 434
    :cond_1
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/ICustomAdNetworkHandler;)V

    goto :goto_0
.end method

.method static setFixedAdId(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 1

    .prologue
    .line 557
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 558
    return-void
.end method

.method public static setLocation(FF)V
    .locals 2

    .prologue
    .line 397
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 398
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    :goto_0
    return-void

    .line 401
    :cond_0
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(FF)V

    goto :goto_0
.end method

.method public static setTargetingKeywords(Ljava/util/Map;)V
    .locals 2
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

    .prologue
    .line 496
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 497
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    :cond_0
    :goto_0
    return-void

    .line 500
    :cond_1
    if-nez p0, :cond_2

    .line 501
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "targetingKeywords Map passed to setTargetingKeywords was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 504
    :cond_2
    if-eqz p0, :cond_0

    .line 505
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->c(Ljava/util/Map;)V

    goto :goto_0
.end method

.method public static setUserCookies(Ljava/util/Map;)V
    .locals 2
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

    .prologue
    .line 452
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 453
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "Device SDK Version older than 10"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    :goto_0
    return-void

    .line 456
    :cond_0
    if-nez p0, :cond_1

    .line 457
    sget-object v0, Lcom/flurry/android/FlurryAds;->a:Ljava/lang/String;

    const-string v1, "userCookies Map passed to setUserCookies was null."

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 460
    :cond_1
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->getInstance()Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Ljava/util/Map;)V

    goto :goto_0
.end method
