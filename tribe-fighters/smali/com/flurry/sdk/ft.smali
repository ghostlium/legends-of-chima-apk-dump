.class public Lcom/flurry/sdk/ft;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/gd;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/ft$2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/flurry/sdk/gd",
        "<TD;>;"
    }
.end annotation


# static fields
.field private static final f:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/fm;",
            "Ljava/util/Map",
            "<",
            "Lcom/flurry/sdk/fm;",
            "Lcom/flurry/sdk/gk;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lcom/flurry/sdk/fs;

.field private b:Lcom/flurry/sdk/fm;

.field private c:Lcom/flurry/sdk/fm;

.field private d:Lcom/flurry/sdk/gk;

.field private final e:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 91
    new-instance v0, Lcom/flurry/sdk/ft$1;

    invoke-direct {v0}, Lcom/flurry/sdk/ft$1;-><init>()V

    sput-object v0, Lcom/flurry/sdk/ft;->f:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-static {}, Lcom/flurry/sdk/fs;->a()Lcom/flurry/sdk/fs;

    move-result-object v0

    invoke-direct {p0, v1, v1, v0}, Lcom/flurry/sdk/ft;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fs;)V

    .line 47
    return-void
.end method

.method protected constructor <init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fs;)V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/ft;->d:Lcom/flurry/sdk/gk;

    .line 60
    iput-object p1, p0, Lcom/flurry/sdk/ft;->b:Lcom/flurry/sdk/fm;

    .line 61
    iput-object p2, p0, Lcom/flurry/sdk/ft;->c:Lcom/flurry/sdk/fm;

    .line 62
    iput-object p3, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    .line 63
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/sdk/ft;->e:Ljava/lang/Thread;

    .line 64
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/sdk/fs;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    return-object v0
.end method

.method protected final a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/gk;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    .line 107
    iget-object v0, p0, Lcom/flurry/sdk/ft;->e:Ljava/lang/Thread;

    if-ne v2, v0, :cond_1

    iget-object v0, p0, Lcom/flurry/sdk/ft;->d:Lcom/flurry/sdk/gk;

    if-eqz v0, :cond_1

    .line 108
    iget-object v0, p0, Lcom/flurry/sdk/ft;->d:Lcom/flurry/sdk/gk;

    .line 127
    :cond_0
    :goto_0
    return-object v0

    .line 111
    :cond_1
    sget-object v0, Lcom/flurry/sdk/ft;->f:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 112
    if-nez v0, :cond_3

    .line 113
    new-instance v1, Lcom/flurry/sdk/gy;

    invoke-direct {v1}, Lcom/flurry/sdk/gy;-><init>()V

    .line 114
    sget-object v0, Lcom/flurry/sdk/ft;->f:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    :goto_1
    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gk;

    .line 117
    if-nez v0, :cond_2

    .line 118
    invoke-static {}, Lcom/flurry/sdk/gf;->a()Lcom/flurry/sdk/gf;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, p2, v4}, Lcom/flurry/sdk/gf;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Lcom/flurry/sdk/gk;

    move-result-object v0

    .line 120
    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :cond_2
    iget-object v1, p0, Lcom/flurry/sdk/ft;->e:Ljava/lang/Thread;

    if-ne v2, v1, :cond_0

    .line 124
    iput-object v0, p0, Lcom/flurry/sdk/ft;->d:Lcom/flurry/sdk/gk;

    goto :goto_0

    :cond_3
    move-object v1, v0

    goto :goto_1
.end method

.method protected a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->c()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2}, Lcom/flurry/sdk/ge;->k()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/ft;->a(Ljava/lang/String;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 217
    instance-of v0, p1, Lcom/flurry/sdk/fq;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/flurry/sdk/fq;

    invoke-interface {p1}, Lcom/flurry/sdk/fq;->b()Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected a(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 315
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 316
    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 318
    :goto_0
    return-object p1

    :cond_0
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, p2}, Ljava/util/HashMap;-><init>(I)V

    goto :goto_0
.end method

.method protected a(Ljava/lang/Object;ILcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 304
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 305
    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 307
    :goto_0
    return-object p1

    :cond_0
    new-instance p1, Lcom/flurry/sdk/fs$a;

    invoke-direct {p1, p2, p3}, Lcom/flurry/sdk/fs$a;-><init>(ILcom/flurry/sdk/fm;)V

    goto :goto_0
.end method

.method protected a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/fs;->c(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fw;

    .line 258
    invoke-interface {v0}, Lcom/flurry/sdk/fw;->b()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->l()I

    move-result v3

    invoke-virtual {p3, v1, v2, v3}, Lcom/flurry/sdk/ge;->b([BII)V

    .line 259
    return-object v0
.end method

.method protected a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    sget-object v0, Lcom/flurry/sdk/ft$2;->a:[I

    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/fm$v;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 158
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :pswitch_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;->b(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v0

    .line 157
    :goto_0
    return-object v0

    .line 145
    :pswitch_1
    invoke-virtual {p0, p2, p3}, Lcom/flurry/sdk/ft;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 146
    :pswitch_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;->c(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 147
    :pswitch_3
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;->d(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 148
    :pswitch_4
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->k()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->s()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, p1, v0, p3}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 149
    :pswitch_5
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 150
    :pswitch_6
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;->b(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 151
    :pswitch_7
    invoke-virtual {p0, p1, p3}, Lcom/flurry/sdk/ft;->c(Ljava/lang/Object;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 152
    :pswitch_8
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;->c(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 153
    :pswitch_9
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->e()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0

    .line 154
    :pswitch_a
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->f()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    .line 155
    :pswitch_b
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->g()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0

    .line 156
    :pswitch_c
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->c()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 157
    :pswitch_d
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->b()V

    const/4 v0, 0x0

    goto :goto_0

    .line 143
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/flurry/sdk/ge;",
            ")TD;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v0, p0, Lcom/flurry/sdk/ft;->b:Lcom/flurry/sdk/fm;

    iget-object v1, p0, Lcom/flurry/sdk/ft;->c:Lcom/flurry/sdk/fm;

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/ft;->a(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/gk;

    move-result-object v0

    .line 134
    invoke-virtual {v0, p2}, Lcom/flurry/sdk/gk;->a(Lcom/flurry/sdk/ge;)Lcom/flurry/sdk/gl;

    .line 135
    iget-object v1, p0, Lcom/flurry/sdk/ft;->c:Lcom/flurry/sdk/fm;

    invoke-virtual {p0, p1, v1, v0}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v1

    .line 136
    invoke-virtual {v0}, Lcom/flurry/sdk/gk;->v()V

    .line 137
    return-object v1
.end method

.method protected a(Ljava/lang/String;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 188
    new-instance v0, Lcom/flurry/sdk/fs$b;

    invoke-direct {v0, p2, p1}, Lcom/flurry/sdk/fs$b;-><init>(Lcom/flurry/sdk/fm;Ljava/lang/String;)V

    return-object v0
.end method

.method protected a(Ljava/lang/Object;JLjava/lang/Object;)V
    .locals 0

    .prologue
    .line 226
    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1, p4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 227
    return-void
.end method

.method protected a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 250
    check-cast p1, Ljava/util/Map;

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    return-void
.end method

.method protected b(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    const-string v0, "String"

    iget-object v1, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    const-string v1, "avro.java.string"

    invoke-virtual {p2, v1}, Lcom/flurry/sdk/fm;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 327
    invoke-virtual {p3}, Lcom/flurry/sdk/ge;->h()Ljava/lang/String;

    move-result-object v0

    .line 329
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/flurry/sdk/ft;->b(Ljava/lang/Object;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected b(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/sdk/fs;->d(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v1

    .line 167
    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    invoke-virtual {v0, v1, p2}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v5

    .line 169
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->u()[Lcom/flurry/sdk/fm$f;

    move-result-object v7

    array-length v8, v7

    const/4 v0, 0x0

    move v6, v0

    :goto_0
    if-ge v6, v8, :cond_1

    aget-object v9, v7, v6

    .line 170
    invoke-virtual {v9}, Lcom/flurry/sdk/fm$f;->b()I

    move-result v3

    .line 171
    invoke-virtual {v9}, Lcom/flurry/sdk/fm$f;->a()Ljava/lang/String;

    move-result-object v2

    .line 172
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/flurry/sdk/fs;->b(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    .line 173
    :goto_1
    iget-object v0, p0, Lcom/flurry/sdk/ft;->a:Lcom/flurry/sdk/fs;

    invoke-virtual {v9}, Lcom/flurry/sdk/fm$f;->c()Lcom/flurry/sdk/fm;

    move-result-object v9

    invoke-virtual {p0, v4, v9, p3}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 169
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_0

    .line 172
    :cond_0
    const/4 v0, 0x0

    move-object v4, v0

    goto :goto_1

    .line 176
    :cond_1
    return-object v1
.end method

.method protected b(Ljava/lang/Object;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    instance-of v0, p1, Lcom/flurry/sdk/gx;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/flurry/sdk/gx;

    :goto_0
    invoke-virtual {p2, p1}, Lcom/flurry/sdk/ge;->a(Lcom/flurry/sdk/gx;)Lcom/flurry/sdk/gx;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    goto :goto_0
.end method

.method protected c(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    invoke-virtual {p3}, Lcom/flurry/sdk/ge;->d()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected c(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->i()Lcom/flurry/sdk/fm;

    move-result-object v7

    .line 196
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->m()J

    move-result-wide v2

    .line 197
    const-wide/16 v0, 0x0

    .line 198
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_2

    .line 199
    long-to-int v4, v2

    invoke-virtual {p0, p1, v4, p2}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;ILcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v4

    .line 201
    :cond_0
    const-wide/16 v5, 0x0

    :goto_0
    cmp-long v8, v5, v2

    if-gez v8, :cond_1

    .line 202
    add-long v8, v0, v5

    invoke-virtual {p0, v4}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {p0, v10, v7, p3}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {p0, v4, v8, v9, v10}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 201
    const-wide/16 v8, 0x1

    add-long/2addr v5, v8

    goto :goto_0

    .line 204
    :cond_1
    add-long/2addr v0, v2

    .line 205
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->n()J

    move-result-wide v2

    const-wide/16 v5, 0x0

    cmp-long v5, v2, v5

    if-gtz v5, :cond_0

    move-object v0, v4

    .line 208
    :goto_1
    return-object v0

    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;ILcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1
.end method

.method protected c(Ljava/lang/Object;Lcom/flurry/sdk/ge;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    instance-of v0, p1, Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/nio/ByteBuffer;

    :goto_0
    invoke-virtual {p2, p1}, Lcom/flurry/sdk/ge;->a(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    goto :goto_0
.end method

.method protected d(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x0

    .line 233
    invoke-virtual {p2}, Lcom/flurry/sdk/fm;->j()Lcom/flurry/sdk/fm;

    move-result-object v3

    .line 234
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->p()J

    move-result-wide v0

    .line 235
    long-to-int v2, v0

    invoke-virtual {p0, p1, v2}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    .line 236
    cmp-long v2, v0, v8

    if-lez v2, :cond_2

    .line 238
    :cond_0
    const/4 v2, 0x0

    :goto_0
    int-to-long v5, v2

    cmp-long v5, v5, v0

    if-gez v5, :cond_1

    .line 239
    invoke-virtual {p0, v7, p2, p3}, Lcom/flurry/sdk/ft;->b(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/ge;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v7, v3, p3}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gk;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/flurry/sdk/ft;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 238
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 241
    :cond_1
    invoke-virtual {p3}, Lcom/flurry/sdk/gk;->q()J

    move-result-wide v0

    cmp-long v2, v0, v8

    if-gtz v2, :cond_0

    .line 243
    :cond_2
    return-object v4
.end method
