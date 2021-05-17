.class final Lcom/flurry/android/cg;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic dm:Lcom/flurry/android/FlurryAds;

.field private synthetic eh:Landroid/content/Context;

.field private synthetic el:Ljava/lang/String;

.field private synthetic em:Lcom/flurry/android/AdUnit;

.field private synthetic en:Z


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAds;Ljava/lang/String;Lcom/flurry/android/AdUnit;Landroid/content/Context;Z)V
    .locals 0

    .prologue
    .line 1491
    iput-object p1, p0, Lcom/flurry/android/cg;->dm:Lcom/flurry/android/FlurryAds;

    iput-object p2, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/android/cg;->em:Lcom/flurry/android/AdUnit;

    iput-object p4, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    iput-boolean p5, p0, Lcom/flurry/android/cg;->en:Z

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 4

    .prologue
    .line 1496
    iget-object v0, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 1498
    iget-object v0, p0, Lcom/flurry/android/cg;->em:Lcom/flurry/android/AdUnit;

    invoke-virtual {v0}, Lcom/flurry/android/AdUnit;->getAdSpace()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1499
    iget-object v1, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    const-string v2, "market://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1501
    iget-object v0, p0, Lcom/flurry/android/cg;->dm:Lcom/flurry/android/FlurryAds;

    iget-object v1, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    iget-object v2, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/android/cg;->em:Lcom/flurry/android/AdUnit;

    invoke-virtual {v0, v1, v2, v3}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Ljava/lang/String;Lcom/flurry/android/AdUnit;)V

    .line 1534
    :cond_0
    :goto_0
    return-void

    .line 1503
    :cond_1
    iget-object v1, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1505
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    const-class v3, Lcom/flurry/android/FlurryFullscreenTakeoverActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1506
    const-string v2, "url"

    iget-object v3, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1507
    iget-boolean v2, p0, Lcom/flurry/android/cg;->en:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/flurry/android/eo;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1509
    iget-object v2, p0, Lcom/flurry/android/cg;->dm:Lcom/flurry/android/FlurryAds;

    iget-object v3, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    invoke-virtual {v2, v3, v1, v0}, Lcom/flurry/android/FlurryAds;->a(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)Z

    goto :goto_0

    .line 1513
    :cond_2
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    const-string v2, "Unable to launch FlurryFullscreenTakeoverActivity, falling back to browser. Fix by declaring this Activity in your AndroidManifest.xml"

    invoke-static {v1, v2}, Lcom/flurry/android/cm;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1514
    iget-object v1, p0, Lcom/flurry/android/cg;->dm:Lcom/flurry/android/FlurryAds;

    iget-object v2, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    iget-object v3, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v0}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 1520
    :cond_3
    iget-object v1, p0, Lcom/flurry/android/cg;->dm:Lcom/flurry/android/FlurryAds;

    iget-object v2, p0, Lcom/flurry/android/cg;->eh:Landroid/content/Context;

    iget-object v3, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v0}, Lcom/flurry/android/FlurryAds;->c(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 1521
    if-nez v0, :cond_0

    .line 1524
    sget-object v0, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to launch intent for:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1531
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to launch intent for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/cg;->el:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1532
    sget-object v1, Lcom/flurry/android/FlurryAds;->m:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/flurry/android/cm;->g(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
