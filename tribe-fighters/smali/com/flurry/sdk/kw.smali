.class Lcom/flurry/sdk/kw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/qd;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/kw;->a:Ljava/util/HashMap;

    .line 34
    new-instance v0, Lcom/flurry/sdk/mj;

    invoke-direct {v0}, Lcom/flurry/sdk/mj;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 37
    new-instance v0, Lcom/flurry/sdk/mf;

    invoke-direct {v0}, Lcom/flurry/sdk/mf;-><init>()V

    .line 38
    const-class v1, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;Ljava/lang/Class;)V

    .line 39
    const-class v1, Ljava/lang/CharSequence;

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;Ljava/lang/Class;)V

    .line 40
    new-instance v0, Lcom/flurry/sdk/lm;

    invoke-direct {v0}, Lcom/flurry/sdk/lm;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 43
    new-instance v0, Lcom/flurry/sdk/lz$c;

    const-class v1, Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$c;-><init>(Ljava/lang/Class;Ljava/lang/Boolean;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 44
    new-instance v0, Lcom/flurry/sdk/lz$d;

    const-class v1, Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$d;-><init>(Ljava/lang/Class;Ljava/lang/Byte;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 45
    new-instance v0, Lcom/flurry/sdk/lz$l;

    const-class v1, Ljava/lang/Short;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$l;-><init>(Ljava/lang/Class;Ljava/lang/Short;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 46
    new-instance v0, Lcom/flurry/sdk/lz$e;

    const-class v1, Ljava/lang/Character;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$e;-><init>(Ljava/lang/Class;Ljava/lang/Character;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 47
    new-instance v0, Lcom/flurry/sdk/lz$h;

    const-class v1, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$h;-><init>(Ljava/lang/Class;Ljava/lang/Integer;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 48
    new-instance v0, Lcom/flurry/sdk/lz$i;

    const-class v1, Ljava/lang/Long;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$i;-><init>(Ljava/lang/Class;Ljava/lang/Long;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 49
    new-instance v0, Lcom/flurry/sdk/lz$g;

    const-class v1, Ljava/lang/Float;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$g;-><init>(Ljava/lang/Class;Ljava/lang/Float;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 50
    new-instance v0, Lcom/flurry/sdk/lz$f;

    const-class v1, Ljava/lang/Double;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$f;-><init>(Ljava/lang/Class;Ljava/lang/Double;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 55
    new-instance v0, Lcom/flurry/sdk/lz$c;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$c;-><init>(Ljava/lang/Class;Ljava/lang/Boolean;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 56
    new-instance v0, Lcom/flurry/sdk/lz$d;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$d;-><init>(Ljava/lang/Class;Ljava/lang/Byte;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 57
    new-instance v0, Lcom/flurry/sdk/lz$l;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$l;-><init>(Ljava/lang/Class;Ljava/lang/Short;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 58
    new-instance v0, Lcom/flurry/sdk/lz$e;

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$e;-><init>(Ljava/lang/Class;Ljava/lang/Character;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 59
    new-instance v0, Lcom/flurry/sdk/lz$h;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$h;-><init>(Ljava/lang/Class;Ljava/lang/Integer;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 60
    new-instance v0, Lcom/flurry/sdk/lz$i;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$i;-><init>(Ljava/lang/Class;Ljava/lang/Long;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 61
    new-instance v0, Lcom/flurry/sdk/lz$g;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$g;-><init>(Ljava/lang/Class;Ljava/lang/Float;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 62
    new-instance v0, Lcom/flurry/sdk/lz$f;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/flurry/sdk/lz$f;-><init>(Ljava/lang/Class;Ljava/lang/Double;)V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 65
    new-instance v0, Lcom/flurry/sdk/lz$j;

    invoke-direct {v0}, Lcom/flurry/sdk/lz$j;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 66
    new-instance v0, Lcom/flurry/sdk/lz$a;

    invoke-direct {v0}, Lcom/flurry/sdk/lz$a;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 67
    new-instance v0, Lcom/flurry/sdk/lz$b;

    invoke-direct {v0}, Lcom/flurry/sdk/lz$b;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 69
    new-instance v0, Lcom/flurry/sdk/ll;

    invoke-direct {v0}, Lcom/flurry/sdk/ll;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 70
    new-instance v0, Lcom/flurry/sdk/lp;

    invoke-direct {v0}, Lcom/flurry/sdk/lp;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 74
    new-instance v0, Lcom/flurry/sdk/ll;

    const-class v1, Ljava/util/GregorianCalendar;

    invoke-direct {v0, v1}, Lcom/flurry/sdk/ll;-><init>(Ljava/lang/Class;)V

    const-class v1, Ljava/util/GregorianCalendar;

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;Ljava/lang/Class;)V

    .line 76
    new-instance v0, Lcom/flurry/sdk/lz$m;

    invoke-direct {v0}, Lcom/flurry/sdk/lz$m;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 77
    new-instance v0, Lcom/flurry/sdk/mh;

    invoke-direct {v0}, Lcom/flurry/sdk/mh;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 80
    invoke-static {}, Lcom/flurry/sdk/lt;->d()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/lt;

    .line 81
    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    goto :goto_0

    .line 87
    :cond_0
    new-instance v0, Lcom/flurry/sdk/lz$n;

    invoke-direct {v0}, Lcom/flurry/sdk/lz$n;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 91
    new-instance v0, Lcom/flurry/sdk/li;

    invoke-direct {v0}, Lcom/flurry/sdk/li;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 94
    new-instance v0, Lcom/flurry/sdk/mi;

    invoke-direct {v0}, Lcom/flurry/sdk/mi;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 95
    new-instance v0, Lcom/flurry/sdk/lu;

    invoke-direct {v0}, Lcom/flurry/sdk/lu;-><init>()V

    invoke-direct {p0, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;)V

    .line 96
    return-void
.end method

.method public static a()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/qd;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 103
    new-instance v0, Lcom/flurry/sdk/kw;

    invoke-direct {v0}, Lcom/flurry/sdk/kw;-><init>()V

    iget-object v0, v0, Lcom/flurry/sdk/kw;->a:Ljava/util/HashMap;

    return-object v0
.end method

.method private a(Lcom/flurry/sdk/lz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/lz",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 108
    invoke-virtual {p1}, Lcom/flurry/sdk/lz;->f()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/flurry/sdk/kw;->a(Lcom/flurry/sdk/lz;Ljava/lang/Class;)V

    .line 109
    return-void
.end method

.method private a(Lcom/flurry/sdk/lz;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/lz",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 115
    .line 117
    iget-object v0, p0, Lcom/flurry/sdk/kw;->a:Ljava/util/HashMap;

    new-instance v1, Lcom/flurry/sdk/qd;

    invoke-direct {v1, p2}, Lcom/flurry/sdk/qd;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    return-void
.end method
