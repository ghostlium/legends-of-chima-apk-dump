.class public Lcom/flurry/sdk/mb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jm;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/mb;->a:Ljava/util/HashMap;

    .line 34
    new-instance v0, Lcom/flurry/sdk/ma$a;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$a;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 35
    new-instance v0, Lcom/flurry/sdk/ma$b;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$b;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 36
    new-instance v0, Lcom/flurry/sdk/ma$d;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$d;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 37
    new-instance v0, Lcom/flurry/sdk/ma$k;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$k;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 38
    new-instance v0, Lcom/flurry/sdk/ma$i;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$i;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 39
    new-instance v0, Lcom/flurry/sdk/ma$j;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$j;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 40
    new-instance v0, Lcom/flurry/sdk/ma$h;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$h;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 41
    new-instance v0, Lcom/flurry/sdk/ma$f;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$f;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 42
    new-instance v0, Lcom/flurry/sdk/ma$e;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$e;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 43
    new-instance v0, Lcom/flurry/sdk/ma$c;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$c;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 44
    new-instance v0, Lcom/flurry/sdk/ma$o;

    invoke-direct {v0}, Lcom/flurry/sdk/ma$o;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mb;->a(Lcom/flurry/sdk/ma;)V

    .line 45
    return-void
.end method

.method public static a(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/jm;
    .locals 1

    .prologue
    .line 69
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/ma$n;->a(Ljava/lang/Class;)Lcom/flurry/sdk/ma$n;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/flurry/sdk/qu;)Lcom/flurry/sdk/jm;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/qu",
            "<*>;)",
            "Lcom/flurry/sdk/jm;"
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lcom/flurry/sdk/ma$g;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/sdk/ma$g;-><init>(Lcom/flurry/sdk/qu;Lcom/flurry/sdk/mr;)V

    return-object v0
.end method

.method public static a(Lcom/flurry/sdk/qu;Lcom/flurry/sdk/mr;)Lcom/flurry/sdk/jm;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/qu",
            "<*>;",
            "Lcom/flurry/sdk/mr;",
            ")",
            "Lcom/flurry/sdk/jm;"
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Lcom/flurry/sdk/ma$g;

    invoke-direct {v0, p0, p1}, Lcom/flurry/sdk/ma$g;-><init>(Lcom/flurry/sdk/qu;Lcom/flurry/sdk/mr;)V

    return-object v0
.end method

.method public static a()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jm;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    new-instance v0, Lcom/flurry/sdk/mb;

    invoke-direct {v0}, Lcom/flurry/sdk/mb;-><init>()V

    iget-object v0, v0, Lcom/flurry/sdk/mb;->a:Ljava/util/HashMap;

    return-object v0
.end method

.method private a(Lcom/flurry/sdk/ma;)V
    .locals 3

    .prologue
    .line 49
    invoke-virtual {p1}, Lcom/flurry/sdk/ma;->a()Ljava/lang/Class;

    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/flurry/sdk/mb;->a:Ljava/util/HashMap;

    invoke-static {}, Lcom/flurry/sdk/qm;->a()Lcom/flurry/sdk/qm;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/flurry/sdk/qm;->a(Ljava/lang/Class;)Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    return-void
.end method

.method public static b(Lcom/flurry/sdk/iz;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/jm;
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 86
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/iz;->b(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/is;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mw;

    .line 88
    new-array v1, v4, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/mw;->a([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 89
    if-eqz v1, :cond_1

    .line 90
    sget-object v0, Lcom/flurry/sdk/iz$a;->f:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    invoke-static {v1}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Member;)V

    .line 93
    :cond_0
    new-instance v0, Lcom/flurry/sdk/ma$l;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/ma$l;-><init>(Ljava/lang/reflect/Constructor;)V

    .line 106
    :goto_0
    return-object v0

    .line 98
    :cond_1
    new-array v1, v4, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/mw;->b([Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 99
    if-eqz v1, :cond_3

    .line 100
    sget-object v0, Lcom/flurry/sdk/iz$a;->f:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 101
    invoke-static {v1}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Member;)V

    .line 103
    :cond_2
    new-instance v0, Lcom/flurry/sdk/ma$m;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/ma$m;-><init>(Ljava/lang/reflect/Method;)V

    goto :goto_0

    .line 106
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method
