.class final Lcom/flurry/android/m;
.super Lcom/flurry/android/es;
.source "SourceFile"


# instance fields
.field private synthetic P:Lcom/flurry/android/b;


# direct methods
.method constructor <init>(Lcom/flurry/android/b;)V
    .locals 0

    .prologue
    .line 1241
    iput-object p1, p0, Lcom/flurry/android/m;->P:Lcom/flurry/android/b;

    invoke-direct {p0}, Lcom/flurry/android/es;-><init>()V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 2

    .prologue
    .line 1245
    iget-object v0, p0, Lcom/flurry/android/m;->P:Lcom/flurry/android/b;

    iget-object v0, v0, Lcom/flurry/android/b;->k:Lcom/flurry/android/FlurryAgent;

    iget-object v1, p0, Lcom/flurry/android/m;->P:Lcom/flurry/android/b;

    iget-object v1, v1, Lcom/flurry/android/b;->j:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->b(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;)V

    .line 1246
    return-void
.end method
