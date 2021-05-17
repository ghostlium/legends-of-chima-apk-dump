.class Lcom/flurry/sdk/q$2;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Z

.field final synthetic d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field final synthetic e:Lcom/flurry/sdk/q;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/q;Ljava/lang/String;Landroid/content/Context;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
    .locals 0

    .prologue
    .line 552
    iput-object p1, p0, Lcom/flurry/sdk/q$2;->e:Lcom/flurry/sdk/q;

    iput-object p2, p0, Lcom/flurry/sdk/q$2;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/sdk/q$2;->b:Landroid/content/Context;

    iput-boolean p4, p0, Lcom/flurry/sdk/q$2;->c:Z

    iput-object p5, p0, Lcom/flurry/sdk/q$2;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .prologue
    .line 555
    iget-object v0, p0, Lcom/flurry/sdk/q$2;->e:Lcom/flurry/sdk/q;

    iget-object v1, p0, Lcom/flurry/sdk/q$2;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/q;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 556
    if-eqz v0, :cond_0

    .line 557
    iget-object v1, p0, Lcom/flurry/sdk/q$2;->e:Lcom/flurry/sdk/q;

    iget-object v2, p0, Lcom/flurry/sdk/q$2;->b:Landroid/content/Context;

    iget-boolean v3, p0, Lcom/flurry/sdk/q$2;->c:Z

    iget-object v4, p0, Lcom/flurry/sdk/q$2;->d:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    .line 561
    :goto_0
    return-void

    .line 559
    :cond_0
    const/4 v0, 0x5

    invoke-static {}, Lcom/flurry/sdk/q;->d()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Redirect URL could not be found for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/q$2;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
