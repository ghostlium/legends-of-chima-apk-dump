.class Lcom/flurry/sdk/g$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/g;->a(Lcom/flurry/sdk/a;Lcom/flurry/sdk/ae;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/p;

.field final synthetic b:I

.field final synthetic c:Lcom/flurry/sdk/g;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/g;Lcom/flurry/sdk/p;I)V
    .locals 0

    .prologue
    .line 1146
    iput-object p1, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    iput-object p2, p0, Lcom/flurry/sdk/g$3;->a:Lcom/flurry/sdk/p;

    iput p3, p0, Lcom/flurry/sdk/g$3;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .prologue
    .line 1149
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1150
    const-string v0, "sourceEvent"

    iget-object v1, p0, Lcom/flurry/sdk/g$3;->a:Lcom/flurry/sdk/p;

    iget-object v1, v1, Lcom/flurry/sdk/p;->a:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1151
    iget-object v0, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    const-string v1, "userConfirmed"

    iget-object v3, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v3}, Lcom/flurry/sdk/g;->getAdUnit()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v4}, Lcom/flurry/sdk/g;->getAdLog()Lcom/flurry/sdk/e;

    move-result-object v4

    iget-object v5, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v5}, Lcom/flurry/sdk/g;->getAdFrameIndex()I

    move-result v5

    iget v6, p0, Lcom/flurry/sdk/g$3;->b:I

    add-int/lit8 v6, v6, 0x1

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/sdk/g;->a(Ljava/lang/String;Ljava/util/Map;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Lcom/flurry/sdk/e;II)V

    .line 1152
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1153
    iget-object v0, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->w(Lcom/flurry/sdk/g;)Lcom/flurry/sdk/f;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    invoke-virtual {v0}, Lcom/flurry/sdk/g;->getCurrentBinding()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 1155
    iget-object v0, p0, Lcom/flurry/sdk/g$3;->c:Lcom/flurry/sdk/g;

    invoke-static {v0}, Lcom/flurry/sdk/g;->w(Lcom/flurry/sdk/g;)Lcom/flurry/sdk/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/sdk/f;->start()V

    .line 1157
    :cond_0
    return-void
.end method
