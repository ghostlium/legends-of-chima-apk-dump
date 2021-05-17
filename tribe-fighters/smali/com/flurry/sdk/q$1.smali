.class Lcom/flurry/sdk/q$1;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;ZLcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

.field final synthetic c:Landroid/content/Context;

.field final synthetic d:Z

.field final synthetic e:Lcom/flurry/sdk/q;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/q;Ljava/lang/String;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/content/Context;Z)V
    .locals 0

    .prologue
    .line 488
    iput-object p1, p0, Lcom/flurry/sdk/q$1;->e:Lcom/flurry/sdk/q;

    iput-object p2, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/sdk/q$1;->b:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    iput-object p4, p0, Lcom/flurry/sdk/q$1;->c:Landroid/content/Context;

    iput-boolean p5, p0, Lcom/flurry/sdk/q$1;->d:Z

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .prologue
    const/4 v4, 0x5

    .line 492
    iget-object v0, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 493
    iget-object v0, p0, Lcom/flurry/sdk/q$1;->b:Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->b()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 494
    iget-object v1, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    const-string v2, "market://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 495
    iget-object v1, p0, Lcom/flurry/sdk/q$1;->e:Lcom/flurry/sdk/q;

    iget-object v2, p0, Lcom/flurry/sdk/q$1;->c:Landroid/content/Context;

    iget-object v3, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v0}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    :cond_0
    :goto_0
    return-void

    .line 496
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 497
    new-instance v1, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/sdk/eg;->a()Lcom/flurry/sdk/eg;

    move-result-object v2

    invoke-virtual {v2}, Lcom/flurry/sdk/eg;->b()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 500
    const-string v2, "url"

    iget-object v3, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 501
    iget-boolean v2, p0, Lcom/flurry/sdk/q$1;->d:Z

    if-eqz v2, :cond_2

    invoke-static {v1}, Lcom/flurry/sdk/fh;->a(Landroid/content/Intent;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 502
    iget-object v2, p0, Lcom/flurry/sdk/q$1;->e:Lcom/flurry/sdk/q;

    iget-object v3, p0, Lcom/flurry/sdk/q$1;->c:Landroid/content/Context;

    invoke-virtual {v2, v3, v1, v0}, Lcom/flurry/sdk/q;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    goto :goto_0

    .line 504
    :cond_2
    const/4 v1, 0x6

    invoke-static {}, Lcom/flurry/sdk/q;->d()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Unable to launch FlurryFullscreenTakeoverActivity, falling back to browser. Fix by declaring this Activity in your AndroidManifest.xml"

    invoke-static {v1, v2, v3}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 507
    iget-object v1, p0, Lcom/flurry/sdk/q$1;->e:Lcom/flurry/sdk/q;

    iget-object v2, p0, Lcom/flurry/sdk/q$1;->c:Landroid/content/Context;

    iget-object v3, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v0}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 512
    :cond_3
    iget-object v1, p0, Lcom/flurry/sdk/q$1;->e:Lcom/flurry/sdk/q;

    iget-object v2, p0, Lcom/flurry/sdk/q$1;->c:Landroid/content/Context;

    iget-object v3, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v0}, Lcom/flurry/sdk/q;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 513
    if-nez v0, :cond_0

    .line 517
    invoke-static {}, Lcom/flurry/sdk/q;->d()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to launch intent for:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v0, v1}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 522
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to launch intent for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/q$1;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 523
    invoke-static {}, Lcom/flurry/sdk/q;->d()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1, v0}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
