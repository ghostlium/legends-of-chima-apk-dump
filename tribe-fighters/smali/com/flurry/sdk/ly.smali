.class public Lcom/flurry/sdk/ly;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/ly$e;,
        Lcom/flurry/sdk/ly$f;,
        Lcom/flurry/sdk/ly$h;,
        Lcom/flurry/sdk/ly$g;,
        Lcom/flurry/sdk/ly$i;,
        Lcom/flurry/sdk/ly$c;,
        Lcom/flurry/sdk/ly$b;,
        Lcom/flurry/sdk/ly$d;,
        Lcom/flurry/sdk/ly$j;,
        Lcom/flurry/sdk/ly$a;
    }
.end annotation


# static fields
.field static final b:Lcom/flurry/sdk/ly;


# instance fields
.field a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/flurry/sdk/ly;

    invoke-direct {v0}, Lcom/flurry/sdk/ly;-><init>()V

    sput-object v0, Lcom/flurry/sdk/ly;->b:Lcom/flurry/sdk/ly;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/sdk/ly;->a:Ljava/util/HashMap;

    .line 30
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$b;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$b;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 36
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$c;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$c;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 37
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$i;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$i;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 38
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$g;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$g;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 39
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$h;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$h;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 41
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$f;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$f;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 42
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$e;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$e;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 44
    const-class v0, Ljava/lang/String;

    new-instance v1, Lcom/flurry/sdk/ly$j;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$j;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 48
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    new-instance v1, Lcom/flurry/sdk/ly$d;

    invoke-direct {v1}, Lcom/flurry/sdk/ly$d;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/ly;->a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V

    .line 49
    return-void
.end method

.method public static a()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jh",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 53
    sget-object v0, Lcom/flurry/sdk/ly;->b:Lcom/flurry/sdk/ly;

    iget-object v0, v0, Lcom/flurry/sdk/ly;->a:Ljava/util/HashMap;

    return-object v0
.end method

.method private a(Ljava/lang/Class;Lcom/flurry/sdk/jh;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jh",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/flurry/sdk/ly;->a:Ljava/util/HashMap;

    invoke-static {}, Lcom/flurry/sdk/qm;->a()Lcom/flurry/sdk/qm;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flurry/sdk/qm;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    return-void
.end method
