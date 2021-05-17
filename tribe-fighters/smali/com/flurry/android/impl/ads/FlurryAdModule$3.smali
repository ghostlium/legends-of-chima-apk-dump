.class Lcom/flurry/android/impl/ads/FlurryAdModule$3;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/android/impl/ads/FlurryAdModule;->c(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/impl/ads/FlurryAdModule;


# direct methods
.method constructor <init>(Lcom/flurry/android/impl/ads/FlurryAdModule;)V
    .locals 0

    .prologue
    .line 311
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$3;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 314
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->T()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Attempting to persist AdLogs"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$3;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-static {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    .line 316
    invoke-static {}, Lcom/flurry/android/impl/ads/FlurryAdModule;->T()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Attempting to persist FreqCap"

    invoke-static {v0, v1}, Lcom/flurry/sdk/ex;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$3;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->D()V

    .line 324
    return-void
.end method
