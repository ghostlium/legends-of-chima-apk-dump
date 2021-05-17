.class abstract Lcom/flurry/android/ab;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final m:Ljava/lang/String;


# instance fields
.field private final K:Landroid/content/Context;

.field private final L:Lcom/flurry/android/FlurryAds;

.field private final M:Lcom/flurry/android/ck;

.field private final N:Lcom/flurry/android/AdUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/flurry/android/ab;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flurry/android/ab;->m:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flurry/android/FlurryAds;Lcom/flurry/android/ck;Lcom/flurry/android/AdUnit;)V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/flurry/android/ab;->K:Landroid/content/Context;

    .line 48
    iput-object p2, p0, Lcom/flurry/android/ab;->L:Lcom/flurry/android/FlurryAds;

    .line 49
    iput-object p3, p0, Lcom/flurry/android/ab;->M:Lcom/flurry/android/ck;

    .line 50
    iput-object p4, p0, Lcom/flurry/android/ab;->N:Lcom/flurry/android/AdUnit;

    .line 51
    return-void
.end method


# virtual methods
.method public final E()Lcom/flurry/android/FlurryAds;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/flurry/android/ab;->L:Lcom/flurry/android/FlurryAds;

    return-object v0
.end method

.method public final F()Lcom/flurry/android/ck;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/flurry/android/ab;->M:Lcom/flurry/android/ck;

    return-object v0
.end method

.method public final G()Lcom/flurry/android/AdUnit;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/flurry/android/ab;->N:Lcom/flurry/android/AdUnit;

    return-object v0
.end method

.method public abstract H()V
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/flurry/android/ab;->K:Landroid/content/Context;

    return-object v0
.end method
