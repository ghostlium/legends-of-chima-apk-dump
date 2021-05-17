.class Lcom/flurry/android/impl/ads/FlurryAdModule$2;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/p;Lcom/flurry/sdk/ad;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/FlurryAdListener;

.field final synthetic b:Lcom/flurry/sdk/p;

.field final synthetic c:Lcom/flurry/android/impl/ads/FlurryAdModule;


# direct methods
.method constructor <init>(Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/android/FlurryAdListener;Lcom/flurry/sdk/p;)V
    .locals 0

    .prologue
    .line 1306
    iput-object p1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$2;->c:Lcom/flurry/android/impl/ads/FlurryAdModule;

    iput-object p2, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$2;->a:Lcom/flurry/android/FlurryAdListener;

    iput-object p3, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$2;->b:Lcom/flurry/sdk/p;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .prologue
    .line 1309
    iget-object v0, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$2;->a:Lcom/flurry/android/FlurryAdListener;

    iget-object v1, p0, Lcom/flurry/android/impl/ads/FlurryAdModule$2;->b:Lcom/flurry/sdk/p;

    iget-object v1, v1, Lcom/flurry/sdk/p;->c:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v1}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/flurry/android/FlurryAdListener;->onVideoCompleted(Ljava/lang/String;)V

    .line 1310
    return-void
.end method
