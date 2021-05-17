.class final Lcom/flurry/android/ek;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/au;


# direct methods
.method synthetic constructor <init>()V
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/android/ek;-><init>(B)V

    return-void
.end method

.method private constructor <init>(B)V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/ab;
    .locals 1

    .prologue
    .line 96
    new-instance v0, Lcom/flurry/android/ac;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/flurry/android/ac;-><init>(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;)V

    return-object v0
.end method
