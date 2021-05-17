.class public final Lcom/flurry/sdk/kt$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/kt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation


# instance fields
.field private final a:Ljava/lang/Object;

.field private final b:Z

.field private final c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/rx;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 811
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 812
    iput-object p2, p0, Lcom/flurry/sdk/kt$e;->a:Ljava/lang/Object;

    .line 814
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->t()Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/kt$e;->b:Z

    .line 815
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/kt$e;->c:Ljava/lang/Class;

    .line 816
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 820
    iget-boolean v0, p0, Lcom/flurry/sdk/kt$e;->b:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flurry/sdk/iz$a;->l:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 821
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Can not map JSON null into type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/kt$e;->c:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (set DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES to \'false\' to allow)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 824
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/kt$e;->a:Ljava/lang/Object;

    return-object v0
.end method
