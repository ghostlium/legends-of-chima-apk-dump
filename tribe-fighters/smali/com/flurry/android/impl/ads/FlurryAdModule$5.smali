.class Lcom/flurry/android/impl/ads/FlurryAdModule$5;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/android/impl/ads/FlurryAdModule;->b(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/FlurryAdListener;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/flurry/android/impl/ads/FlurryAdModule;


# direct methods
.method constructor <init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 356
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$5;->c:Lcom/flurry/android/impl/ads/FlurryAdModule;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$5;->a:Lcom/flurry/android/FlurryAdListener;

    iput-object p3, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$5;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 359
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$5;->a:Lcom/flurry/android/FlurryAdListener;

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$5;->b:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->onAdClosed(Ljava/lang/String;)V

    .line 360
    return-void
.end method
