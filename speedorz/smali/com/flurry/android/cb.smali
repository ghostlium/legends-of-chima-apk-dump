.class final Lcom/flurry/android/cb;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic dm:Lcom/flurry/android/FlurryAds;

.field private synthetic eh:Landroid/content/Context;

.field private synthetic ei:Ljava/lang/String;

.field private synthetic ej:Lcom/flurry/android/s;


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/s;)V
    .locals 0

    .prologue
    .line 2706
    iput-object p1, p0, Lcom/flurry/android/cb;->dm:Lcom/flurry/android/FlurryAds;

    iput-object p2, p0, Lcom/flurry/android/cb;->eh:Landroid/content/Context;

    iput-object p3, p0, Lcom/flurry/android/cb;->ei:Ljava/lang/String;

    iput-object p4, p0, Lcom/flurry/android/cb;->ej:Lcom/flurry/android/s;

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 4

    .prologue
    .line 2710
    iget-object v0, p0, Lcom/flurry/android/cb;->dm:Lcom/flurry/android/FlurryAds;

    iget-object v1, p0, Lcom/flurry/android/cb;->eh:Landroid/content/Context;

    iget-object v2, p0, Lcom/flurry/android/cb;->ei:Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/android/cb;->ej:Lcom/flurry/android/s;

    invoke-virtual {v3}, Lcom/flurry/android/s;->f()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z

    .line 2711
    return-void
.end method
