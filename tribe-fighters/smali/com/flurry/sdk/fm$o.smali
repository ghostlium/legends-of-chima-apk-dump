.class Lcom/flurry/sdk/fm$o;
.super Ljava/util/LinkedHashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/fm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "o"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Lcom/flurry/sdk/fm$m;",
        "Lcom/flurry/sdk/fm;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1045
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/flurry/sdk/fm$o;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 1042
    iget-object v0, p0, Lcom/flurry/sdk/fm$o;->a:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic a(Lcom/flurry/sdk/fm$o;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 1042
    iput-object p1, p0, Lcom/flurry/sdk/fm$o;->a:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/fm$m;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm;
    .locals 3

    .prologue
    .line 1071
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$o;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1072
    new-instance v0, Lcom/flurry/sdk/fn;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t redefine: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flurry/sdk/fn;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1073
    :cond_0
    invoke-super {p0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    return-object v0
.end method

.method public a(Ljava/lang/Object;)Lcom/flurry/sdk/fm;
    .locals 2

    .prologue
    .line 1054
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1055
    sget-object v1, Lcom/flurry/sdk/fm;->e:Ljava/util/Map;

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm$v;

    .line 1056
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/flurry/sdk/fm;->a(Lcom/flurry/sdk/fm$v;)Lcom/flurry/sdk/fm;

    move-result-object v0

    .line 1061
    :goto_0
    return-object v0

    .line 1057
    :cond_0
    new-instance v0, Lcom/flurry/sdk/fm$m;

    check-cast p1, Ljava/lang/String;

    iget-object v1, p0, Lcom/flurry/sdk/fm$o;->a:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lcom/flurry/sdk/fm$m;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p1, v0

    .line 1061
    :goto_1
    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/fm;

    goto :goto_0

    .line 1059
    :cond_1
    check-cast p1, Lcom/flurry/sdk/fm$m;

    goto :goto_1
.end method

.method public a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/flurry/sdk/fm$o;->a:Ljava/lang/String;

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/fm;)V
    .locals 1

    .prologue
    .line 1067
    move-object v0, p1

    check-cast v0, Lcom/flurry/sdk/fm$n;

    iget-object v0, v0, Lcom/flurry/sdk/fm$n;->f:Lcom/flurry/sdk/fm$m;

    invoke-virtual {p0, v0, p1}, Lcom/flurry/sdk/fm$o;->a(Lcom/flurry/sdk/fm$m;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm;

    .line 1068
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1049
    iput-object p1, p0, Lcom/flurry/sdk/fm$o;->a:Ljava/lang/String;

    return-void
.end method

.method public synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1042
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/fm$o;->a(Ljava/lang/Object;)Lcom/flurry/sdk/fm;

    move-result-object v0

    return-object v0
.end method

.method public synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1042
    check-cast p1, Lcom/flurry/sdk/fm$m;

    check-cast p2, Lcom/flurry/sdk/fm;

    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/fm$o;->a(Lcom/flurry/sdk/fm$m;Lcom/flurry/sdk/fm;)Lcom/flurry/sdk/fm;

    move-result-object v0

    return-object v0
.end method
