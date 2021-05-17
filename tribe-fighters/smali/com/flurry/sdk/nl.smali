.class public Lcom/flurry/sdk/nl;
.super Lcom/flurry/sdk/nj;
.source "SourceFile"


# instance fields
.field protected final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/rx;",
            "Lcom/flurry/sdk/nh;",
            "Lcom/flurry/sdk/it;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/nj;-><init>(Lcom/flurry/sdk/rx;Lcom/flurry/sdk/nh;Lcom/flurry/sdk/it;Ljava/lang/Class;)V

    .line 27
    iput-object p5, p0, Lcom/flurry/sdk/nl;->a:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public a()Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;->EXTERNAL_PROPERTY:Lcom/flurry/org/codehaus/jackson/annotate/JsonTypeInfo$As;

    return-object v0
.end method

.method public b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/flurry/sdk/nl;->a:Ljava/lang/String;

    return-object v0
.end method
