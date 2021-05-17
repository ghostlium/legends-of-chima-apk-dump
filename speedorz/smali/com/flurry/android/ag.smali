.class final Lcom/flurry/android/ag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic cx:Lcom/flurry/android/s;


# direct methods
.method constructor <init>(Lcom/flurry/android/s;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/flurry/android/ag;->cx:Lcom/flurry/android/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/flurry/android/ag;->cx:Lcom/flurry/android/s;

    invoke-static {v0}, Lcom/flurry/android/s;->a(Lcom/flurry/android/s;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/flurry/android/ag;->cx:Lcom/flurry/android/s;

    iget-object v1, p0, Lcom/flurry/android/ag;->cx:Lcom/flurry/android/s;

    invoke-static {v1}, Lcom/flurry/android/s;->b(Lcom/flurry/android/s;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/android/s;->post(Ljava/lang/Runnable;)Z

    .line 78
    :cond_0
    return-void
.end method
