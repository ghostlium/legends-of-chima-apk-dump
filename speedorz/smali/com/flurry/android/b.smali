.class final Lcom/flurry/android/b;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic i:Z

.field final synthetic j:Landroid/content/Context;

.field final synthetic k:Lcom/flurry/android/FlurryAgent;


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAgent;ZLandroid/content/Context;)V
    .locals 0

    .prologue
    .line 1232
    iput-object p1, p0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    iput-boolean p2, p0, Lcom/flurry/android/b;->i:Z

    iput-object p3, p0, Lcom/flurry/android/b;->j:Landroid/content/Context;

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 4

    .prologue
    .line 1236
    iget-object v0, p0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->b(Lcom/flurry/android/FlurryAgent;)V

    .line 1237
    iget-object v0, p0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->c(Lcom/flurry/android/FlurryAgent;)V

    .line 1238
    iget-boolean v0, p0, Lcom/flurry/android/b;->i:Z

    if-nez v0, :cond_0

    .line 1241
    iget-object v0, p0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->d(Lcom/flurry/android/FlurryAgent;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/flurry/android/m;

    invoke-direct {v1, p0}, Lcom/flurry/android/m;-><init>(Lcom/flurry/android/b;)V

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->x()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1250
    :cond_0
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->m()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1252
    const-string v0, "FlurryAgent"

    const-string v1, "Attempting to persist AdLogs"

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1253
    iget-object v0, p0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->be:Lcom/flurry/android/FlurryAds;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryAds;->aG()V

    .line 1254
    const-string v0, "FlurryAgent"

    const-string v1, "Attempting to persist FreqCap"

    invoke-static {v0, v1}, Lcom/flurry/android/cm;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 1255
    iget-object v0, p0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->be:Lcom/flurry/android/FlurryAds;

    invoke-virtual {v0}, Lcom/flurry/android/FlurryAds;->aI()V

    .line 1257
    :cond_1
    return-void
.end method
