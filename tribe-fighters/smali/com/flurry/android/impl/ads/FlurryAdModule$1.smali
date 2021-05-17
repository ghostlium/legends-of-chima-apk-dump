.class Lcom/flurry/android/impl/ads/FlurryAdModule$1;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Landroid/content/Context;)V
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
    .line 265
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$1;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 268
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$1;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-static {}, Lcom/flurry/sdk/eo;->a()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/impl/ads/FlurryAdModule;->g:Ljava/lang/String;

    .line 269
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$1;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-static {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;)V

    .line 270
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$1;->a:Lcom/flurry/android/impl/ads/FlurryAdModule;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->E()V

    .line 271
    return-void
.end method
