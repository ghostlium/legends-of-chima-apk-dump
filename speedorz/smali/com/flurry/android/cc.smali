.class final Lcom/flurry/android/cc;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic dm:Lcom/flurry/android/FlurryAds;


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAds;)V
    .locals 0

    .prologue
    .line 1780
    iput-object p1, p0, Lcom/flurry/android/cc;->dm:Lcom/flurry/android/FlurryAds;

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 2

    .prologue
    .line 1785
    iget-object v0, p0, Lcom/flurry/android/cc;->dm:Lcom/flurry/android/FlurryAds;

    const-string v1, "/postAdLog.do"

    invoke-virtual {v0, v1}, Lcom/flurry/android/FlurryAds;->C(Ljava/lang/String;)V

    .line 1786
    return-void
.end method
