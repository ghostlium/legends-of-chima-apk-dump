.class public abstract Lcom/flurry/sdk/ps$a;
.super Lcom/flurry/sdk/oz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/flurry/sdk/oz",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final e:Lcom/flurry/sdk/jz;

.field protected final f:Lcom/flurry/sdk/it;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/it;",
            ")V"
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/flurry/sdk/oz;-><init>(Ljava/lang/Class;)V

    .line 47
    iput-object p2, p0, Lcom/flurry/sdk/ps$a;->e:Lcom/flurry/sdk/jz;

    .line 48
    iput-object p3, p0, Lcom/flurry/sdk/ps$a;->f:Lcom/flurry/sdk/it;

    .line 49
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->b()V

    .line 56
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ps$a;->b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 57
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->c()V

    .line 58
    return-void
.end method

.method public final a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            "Lcom/flurry/sdk/jz;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->c(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 66
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ps$a;->b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 67
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->f(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 68
    return-void
.end method

.method protected abstract b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation
.end method
