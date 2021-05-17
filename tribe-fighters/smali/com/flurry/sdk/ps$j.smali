.class public final Lcom/flurry/sdk/ps$j;
.super Lcom/flurry/sdk/ps$a;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/jt;


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "j"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/ps$a",
        "<[",
        "Ljava/lang/String;",
        ">;",
        "Lcom/flurry/sdk/jt;"
    }
.end annotation


# instance fields
.field protected a:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/it;)V
    .locals 2

    .prologue
    .line 97
    const-class v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/flurry/sdk/ps$a;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)V

    .line 98
    return-void
.end method

.method private a([Ljava/lang/String;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jl;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/hp;",
            "Lcom/flurry/sdk/jw;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 144
    const/4 v0, 0x0

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_1

    .line 145
    aget-object v2, p1, v0

    .line 146
    if-nez v2, :cond_0

    .line 147
    invoke-virtual {p3, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/hp;)V

    .line 144
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 149
    :cond_0
    aget-object v2, p1, v0

    invoke-virtual {p4, v2, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_1

    .line 152
    :cond_1
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jz;)Lcom/flurry/sdk/oz;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jz;",
            ")",
            "Lcom/flurry/sdk/oz",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 106
    return-object p0
.end method

.method public a(Lcom/flurry/sdk/jw;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 162
    const-class v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flurry/sdk/ps$j;->f:Lcom/flurry/sdk/it;

    invoke-virtual {p1, v0, v1}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 164
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/flurry/sdk/kb;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    if-nez v1, :cond_0

    .line 165
    iput-object v0, p0, Lcom/flurry/sdk/ps$j;->a:Lcom/flurry/sdk/jl;

    .line 167
    :cond_0
    return-void
.end method

.method public a([Ljava/lang/String;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 113
    array-length v1, p1

    .line 114
    if-nez v1, :cond_1

    .line 138
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/ps$j;->a:Lcom/flurry/sdk/jl;

    if-eqz v0, :cond_2

    .line 118
    iget-object v0, p0, Lcom/flurry/sdk/ps$j;->a:Lcom/flurry/sdk/jl;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/flurry/sdk/ps$j;->a([Ljava/lang/String;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jl;)V

    goto :goto_0

    .line 129
    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_0

    .line 130
    aget-object v2, p1, v0

    .line 131
    if-nez v2, :cond_3

    .line 132
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->f()V

    .line 129
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 135
    :cond_3
    aget-object v2, p1, v0

    invoke-virtual {p2, v2}, Lcom/flurry/sdk/hp;->b(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public synthetic b(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 83
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ps$j;->a([Ljava/lang/String;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method
