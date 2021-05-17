.class Lcom/flurry/sdk/g$1$1;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g$1;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/g$1;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g$1;)V
    .locals 0

    .prologue
    .line 973
    iput-object p1, p0, Lcom/flurry/sdk/g$1$1;->a:Lcom/flurry/sdk/g$1;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .prologue
    .line 977
    iget-object v0, p0, Lcom/flurry/sdk/g$1$1;->a:Lcom/flurry/sdk/g$1;

    iget-object v0, v0, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    const-string v1, "renderFailed"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/g$1$1;->a:Lcom/flurry/sdk/g$1;

    iget-object v3, v3, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/g$1$1;->a:Lcom/flurry/sdk/g$1;

    iget-object v4, v4, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/sdk/g$1$1;->a:Lcom/flurry/sdk/g$1;

    iget-object v5, v5, Lcom/flurry/sdk/g$1;->b:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 978
    return-void
.end method
