.class public Lcom/flurry/sdk/mk;
.super Lcom/flurry/sdk/ji;
.source "SourceFile"


# instance fields
.field protected final c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/hq;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/hq;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/ji;-><init>(Ljava/lang/String;Lcom/flurry/sdk/hq;)V

    .line 37
    iput-object p3, p0, Lcom/flurry/sdk/mk;->c:Ljava/lang/Class;

    .line 38
    iput-object p4, p0, Lcom/flurry/sdk/mk;->d:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public static a(Lcom/flurry/sdk/ht;Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/mk;
    .locals 4

    .prologue
    .line 43
    if-nez p1, :cond_0

    .line 44
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 47
    :cond_0
    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_1

    move-object v0, p1

    .line 48
    check-cast v0, Ljava/lang/Class;

    .line 52
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized field \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" (Class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "), not marked as ignorable"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 53
    new-instance v2, Lcom/flurry/sdk/mk;

    invoke-virtual {p0}, Lcom/flurry/sdk/ht;->i()Lcom/flurry/sdk/hq;

    move-result-object v3

    invoke-direct {v2, v1, v3, v0, p2}, Lcom/flurry/sdk/mk;-><init>(Ljava/lang/String;Lcom/flurry/sdk/hq;Ljava/lang/Class;Ljava/lang/String;)V

    .line 55
    invoke-virtual {v2, p1, p2}, Lcom/flurry/sdk/mk;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    return-object v2

    .line 50
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method
