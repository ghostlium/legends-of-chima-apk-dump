.class final Lcom/flurry/android/cf;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic eh:Landroid/content/Context;

.field private synthetic ek:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAds;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1637
    iput-object p2, p0, Lcom/flurry/android/cf;->eh:Landroid/content/Context;

    iput-object p3, p0, Lcom/flurry/android/cf;->ek:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 2

    .prologue
    .line 1642
    iget-object v0, p0, Lcom/flurry/android/cf;->eh:Landroid/content/Context;

    iget-object v1, p0, Lcom/flurry/android/cf;->ek:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAds;->h(Landroid/content/Context;Ljava/lang/String;)Z

    .line 1643
    return-void
.end method
