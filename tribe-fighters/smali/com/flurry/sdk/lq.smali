.class public Lcom/flurry/sdk/lq;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kc;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/lq$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Ljava/lang/Enum",
        "<*>;>;"
    }
.end annotation


# instance fields
.field protected final a:Lcom/flurry/sdk/qu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/qu",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/qu;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/qu",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 31
    const-class v0, Ljava/lang/Enum;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mc;-><init>(Ljava/lang/Class;)V

    .line 32
    iput-object p1, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    .line 33
    return-void
.end method

.method public static a(Lcom/flurry/sdk/iz;Ljava/lang/Class;Lcom/flurry/sdk/mr;)Lcom/flurry/sdk/jh;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/iz;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/mr;",
            ")",
            "Lcom/flurry/sdk/jh",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/mr;->b(I)Ljava/lang/reflect/Type;

    move-result-object v0

    const-class v1, Ljava/lang/String;

    if-eq v0, v1, :cond_0

    .line 49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Parameter #0 type for factory method ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") not suitable, must be java.lang.String"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_0
    sget-object v0, Lcom/flurry/sdk/iz$a;->f:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/iz;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    invoke-virtual {p2}, Lcom/flurry/sdk/mr;->i()Ljava/lang/reflect/Member;

    move-result-object v0

    invoke-static {v0}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Member;)V

    .line 54
    :cond_1
    new-instance v0, Lcom/flurry/sdk/lq$a;

    invoke-direct {v0, p1, p2}, Lcom/flurry/sdk/lq$a;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/mr;)V

    return-object v0
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lq;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Enum;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/ht;",
            "Lcom/flurry/sdk/ja;",
            ")",
            "Ljava/lang/Enum",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 70
    sget-object v1, Lcom/flurry/sdk/hw;->h:Lcom/flurry/sdk/hw;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/flurry/sdk/hw;->f:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_1

    .line 71
    :cond_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    .line 72
    iget-object v1, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/qu;->a(Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 73
    if-nez v0, :cond_4

    .line 74
    iget-object v0, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    invoke-virtual {v0}, Lcom/flurry/sdk/qu;->a()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "value not one of declared Enum instance names"

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 79
    :cond_1
    sget-object v1, Lcom/flurry/sdk/hw;->i:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_3

    .line 83
    sget-object v0, Lcom/flurry/sdk/iz$a;->m:Lcom/flurry/sdk/iz$a;

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Lcom/flurry/sdk/iz$a;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 84
    const-string v0, "Not allowed to deserialize Enum value out of JSON number (disable DeserializationConfig.Feature.FAIL_ON_NUMBERS_FOR_ENUMS to allow)"

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 87
    :cond_2
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->t()I

    move-result v0

    .line 88
    iget-object v1, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    invoke-virtual {v1, v0}, Lcom/flurry/sdk/qu;->a(I)Ljava/lang/Enum;

    move-result-object v0

    .line 89
    if-nez v0, :cond_4

    .line 90
    iget-object v0, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    invoke-virtual {v0}, Lcom/flurry/sdk/qu;->a()Ljava/lang/Class;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index value outside legal index range [0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    invoke-virtual {v2}, Lcom/flurry/sdk/qu;->b()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/ja;->c(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 94
    :cond_3
    iget-object v0, p0, Lcom/flurry/sdk/lq;->a:Lcom/flurry/sdk/qu;

    invoke-virtual {v0}, Lcom/flurry/sdk/qu;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->b(Ljava/lang/Class;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 92
    :cond_4
    return-object v0
.end method
