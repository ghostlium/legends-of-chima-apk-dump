.class public abstract Lcom/flurry/sdk/oa;
.super Lcom/flurry/sdk/jv;
.source "SourceFile"


# static fields
.field protected static final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/jl",
            "<*>;>;"
        }
    .end annotation
.end field

.field protected static final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/flurry/sdk/jl",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field protected static final c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/sdk/jl",
            "<*>;>;"
        }
    .end annotation
.end field


# instance fields
.field protected d:Lcom/flurry/sdk/ml;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flurry/sdk/oa;->b:Ljava/util/HashMap;

    .line 82
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/py;

    invoke-direct {v2}, Lcom/flurry/sdk/py;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/flurry/sdk/qa;->a:Lcom/flurry/sdk/qa;

    .line 84
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/lang/Character;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/om$a;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/flurry/sdk/om$a;-><init>(Z)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/om$a;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/flurry/sdk/om$a;-><init>(Z)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    new-instance v0, Lcom/flurry/sdk/om$e;

    invoke-direct {v0}, Lcom/flurry/sdk/om$e;-><init>()V

    .line 93
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$f;->a:Lcom/flurry/sdk/om$f;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$f;->a:Lcom/flurry/sdk/om$f;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Byte;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$d;->a:Lcom/flurry/sdk/om$d;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$d;->a:Lcom/flurry/sdk/om$d;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Short;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$d;->a:Lcom/flurry/sdk/om$d;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$d;->a:Lcom/flurry/sdk/om$d;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$c;->a:Lcom/flurry/sdk/om$c;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$c;->a:Lcom/flurry/sdk/om$c;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$b;->a:Lcom/flurry/sdk/om$b;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/om$b;->a:Lcom/flurry/sdk/om$b;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    new-instance v0, Lcom/flurry/sdk/om$g;

    invoke-direct {v0}, Lcom/flurry/sdk/om$g;-><init>()V

    .line 110
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/math/BigInteger;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/math/BigDecimal;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/flurry/sdk/ox;->a:Lcom/flurry/sdk/ox;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/flurry/sdk/pa;->a:Lcom/flurry/sdk/pa;

    .line 117
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/util/Date;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v2, Ljava/sql/Timestamp;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/sql/Date;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/om$h;

    invoke-direct {v2}, Lcom/flurry/sdk/om$h;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    const-class v1, Ljava/sql/Time;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/om$i;

    invoke-direct {v2}, Lcom/flurry/sdk/om$i;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    new-instance v0, Lcom/flurry/sdk/pu;

    invoke-direct {v0}, Lcom/flurry/sdk/pu;-><init>()V

    invoke-virtual {v0}, Lcom/flurry/sdk/pu;->a()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 125
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 126
    instance-of v3, v1, Lcom/flurry/sdk/jl;

    if-eqz v3, :cond_0

    .line 127
    sget-object v3, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    move-object v0, v1

    check-cast v0, Lcom/flurry/sdk/jl;

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 128
    :cond_0
    instance-of v3, v1, Ljava/lang/Class;

    if-eqz v3, :cond_1

    .line 130
    check-cast v1, Ljava/lang/Class;

    .line 131
    sget-object v3, Lcom/flurry/sdk/oa;->b:Ljava/util/HashMap;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 133
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Internal error: unrecognized value of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :cond_2
    sget-object v0, Lcom/flurry/sdk/oa;->b:Ljava/util/HashMap;

    const-class v1, Lcom/flurry/sdk/sg;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/flurry/sdk/qb;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    .line 146
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [Z

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$b;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$b;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [B

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$c;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$c;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [C

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$d;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$d;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [S

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$i;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$i;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [I

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$g;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$g;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [J

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$h;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$h;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [F

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$f;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$f;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    const-class v1, [D

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/flurry/sdk/ps$e;

    invoke-direct {v2}, Lcom/flurry/sdk/ps$e;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 173
    invoke-direct {p0}, Lcom/flurry/sdk/jv;-><init>()V

    .line 160
    sget-object v0, Lcom/flurry/sdk/ml;->a:Lcom/flurry/sdk/ml;

    iput-object v0, p0, Lcom/flurry/sdk/oa;->d:Lcom/flurry/sdk/ml;

    .line 173
    return-void
.end method

.method protected static b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/it;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 733
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v1

    .line 734
    invoke-virtual {v1, p1}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mm;)Ljava/lang/Class;

    move-result-object v0

    .line 735
    if-eqz v0, :cond_0

    const-class v2, Lcom/flurry/sdk/jl$a;

    if-ne v0, v2, :cond_1

    .line 736
    :cond_0
    if-eqz p2, :cond_1

    .line 737
    invoke-interface {p2}, Lcom/flurry/sdk/it;->b()Lcom/flurry/sdk/mq;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mm;)Ljava/lang/Class;

    move-result-object v0

    .line 740
    :cond_1
    if-eqz v0, :cond_2

    const-class v1, Lcom/flurry/sdk/jl$a;

    if-eq v0, v1, :cond_2

    .line 741
    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 743
    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected static b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/flurry/sdk/rx;",
            ">(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mm;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 701
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v2

    .line 703
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->f()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 704
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->k()Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-virtual {v2, p1, v1}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Ljava/lang/Class;

    move-result-object v3

    .line 705
    if-eqz v3, :cond_1

    .line 707
    instance-of v1, p2, Lcom/flurry/sdk/qi;

    if-nez v1, :cond_0

    .line 708
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Illegal key-type annotation: type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a Map type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 711
    :cond_0
    :try_start_0
    move-object v0, p2

    check-cast v0, Lcom/flurry/sdk/qi;

    move-object v1, v0

    invoke-virtual {v1, v3}, Lcom/flurry/sdk/qi;->e(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p2

    .line 718
    :cond_1
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->g()Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-virtual {v2, p1, v1}, Lcom/flurry/sdk/ir;->b(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Ljava/lang/Class;

    move-result-object v1

    .line 719
    if-eqz v1, :cond_2

    .line 721
    :try_start_1
    invoke-virtual {p2, v1}, Lcom/flurry/sdk/rx;->c(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object p2

    .line 727
    :cond_2
    return-object p2

    .line 712
    :catch_0
    move-exception v1

    .line 713
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to narrow key type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " with key-type annotation ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 722
    :catch_1
    move-exception v2

    .line 723
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to narrow content type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " with content-type annotation ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "): "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected static c(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/it;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 749
    invoke-virtual {p0}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v1

    .line 750
    invoke-virtual {v1, p1}, Lcom/flurry/sdk/ir;->d(Lcom/flurry/sdk/mm;)Ljava/lang/Class;

    move-result-object v0

    .line 751
    if-eqz v0, :cond_0

    const-class v2, Lcom/flurry/sdk/jl$a;

    if-ne v0, v2, :cond_1

    .line 752
    :cond_0
    if-eqz p2, :cond_1

    .line 753
    invoke-interface {p2}, Lcom/flurry/sdk/it;->b()Lcom/flurry/sdk/mq;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/ir;->d(Lcom/flurry/sdk/mm;)Ljava/lang/Class;

    move-result-object v0

    .line 756
    :cond_1
    if-eqz v0, :cond_2

    const-class v1, Lcom/flurry/sdk/jl$a;

    if-eq v0, v1, :cond_2

    .line 757
    invoke-virtual {p0, p1, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 759
    :goto_0
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mm;",
            "Lcom/flurry/sdk/it;",
            ")",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 366
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/ir;->b(Lcom/flurry/sdk/mm;)Ljava/lang/Object;

    move-result-object v0

    .line 367
    if-nez v0, :cond_1

    .line 368
    const/4 v0, 0x0

    .line 391
    :cond_0
    :goto_0
    return-object v0

    .line 370
    :cond_1
    instance-of v1, v0, Lcom/flurry/sdk/jl;

    if-eqz v1, :cond_2

    .line 371
    check-cast v0, Lcom/flurry/sdk/jl;

    .line 372
    instance-of v1, v0, Lcom/flurry/sdk/iy;

    if-eqz v1, :cond_0

    .line 373
    check-cast v0, Lcom/flurry/sdk/iy;

    invoke-interface {v0, p1, p3}, Lcom/flurry/sdk/iy;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    goto :goto_0

    .line 380
    :cond_2
    instance-of v1, v0, Ljava/lang/Class;

    if-nez v1, :cond_3

    .line 381
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AnnotationIntrospector returned value of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; expected type JsonSerializer or Class<JsonSerializer> instead"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 383
    :cond_3
    check-cast v0, Ljava/lang/Class;

    .line 384
    const-class v1, Lcom/flurry/sdk/jl;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 385
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AnnotationIntrospector returned Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; expected Class<JsonSerializer>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 387
    :cond_4
    invoke-virtual {p1, p2, v0}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/mm;Ljava/lang/Class;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 388
    instance-of v1, v0, Lcom/flurry/sdk/iy;

    if-eqz v1, :cond_0

    .line 389
    check-cast v0, Lcom/flurry/sdk/iy;

    invoke-interface {v0, p1, p3}, Lcom/flurry/sdk/iy;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qc;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/qc;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 621
    invoke-virtual {p2}, Lcom/flurry/sdk/qc;->p()Ljava/lang/Class;

    move-result-object v0

    .line 622
    const-class v1, [Ljava/lang/String;

    if-ne v1, v0, :cond_1

    .line 623
    new-instance v0, Lcom/flurry/sdk/ps$j;

    invoke-direct {v0, p4}, Lcom/flurry/sdk/ps$j;-><init>(Lcom/flurry/sdk/it;)V

    .line 630
    :cond_0
    :goto_0
    return-object v0

    .line 626
    :cond_1
    sget-object v1, Lcom/flurry/sdk/oa;->c:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jl;

    .line 627
    if-nez v0, :cond_0

    .line 630
    new-instance v0, Lcom/flurry/sdk/pl;

    invoke-virtual {p2}, Lcom/flurry/sdk/qc;->g()Lcom/flurry/sdk/rx;

    move-result-object v1

    move v2, p5

    move-object v3, p6

    move-object v4, p4

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/pl;-><init>(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;)V

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qe;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/qe;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 454
    invoke-virtual {p0}, Lcom/flurry/sdk/oa;->a()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jx;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    move-object v6, p7

    .line 455
    invoke-interface/range {v0 .. v6}, Lcom/flurry/sdk/jx;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qe;Lcom/flurry/sdk/is;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 457
    if-eqz v0, :cond_0

    .line 461
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qf;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/qf;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 477
    invoke-virtual {p0}, Lcom/flurry/sdk/oa;->a()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jx;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    move-object v6, p7

    .line 478
    invoke-interface/range {v0 .. v6}, Lcom/flurry/sdk/jx;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qf;Lcom/flurry/sdk/is;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 480
    if-eqz v0, :cond_0

    .line 500
    :goto_0
    return-object v0

    .line 484
    :cond_1
    invoke-virtual {p2}, Lcom/flurry/sdk/qf;->p()Ljava/lang/Class;

    move-result-object v0

    .line 485
    const-class v1, Ljava/util/EnumSet;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 486
    invoke-virtual/range {p0 .. p7}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v0

    goto :goto_0

    .line 489
    :cond_2
    invoke-virtual {p2}, Lcom/flurry/sdk/qf;->g()Lcom/flurry/sdk/rx;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v1

    .line 490
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/oa;->a(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 491
    const-class v0, Ljava/lang/String;

    if-ne v1, v0, :cond_3

    .line 492
    new-instance v0, Lcom/flurry/sdk/pe;

    invoke-direct {v0, p4}, Lcom/flurry/sdk/pe;-><init>(Lcom/flurry/sdk/it;)V

    goto :goto_0

    .line 494
    :cond_3
    invoke-virtual {p2}, Lcom/flurry/sdk/qf;->g()Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-static {v0, p5, p6, p4, p7}, Lcom/flurry/sdk/pt;->a(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/oz;

    move-result-object v0

    goto :goto_0

    .line 497
    :cond_4
    const-class v0, Ljava/lang/String;

    if-ne v1, v0, :cond_5

    .line 498
    new-instance v0, Lcom/flurry/sdk/px;

    invoke-direct {v0, p4}, Lcom/flurry/sdk/px;-><init>(Lcom/flurry/sdk/it;)V

    goto :goto_0

    .line 500
    :cond_5
    invoke-virtual {p2}, Lcom/flurry/sdk/qf;->g()Lcom/flurry/sdk/rx;

    move-result-object v0

    invoke-static {v0, p5, p6, p4, p7}, Lcom/flurry/sdk/pt;->b(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/oz;

    move-result-object v0

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qh;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/qh;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 545
    invoke-virtual {p0}, Lcom/flurry/sdk/oa;->a()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jx;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    .line 546
    invoke-interface/range {v0 .. v7}, Lcom/flurry/sdk/jx;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qh;Lcom/flurry/sdk/is;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 548
    if-eqz v0, :cond_0

    .line 552
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qi;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/qi;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 567
    invoke-virtual {p0}, Lcom/flurry/sdk/oa;->a()Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/jx;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    .line 568
    invoke-interface/range {v0 .. v7}, Lcom/flurry/sdk/jx;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qi;Lcom/flurry/sdk/is;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 570
    if-eqz v0, :cond_0

    .line 578
    :goto_0
    return-object v0

    .line 574
    :cond_1
    const-class v0, Ljava/util/EnumMap;

    invoke-virtual {p2}, Lcom/flurry/sdk/qi;->p()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    .line 575
    invoke-virtual/range {v0 .. v7}, Lcom/flurry/sdk/oa;->b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v0

    goto :goto_0

    .line 578
    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

    invoke-virtual {p3}, Lcom/flurry/sdk/mw;->c()Lcom/flurry/sdk/mn;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/ir;->c(Lcom/flurry/sdk/mn;)[Ljava/lang/String;

    move-result-object v0

    move-object v1, p2

    move v2, p5

    move-object/from16 v3, p7

    move-object v4, p4

    move-object v5, p6

    move-object/from16 v6, p8

    invoke-static/range {v0 .. v6}, Lcom/flurry/sdk/pi;->a([Ljava/lang/String;Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/pi;

    move-result-object v0

    goto :goto_0
.end method

.method public final a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 339
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    .line 342
    const-class v1, Ljava/util/Iterator;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 343
    invoke-virtual/range {p0 .. p5}, Lcom/flurry/sdk/oa;->c(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 351
    :goto_0
    return-object v0

    .line 345
    :cond_0
    const-class v1, Ljava/lang/Iterable;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 346
    invoke-virtual/range {p0 .. p5}, Lcom/flurry/sdk/oa;->d(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;

    move-result-object v0

    goto :goto_0

    .line 348
    :cond_1
    const-class v1, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 349
    sget-object v0, Lcom/flurry/sdk/qa;->a:Lcom/flurry/sdk/qa;

    goto :goto_0

    .line 351
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 510
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->g()Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 512
    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->r()Z

    move-result v1

    if-nez v1, :cond_0

    .line 513
    const/4 v0, 0x0

    .line 515
    :cond_0
    invoke-static {v0, p4}, Lcom/flurry/sdk/pt;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    return-object v0
.end method

.method public final a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 239
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v1

    .line 240
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 241
    sget-object v1, Lcom/flurry/sdk/oa;->a:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flurry/sdk/jl;

    .line 242
    if-eqz v1, :cond_0

    .line 254
    :goto_0
    return-object v1

    .line 245
    :cond_0
    sget-object v1, Lcom/flurry/sdk/oa;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 246
    if-eqz v1, :cond_1

    .line 248
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/flurry/sdk/jl;

    move-object v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 249
    :catch_0
    move-exception v2

    .line 250
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to instantiate standard serializer (of type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "): "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 254
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/flurry/sdk/rx;",
            ">(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mm;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 684
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/ir;->e(Lcom/flurry/sdk/mm;)Ljava/lang/Class;

    move-result-object v0

    .line 685
    if-eqz v0, :cond_0

    .line 687
    :try_start_0
    invoke-virtual {p3, v0}, Lcom/flurry/sdk/rx;->h(Ljava/lang/Class;)Lcom/flurry/sdk/rx;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p3

    .line 692
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/flurry/sdk/oa;->b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/rx;

    move-result-object v0

    return-object v0

    .line 688
    :catch_0
    move-exception v1

    .line 689
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to widen type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with concrete-type annotation (value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "), method \'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/flurry/sdk/mm;->b()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\': "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected abstract a()Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/flurry/sdk/jx;",
            ">;"
        }
    .end annotation
.end method

.method protected a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 774
    if-eqz p3, :cond_1

    .line 804
    :cond_0
    :goto_0
    return v0

    .line 777
    :cond_1
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v2

    .line 778
    invoke-virtual {p2}, Lcom/flurry/sdk/mw;->c()Lcom/flurry/sdk/mn;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flurry/sdk/ir;->f(Lcom/flurry/sdk/mm;)Lcom/flurry/sdk/kg$b;

    move-result-object v3

    .line 779
    if-eqz v3, :cond_2

    .line 780
    sget-object v4, Lcom/flurry/sdk/kg$b;->b:Lcom/flurry/sdk/kg$b;

    if-ne v3, v4, :cond_3

    move v0, v1

    .line 781
    goto :goto_0

    .line 784
    :cond_2
    sget-object v3, Lcom/flurry/sdk/ju$a;->h:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p1, v3}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v0, v1

    .line 785
    goto :goto_0

    .line 791
    :cond_3
    if-eqz p4, :cond_0

    .line 792
    invoke-interface {p4}, Lcom/flurry/sdk/it;->a()Lcom/flurry/sdk/rx;

    move-result-object v3

    .line 793
    invoke-virtual {v3}, Lcom/flurry/sdk/rx;->f()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 794
    invoke-interface {p4}, Lcom/flurry/sdk/it;->b()Lcom/flurry/sdk/mq;

    move-result-object v4

    invoke-interface {p4}, Lcom/flurry/sdk/it;->a()Lcom/flurry/sdk/rx;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/flurry/sdk/ir;->b(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Ljava/lang/Class;

    move-result-object v4

    if-eqz v4, :cond_4

    move v0, v1

    .line 795
    goto :goto_0

    .line 797
    :cond_4
    instance-of v3, v3, Lcom/flurry/sdk/qi;

    if-eqz v3, :cond_0

    .line 798
    invoke-interface {p4}, Lcom/flurry/sdk/it;->b()Lcom/flurry/sdk/mq;

    move-result-object v3

    invoke-interface {p4}, Lcom/flurry/sdk/it;->a()Lcom/flurry/sdk/rx;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/mm;Lcom/flurry/sdk/rx;)Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_0

    move v0, v1

    .line 799
    goto :goto_0
.end method

.method protected a(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 523
    const-class v0, Ljava/util/RandomAccess;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 404
    invoke-virtual/range {p2 .. p2}, Lcom/flurry/sdk/rx;->g()Lcom/flurry/sdk/rx;

    move-result-object v4

    .line 405
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v4, v2}, Lcom/flurry/sdk/oa;->b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jz;

    move-result-object v11

    .line 408
    if-eqz v11, :cond_0

    .line 409
    const/4 v9, 0x0

    .line 413
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/flurry/sdk/mw;->c()Lcom/flurry/sdk/mn;

    move-result-object v4

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-static {v0, v4, v1}, Lcom/flurry/sdk/oa;->c(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v12

    .line 416
    invoke-virtual/range {p2 .. p2}, Lcom/flurry/sdk/rx;->j()Z

    move-result v4

    if-eqz v4, :cond_2

    move-object/from16 v6, p2

    .line 417
    check-cast v6, Lcom/flurry/sdk/qh;

    .line 418
    invoke-virtual/range {p3 .. p3}, Lcom/flurry/sdk/mw;->c()Lcom/flurry/sdk/mn;

    move-result-object v4

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-static {v0, v4, v1}, Lcom/flurry/sdk/oa;->b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v10

    .line 419
    invoke-virtual {v6}, Lcom/flurry/sdk/qh;->l()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 420
    check-cast v6, Lcom/flurry/sdk/qi;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    invoke-virtual/range {v4 .. v12}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qi;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v4

    .line 439
    :goto_1
    return-object v4

    .line 410
    :cond_0
    if-nez p5, :cond_6

    .line 411
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v11, v3}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)Z

    move-result v9

    goto :goto_0

    :cond_1
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    .line 423
    invoke-virtual/range {v4 .. v12}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qh;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jl;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v4

    goto :goto_1

    .line 426
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/flurry/sdk/rx;->i()Z

    move-result v4

    if-eqz v4, :cond_4

    move-object/from16 v15, p2

    .line 427
    check-cast v15, Lcom/flurry/sdk/qe;

    .line 428
    invoke-virtual {v15}, Lcom/flurry/sdk/qe;->a_()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 429
    check-cast v15, Lcom/flurry/sdk/qf;

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v16, p3

    move-object/from16 v17, p4

    move/from16 v18, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    invoke-virtual/range {v13 .. v20}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qf;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v4

    goto :goto_1

    :cond_3
    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v16, p3

    move-object/from16 v17, p4

    move/from16 v18, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    .line 432
    invoke-virtual/range {v13 .. v20}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qe;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v4

    goto :goto_1

    .line 435
    :cond_4
    invoke-virtual/range {p2 .. p2}, Lcom/flurry/sdk/rx;->b()Z

    move-result v4

    if-eqz v4, :cond_5

    move-object/from16 v15, p2

    .line 436
    check-cast v15, Lcom/flurry/sdk/qc;

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v16, p3

    move-object/from16 v17, p4

    move/from16 v18, v9

    move-object/from16 v19, v11

    move-object/from16 v20, v12

    invoke-virtual/range {v13 .. v20}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/qc;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;

    move-result-object v4

    goto :goto_1

    .line 439
    :cond_5
    const/4 v4, 0x0

    goto :goto_1

    :cond_6
    move/from16 v9, p5

    goto/16 :goto_0
.end method

.method protected b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/jl;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z",
            "Lcom/flurry/sdk/jz;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 594
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->k()Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 596
    const/4 v3, 0x0

    .line 597
    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->r()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 599
    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    .line 600
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/sdk/qv;->a(Ljava/lang/Class;Lcom/flurry/sdk/ir;)Lcom/flurry/sdk/qv;

    move-result-object v3

    .line 602
    :cond_0
    new-instance v0, Lcom/flurry/sdk/pb;

    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->g()Lcom/flurry/sdk/rx;

    move-result-object v1

    move v2, p5

    move-object v4, p6

    move-object v5, p4

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/flurry/sdk/pb;-><init>(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/qv;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;Lcom/flurry/sdk/jl;)V

    return-object v0
.end method

.method public final b(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 270
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v1

    .line 272
    const-class v0, Lcom/flurry/sdk/jj;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 273
    const-class v0, Lcom/flurry/sdk/jk;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 274
    sget-object v0, Lcom/flurry/sdk/pp;->a:Lcom/flurry/sdk/pp;

    .line 323
    :cond_0
    :goto_0
    return-object v0

    .line 276
    :cond_1
    sget-object v0, Lcom/flurry/sdk/po;->a:Lcom/flurry/sdk/po;

    goto :goto_0

    .line 279
    :cond_2
    invoke-virtual {p3}, Lcom/flurry/sdk/mw;->e()Lcom/flurry/sdk/mr;

    move-result-object v0

    .line 280
    if-eqz v0, :cond_4

    .line 282
    invoke-virtual {v0}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v1

    .line 283
    sget-object v2, Lcom/flurry/sdk/ju$a;->e:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p2, v2}, Lcom/flurry/sdk/ju;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 284
    invoke-static {v1}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Member;)V

    .line 286
    :cond_3
    invoke-virtual {p0, p2, v0, p4}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mm;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v2

    .line 287
    new-instance v0, Lcom/flurry/sdk/ph;

    invoke-direct {v0, v1, v2, p4}, Lcom/flurry/sdk/ph;-><init>(Ljava/lang/reflect/Method;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/it;)V

    goto :goto_0

    .line 291
    :cond_4
    const-class v0, Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 292
    sget-object v0, Lcom/flurry/sdk/pf;->a:Lcom/flurry/sdk/pf;

    goto :goto_0

    .line 295
    :cond_5
    const-class v0, Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 296
    sget-object v0, Lcom/flurry/sdk/pz;->a:Lcom/flurry/sdk/pz;

    goto :goto_0

    .line 299
    :cond_6
    const-class v0, Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 300
    sget-object v0, Lcom/flurry/sdk/qa;->a:Lcom/flurry/sdk/qa;

    goto :goto_0

    .line 304
    :cond_7
    iget-object v0, p0, Lcom/flurry/sdk/oa;->d:Lcom/flurry/sdk/ml;

    invoke-virtual {v0, p2, p1}, Lcom/flurry/sdk/ml;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 305
    if-nez v0, :cond_0

    .line 309
    const-class v0, Ljava/lang/Number;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 310
    sget-object v0, Lcom/flurry/sdk/om$g;->a:Lcom/flurry/sdk/om$g;

    goto :goto_0

    .line 312
    :cond_8
    const-class v0, Ljava/lang/Enum;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 315
    invoke-static {v1, p2, p3}, Lcom/flurry/sdk/pc;->a(Ljava/lang/Class;Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;)Lcom/flurry/sdk/pc;

    move-result-object v0

    goto :goto_0

    .line 317
    :cond_9
    const-class v0, Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 318
    sget-object v0, Lcom/flurry/sdk/ox;->a:Lcom/flurry/sdk/ox;

    goto :goto_0

    .line 320
    :cond_a
    const-class v0, Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 321
    sget-object v0, Lcom/flurry/sdk/pa;->a:Lcom/flurry/sdk/pa;

    goto :goto_0

    .line 323
    :cond_b
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jz;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 196
    invoke-virtual {p2}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/ju;->c(Ljava/lang/Class;)Lcom/flurry/sdk/is;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/mw;

    .line 197
    invoke-virtual {v0}, Lcom/flurry/sdk/mw;->c()Lcom/flurry/sdk/mn;

    move-result-object v0

    .line 198
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->a()Lcom/flurry/sdk/ir;

    move-result-object v3

    .line 199
    invoke-virtual {v3, p1, v0, p2}, Lcom/flurry/sdk/ir;->a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mn;Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;

    move-result-object v2

    .line 204
    if-nez v2, :cond_0

    .line 205
    invoke-virtual {p1, p2}, Lcom/flurry/sdk/ju;->d(Lcom/flurry/sdk/rx;)Lcom/flurry/sdk/ni;

    move-result-object v0

    move-object v2, v0

    move-object v0, v1

    .line 209
    :goto_0
    if-nez v2, :cond_1

    move-object v0, v1

    :goto_1
    return-object v0

    .line 207
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ju;->l()Lcom/flurry/sdk/ng;

    move-result-object v4

    invoke-virtual {v4, v0, p1, v3}, Lcom/flurry/sdk/ng;->a(Lcom/flurry/sdk/mn;Lcom/flurry/sdk/jo;Lcom/flurry/sdk/ir;)Ljava/util/Collection;

    move-result-object v0

    goto :goto_0

    .line 209
    :cond_1
    invoke-interface {v2, p1, p2, v0, p3}, Lcom/flurry/sdk/ni;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Ljava/util/Collection;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jz;

    move-result-object v0

    goto :goto_1
.end method

.method protected c(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 645
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/rx;->b(I)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 646
    if-nez v0, :cond_0

    .line 647
    invoke-static {}, Lcom/flurry/sdk/qm;->b()Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 649
    :cond_0
    invoke-virtual {p0, p1, v0, p4}, Lcom/flurry/sdk/oa;->b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jz;

    move-result-object v1

    .line 650
    invoke-virtual {p0, p1, p3, v1, p4}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)Z

    move-result v2

    invoke-static {v0, v2, v1, p4}, Lcom/flurry/sdk/pt;->a(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/oz;

    move-result-object v0

    return-object v0
.end method

.method protected d(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/it;Z)Lcom/flurry/sdk/jl;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ju;",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/mw;",
            "Lcom/flurry/sdk/it;",
            "Z)",
            "Lcom/flurry/sdk/jl",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 659
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/rx;->b(I)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 660
    if-nez v0, :cond_0

    .line 661
    invoke-static {}, Lcom/flurry/sdk/qm;->b()Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 663
    :cond_0
    invoke-virtual {p0, p1, v0, p4}, Lcom/flurry/sdk/oa;->b(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/rx;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/jz;

    move-result-object v1

    .line 664
    invoke-virtual {p0, p1, p3, v1, p4}, Lcom/flurry/sdk/oa;->a(Lcom/flurry/sdk/ju;Lcom/flurry/sdk/mw;Lcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)Z

    move-result v2

    invoke-static {v0, v2, v1, p4}, Lcom/flurry/sdk/pt;->b(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/jz;Lcom/flurry/sdk/it;)Lcom/flurry/sdk/oz;

    move-result-object v0

    return-object v0
.end method
