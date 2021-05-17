.class final Lcom/flurry/android/c;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic j:Landroid/content/Context;

.field private synthetic k:Lcom/flurry/android/FlurryAgent;

.field private synthetic l:Z


# direct methods
.method constructor <init>(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;Z)V
    .locals 0

    .prologue
    .line 1121
    iput-object p1, p0, Lcom/flurry/android/c;->k:Lcom/flurry/android/FlurryAgent;

    iput-object p2, p0, Lcom/flurry/android/c;->j:Landroid/content/Context;

    iput-boolean p3, p0, Lcom/flurry/android/c;->l:Z

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 3

    .prologue
    .line 1125
    iget-object v0, p0, Lcom/flurry/android/c;->k:Lcom/flurry/android/FlurryAgent;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/FlurryAgent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1127
    iget-object v0, p0, Lcom/flurry/android/c;->k:Lcom/flurry/android/FlurryAgent;

    iget-object v1, p0, Lcom/flurry/android/c;->j:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;)V

    .line 1129
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/c;->k:Lcom/flurry/android/FlurryAgent;

    iget-object v1, p0, Lcom/flurry/android/c;->j:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/flurry/android/c;->l:Z

    invoke-static {v0, v1, v2}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;Z)V

    .line 1130
    return-void
.end method
