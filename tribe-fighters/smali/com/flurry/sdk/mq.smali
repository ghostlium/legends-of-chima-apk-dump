.class public abstract Lcom/flurry/sdk/mq;
.super Lcom/flurry/sdk/mm;
.source "SourceFile"


# instance fields
.field protected final b:Lcom/flurry/sdk/mv;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/mv;)V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/flurry/sdk/mm;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/flurry/sdk/mq;->b:Lcom/flurry/sdk/mv;

    .line 23
    return-void
.end method


# virtual methods
.method public abstract a(Ljava/lang/Object;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract h()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end method

.method public abstract i()Ljava/lang/reflect/Member;
.end method

.method protected j()Lcom/flurry/sdk/mv;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/flurry/sdk/mq;->b:Lcom/flurry/sdk/mv;

    return-object v0
.end method

.method public final k()V
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/flurry/sdk/mq;->i()Ljava/lang/reflect/Member;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Member;)V

    .line 41
    return-void
.end method
