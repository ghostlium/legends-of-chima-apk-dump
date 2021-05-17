.class public Lcom/flurry/sdk/fs$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/fx;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/flurry/sdk/fx;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/flurry/sdk/fs$d;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lcom/flurry/sdk/fm;

.field private final b:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/fm;)V
    .locals 3

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    if-eqz p1, :cond_0

    sget-object v0, Lcom/flurry/sdk/fm$v;->a:Lcom/flurry/sdk/fm$v;

    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->a()Lcom/flurry/sdk/fm$v;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/fm$v;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 70
    :cond_0
    new-instance v0, Lcom/flurry/sdk/fk;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not a record schema: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fk;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_1
    iput-object p1, p0, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    .line 72
    invoke-virtual {p1}, Lcom/flurry/sdk/fm;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/flurry/sdk/fs$d;->b:[Ljava/lang/Object;

    .line 73
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/fs$d;)I
    .locals 2

    .prologue
    .line 114
    invoke-static {}, Lcom/flurry/sdk/fs;->a()Lcom/flurry/sdk/fs;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    invoke-virtual {v0, p0, p1, v1}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v0

    return v0
.end method

.method public a()Lcom/flurry/sdk/fm;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public a(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/flurry/sdk/fs$d;->b:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public a(ILjava/lang/Object;)V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/flurry/sdk/fs$d;->b:[Ljava/lang/Object;

    aput-object p2, v0, p1

    return-void
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 65
    check-cast p1, Lcom/flurry/sdk/fs$d;

    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fs$d;->a(Lcom/flurry/sdk/fs$d;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 103
    if-ne p1, p0, :cond_1

    .line 108
    :cond_0
    :goto_0
    return v0

    .line 104
    :cond_1
    instance-of v2, p1, Lcom/flurry/sdk/fs$d;

    if-nez v2, :cond_2

    move v0, v1

    goto :goto_0

    .line 105
    :cond_2
    check-cast p1, Lcom/flurry/sdk/fs$d;

    .line 106
    iget-object v2, p0, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    invoke-virtual {v2}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    invoke-virtual {v3}, Lcom/flurry/sdk/fm;->g()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    move v0, v1

    .line 107
    goto :goto_0

    .line 108
    :cond_3
    invoke-static {}, Lcom/flurry/sdk/fs;->a()Lcom/flurry/sdk/fs;

    move-result-object v2

    iget-object v3, p0, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    invoke-virtual {v2, p0, p1, v3, v0}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/flurry/sdk/fm;Z)I

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 111
    invoke-static {}, Lcom/flurry/sdk/fs;->a()Lcom/flurry/sdk/fs;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/fs$d;->a:Lcom/flurry/sdk/fm;

    invoke-virtual {v0, p0, v1}, Lcom/flurry/sdk/fs;->b(Ljava/lang/Object;Lcom/flurry/sdk/fm;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    invoke-static {}, Lcom/flurry/sdk/fs;->a()Lcom/flurry/sdk/fs;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flurry/sdk/fs;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
