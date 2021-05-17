.class public final Lcom/flurry/sdk/bn;
.super Lcom/flurry/sdk/ao;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/bn$1;,
        Lcom/flurry/sdk/bn$a;
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field private c:Z

.field private final d:Ljava/lang/String;

.field private e:Lcom/millennialmedia/android/MMInterstitial;

.field private f:Lcom/millennialmedia/android/RequestListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/flurry/sdk/bn;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/sdk/bn;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/ao;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 32
    const-string v0, "com.flurry.millennial.MYAPIDINTERSTITIAL"

    invoke-virtual {p5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/bn;->d:Ljava/lang/String;

    .line 33
    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/bn;)Z
    .locals 1

    .prologue
    .line 20
    iget-boolean v0, p0, Lcom/flurry/sdk/bn;->c:Z

    return v0
.end method

.method static synthetic b(Lcom/flurry/sdk/bn;)Lcom/millennialmedia/android/MMInterstitial;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/flurry/sdk/bn;->e:Lcom/millennialmedia/android/MMInterstitial;

    return-object v0
.end method

.method static synthetic f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/flurry/sdk/bn;->b:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    .line 56
    new-instance v1, Lcom/millennialmedia/android/MMInterstitial;

    invoke-virtual {p0}, Lcom/flurry/sdk/bn;->b()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v1, v0}, Lcom/millennialmedia/android/MMInterstitial;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/flurry/sdk/bn;->e:Lcom/millennialmedia/android/MMInterstitial;

    .line 57
    iget-object v0, p0, Lcom/flurry/sdk/bn;->e:Lcom/millennialmedia/android/MMInterstitial;

    iget-object v1, p0, Lcom/flurry/sdk/bn;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/millennialmedia/android/MMInterstitial;->setApid(Ljava/lang/String;)V

    .line 60
    new-instance v0, Lcom/flurry/sdk/bn$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/bn$a;-><init>(Lcom/flurry/sdk/bn;Lcom/flurry/sdk/bn$1;)V

    iput-object v0, p0, Lcom/flurry/sdk/bn;->f:Lcom/millennialmedia/android/RequestListener;

    .line 61
    iget-object v0, p0, Lcom/flurry/sdk/bn;->e:Lcom/millennialmedia/android/MMInterstitial;

    iget-object v1, p0, Lcom/flurry/sdk/bn;->f:Lcom/millennialmedia/android/RequestListener;

    invoke-virtual {v0, v1}, Lcom/millennialmedia/android/MMInterstitial;->setListener(Lcom/millennialmedia/android/RequestListener;)V

    .line 65
    iget-object v0, p0, Lcom/flurry/sdk/bn;->e:Lcom/millennialmedia/android/MMInterstitial;

    invoke-virtual {v0}, Lcom/millennialmedia/android/MMInterstitial;->fetch()V

    .line 66
    iget-object v0, p0, Lcom/flurry/sdk/bn;->e:Lcom/millennialmedia/android/MMInterstitial;

    invoke-virtual {v0}, Lcom/millennialmedia/android/MMInterstitial;->display()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/bn;->c:Z

    .line 68
    iget-boolean v0, p0, Lcom/flurry/sdk/bn;->c:Z

    if-eqz v0, :cond_0

    .line 69
    sget-object v0, Lcom/flurry/sdk/bn;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Millennial MMAdView Interstitial ad displayed immediately:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/flurry/sdk/bn;->c:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    :goto_0
    return-void

    .line 74
    :cond_0
    sget-object v0, Lcom/flurry/sdk/bn;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Millennial MMAdView Interstitial ad did not display immediately:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/flurry/sdk/bn;->c:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
