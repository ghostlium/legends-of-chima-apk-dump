.class public Lcom/flurry/sdk/lz$n;
.super Lcom/flurry/sdk/mc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/lz;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "n"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/mc",
        "<",
        "Ljava/lang/StackTraceElement;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1099
    const-class v0, Ljava/lang/StackTraceElement;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/mc;-><init>(Ljava/lang/Class;)V

    return-void
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
    .line 1096
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/lz$n;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/StackTraceElement;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/StackTraceElement;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 1105
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v0

    .line 1107
    sget-object v1, Lcom/flurry/sdk/hw;->b:Lcom/flurry/sdk/hw;

    if-ne v0, v1, :cond_7

    .line 1108
    const-string v3, ""

    const-string v2, ""

    const-string v1, ""

    .line 1109
    const/4 v0, -0x1

    .line 1111
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->c()Lcom/flurry/sdk/hw;

    move-result-object v4

    sget-object v5, Lcom/flurry/sdk/hw;->c:Lcom/flurry/sdk/hw;

    if-eq v4, v5, :cond_6

    .line 1112
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->g()Ljava/lang/String;

    move-result-object v5

    .line 1113
    const-string v6, "className"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1114
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 1115
    :cond_1
    const-string v6, "fileName"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1116
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1117
    :cond_2
    const-string v6, "lineNumber"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1118
    invoke-virtual {v4}, Lcom/flurry/sdk/hw;->c()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1119
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->t()I

    move-result v0

    goto :goto_0

    .line 1121
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Non-numeric token ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") for property \'lineNumber\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flurry/sdk/ji;->a(Lcom/flurry/sdk/ht;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0

    .line 1123
    :cond_4
    const-string v4, "methodName"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1124
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1125
    :cond_5
    const-string v4, "nativeMethod"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1128
    iget-object v4, p0, Lcom/flurry/sdk/lz$n;->q:Ljava/lang/Class;

    invoke-virtual {p0, p1, p2, v4, v5}, Lcom/flurry/sdk/lz$n;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 1131
    :cond_6
    new-instance v4, Ljava/lang/StackTraceElement;

    invoke-direct {v4, v3, v2, v1, v0}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v4

    .line 1133
    :cond_7
    iget-object v1, p0, Lcom/flurry/sdk/lz$n;->q:Ljava/lang/Class;

    invoke-virtual {p2, v1, v0}, Lcom/flurry/sdk/ja;->a(Ljava/lang/Class;Lcom/flurry/sdk/hw;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method
