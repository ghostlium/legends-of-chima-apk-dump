.class Lcom/flurry/sdk/u$6;
.super Lcom/flurry/sdk/fi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flurry/sdk/u;->n(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/u$a;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/flurry/sdk/u;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/u;Lcom/flurry/sdk/u$a;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 501
    iput-object p1, p0, Lcom/flurry/sdk/u$6;->c:Lcom/flurry/sdk/u;

    iput-object p2, p0, Lcom/flurry/sdk/u$6;->a:Lcom/flurry/sdk/u$a;

    iput-object p3, p0, Lcom/flurry/sdk/u$6;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/flurry/sdk/fi;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .prologue
    .line 504
    iget-object v0, p0, Lcom/flurry/sdk/u$6;->c:Lcom/flurry/sdk/u;

    iget-object v1, p0, Lcom/flurry/sdk/u$6;->a:Lcom/flurry/sdk/u$a;

    invoke-virtual {v1}, Lcom/flurry/sdk/u$a;->c()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/u$6;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/flurry/sdk/u$6;->a:Lcom/flurry/sdk/u$a;

    invoke-virtual {v3}, Lcom/flurry/sdk/u$a;->d()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/flurry/sdk/u;->a(Landroid/content/Context;Ljava/lang/String;Landroid/view/ViewGroup;)Z

    .line 505
    return-void
.end method
