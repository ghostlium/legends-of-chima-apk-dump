.class public Lcom/flurry/sdk/ph;
.super Lcom/flurry/sdk/pq;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/jt;


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pq",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/flurry/sdk/jt;"
    }
.end annotation


# instance fields
.field protected final a:Ljava/lang/reflect/Method;

.field protected b:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final c:Lcom/flurry/sdk/it;

.field protected d:Z


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;Lcom/flurry/sdk/jl;Lcom/flurry/sdk/it;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/flurry/sdk/it;",
            ")V"
        }
    .end annotation

    .prologue
    .line 61
    const-class v0, Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pq;-><init>(Ljava/lang/Class;)V

    .line 62
    iput-object p1, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    .line 63
    iput-object p2, p0, Lcom/flurry/sdk/ph;->b:Lcom/flurry/sdk/jl;

    .line 64
    iput-object p3, p0, Lcom/flurry/sdk/ph;->c:Lcom/flurry/sdk/it;

    .line 65
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jw;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 180
    iget-object v0, p0, Lcom/flurry/sdk/ph;->b:Lcom/flurry/sdk/jl;

    if-nez v0, :cond_1

    .line 186
    sget-object v0, Lcom/flurry/sdk/ju$a;->h:Lcom/flurry/sdk/ju$a;

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/ju$a;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 188
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flurry/sdk/jw;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/rx;

    move-result-object v0

    .line 194
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/flurry/sdk/ph;->c:Lcom/flurry/sdk/it;

    invoke-virtual {p1, v0, v1, v2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/rx;ZLcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v1

    iput-object v1, p0, Lcom/flurry/sdk/ph;->b:Lcom/flurry/sdk/jl;

    .line 199
    iget-object v1, p0, Lcom/flurry/sdk/ph;->b:Lcom/flurry/sdk/jl;

    invoke-virtual {p0, v0, v1}, Lcom/flurry/sdk/ph;->a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jl;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/ph;->d:Z

    .line 202
    :cond_1
    return-void
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 72
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 74
    if-nez v1, :cond_0

    .line 75
    invoke-virtual {p3, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/hp;)V

    .line 104
    :goto_0
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/ph;->b:Lcom/flurry/sdk/jl;

    .line 79
    if-nez v0, :cond_1

    .line 80
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 86
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/flurry/sdk/ph;->c:Lcom/flurry/sdk/it;

    invoke-virtual {p3, v0, v2, v3}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;ZLcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v0

    .line 88
    :cond_1
    invoke-virtual {v0, v1, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 89
    :catch_0
    move-exception v0

    .line 90
    throw v0

    .line 94
    :goto_1
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 95
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_1

    .line 98
    :cond_2
    instance-of v1, v0, Ljava/lang/Error;

    if-eqz v1, :cond_3

    .line 99
    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 102
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/flurry/sdk/ji;->a(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 91
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 112
    .line 114
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 117
    if-nez v0, :cond_1

    .line 118
    invoke-virtual {p3, p2}, Lcom/flurry/sdk/jw;->a(Lcom/flurry/sdk/hp;)V

    .line 155
    :cond_0
    :goto_0
    return-void

    .line 121
    :cond_1
    iget-object v1, p0, Lcom/flurry/sdk/ph;->b:Lcom/flurry/sdk/jl;

    .line 122
    if-eqz v1, :cond_3

    .line 126
    iget-boolean v2, p0, Lcom/flurry/sdk/ph;->d:Z

    if-eqz v2, :cond_2

    .line 127
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V

    .line 129
    :cond_2
    invoke-virtual {v1, v0, p2, p3, p4}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    .line 130
    iget-boolean v0, p0, Lcom/flurry/sdk/ph;->d:Z

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p4, p1, p2}, Lcom/flurry/sdk/jz;->d(Ljava/lang/Object;Lcom/flurry/sdk/hp;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 140
    :catch_0
    move-exception v0

    .line 141
    throw v0

    .line 136
    :cond_3
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 137
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/flurry/sdk/ph;->c:Lcom/flurry/sdk/it;

    invoke-virtual {p3, v1, v2, v3}, Lcom/flurry/sdk/jw;->a(Ljava/lang/Class;ZLcom/flurry/sdk/it;)Lcom/flurry/sdk/jl;

    move-result-object v1

    .line 139
    invoke-virtual {v1, v0, p2, p3}, Lcom/flurry/sdk/jl;->a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 142
    :catch_1
    move-exception v0

    .line 145
    :goto_1
    instance-of v1, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 146
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_1

    .line 149
    :cond_4
    instance-of v1, v0, Ljava/lang/Error;

    if-eqz v1, :cond_5

    .line 150
    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 153
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/flurry/sdk/ji;->a(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method

.method protected a(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/jl;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/jl",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 206
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v1

    .line 208
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->t()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 209
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v1, v2, :cond_2

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v1, v2, :cond_2

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq v1, v2, :cond_2

    .line 219
    :cond_0
    :goto_0
    return v0

    .line 213
    :cond_1
    const-class v2, Ljava/lang/String;

    if-eq v1, v2, :cond_2

    const-class v2, Ljava/lang/Integer;

    if-eq v1, v2, :cond_2

    const-class v2, Ljava/lang/Boolean;

    if-eq v1, v2, :cond_2

    const-class v2, Ljava/lang/Double;

    if-ne v1, v2, :cond_0

    .line 219
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/flurry/sdk/kb;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(@JsonValue serializer for method "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ph;->a:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
