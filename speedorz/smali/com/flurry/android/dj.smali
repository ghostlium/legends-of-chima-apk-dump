.class final Lcom/flurry/android/dj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/android/j;


# direct methods
.method synthetic constructor <init>()V
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/android/dj;-><init>(B)V

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
.method public final b(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;)Lcom/flurry/android/l;
    .locals 6

    .prologue
    .line 95
    new-instance v0, Lcom/flurry/android/eu;

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/eu;-><init>(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;I)V

    return-object v0
.end method