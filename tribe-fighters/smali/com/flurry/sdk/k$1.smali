.class Lcom/flurry/sdk/k$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/k;->c()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/k;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/k;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/flurry/sdk/k$1;->a:Lcom/flurry/sdk/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/flurry/sdk/k$1;->a:Lcom/flurry/sdk/k;

    invoke-static {v0}, Lcom/flurry/sdk/k;->a(Lcom/flurry/sdk/k;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/flurry/sdk/k$1;->a:Lcom/flurry/sdk/k;

    iget-object v1, p0, Lcom/flurry/sdk/k$1;->a:Lcom/flurry/sdk/k;

    invoke-static {v1}, Lcom/flurry/sdk/k;->b(Lcom/flurry/sdk/k;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/k;->post(Ljava/lang/Runnable;)Z

    .line 83
    :cond_0
    return-void
.end method
