.class Lcom/flurry/sdk/u$1;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/u;->a(Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/flurry/sdk/u;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/u;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 427
    iput-object p1, p0, Lcom/flurry/sdk/u$1;->c:Lcom/flurry/sdk/u;

    iput-object p2, p0, Lcom/flurry/sdk/u$1;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    iput-object p3, p0, Lcom/flurry/sdk/u$1;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 430
    iget-object v0, p0, Lcom/flurry/sdk/u$1;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->g()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 431
    iget-object v1, p0, Lcom/flurry/sdk/u$1;->c:Lcom/flurry/sdk/u;

    invoke-static {v1}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;)Lcom/flurry/android/impl/ads/FlurryAdModule;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/FlurryAdModule;Ljava/lang/String;)Lcom/flurry/sdk/e;

    move-result-object v5

    .line 432
    iget-object v0, p0, Lcom/flurry/sdk/u$1;->c:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$1;->b:Ljava/lang/String;

    const-string v2, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/u$1;->a:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move v7, v6

    invoke-static/range {v0 .. v7}, Lcom/flurry/sdk/u;->a(Lcom/flurry/sdk/u;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 435
    return-void
.end method
