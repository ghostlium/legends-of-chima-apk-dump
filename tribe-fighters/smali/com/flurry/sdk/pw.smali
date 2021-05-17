.class public Lcom/flurry/sdk/pw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/pw$a;,
        Lcom/flurry/sdk/pw$b;,
        Lcom/flurry/sdk/pw$c;
    }
.end annotation


# static fields
.field protected static final a:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected static final b:Lcom/flurry/sdk/jl;
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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    new-instance v0, Lcom/flurry/sdk/pv;

    invoke-direct {v0}, Lcom/flurry/sdk/pv;-><init>()V

    sput-object v0, Lcom/flurry/sdk/pw;->a:Lcom/flurry/sdk/jl;

    .line 18
    new-instance v0, Lcom/flurry/sdk/pw$c;

    invoke-direct {v0}, Lcom/flurry/sdk/pw$c;-><init>()V

    sput-object v0, Lcom/flurry/sdk/pw;->b:Lcom/flurry/sdk/jl;

    return-void
.end method

.method public static a(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 26
    if-nez p0, :cond_0

    .line 27
    sget-object v0, Lcom/flurry/sdk/pw;->a:Lcom/flurry/sdk/jl;

    .line 44
    :goto_0
    return-object v0

    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    .line 30
    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_1

    .line 31
    sget-object v0, Lcom/flurry/sdk/pw;->b:Lcom/flurry/sdk/jl;

    goto :goto_0

    .line 33
    :cond_1
    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    .line 34
    sget-object v0, Lcom/flurry/sdk/pw;->a:Lcom/flurry/sdk/jl;

    goto :goto_0

    .line 37
    :cond_2
    const-class v1, Ljava/util/Date;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 38
    sget-object v0, Lcom/flurry/sdk/pw$b;->a:Lcom/flurry/sdk/jl;

    goto :goto_0

    .line 40
    :cond_3
    const-class v1, Ljava/util/Calendar;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 41
    sget-object v0, Lcom/flurry/sdk/pw$a;->a:Lcom/flurry/sdk/jl;

    goto :goto_0

    .line 44
    :cond_4
    sget-object v0, Lcom/flurry/sdk/pw;->a:Lcom/flurry/sdk/jl;

    goto :goto_0
.end method
