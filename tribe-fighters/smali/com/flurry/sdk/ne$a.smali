.class public Lcom/flurry/sdk/ne$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/ne;


# annotations
.annotation runtime Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;
    creatorVisibility = .enum Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->ANY:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;
    fieldVisibility = .enum Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->PUBLIC_ONLY:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;
    getterVisibility = .enum Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->PUBLIC_ONLY:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;
    isGetterVisibility = .enum Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->PUBLIC_ONLY:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;
    setterVisibility = .enum Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->ANY:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ne;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/flurry/sdk/ne",
        "<",
        "Lcom/flurry/sdk/ne$a;",
        ">;"
    }
.end annotation


# static fields
.field protected static final a:Lcom/flurry/sdk/ne$a;


# instance fields
.field protected final b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

.field protected final c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

.field protected final d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

.field protected final e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

.field protected final f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 178
    new-instance v1, Lcom/flurry/sdk/ne$a;

    const-class v0, Lcom/flurry/sdk/ne$a;

    const-class v2, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/ne$a;-><init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;)V

    sput-object v1, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    return-void
.end method

.method public constructor <init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)V
    .locals 0

    .prologue
    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-object p1, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 211
    iput-object p2, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 212
    iput-object p3, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 213
    iput-object p4, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 214
    iput-object p5, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 215
    return-void
.end method

.method public constructor <init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;)V
    .locals 2

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->value()[Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    move-result-object v1

    .line 198
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->GETTER:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->getterVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 199
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->IS_GETTER:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->isGetterVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 200
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->SETTER:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->setterVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 201
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->CREATOR:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->creatorVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 202
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->FIELD:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->fieldVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    :goto_4
    iput-object v0, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 203
    return-void

    .line 198
    :cond_0
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_0

    .line 199
    :cond_1
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_1

    .line 200
    :cond_2
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_2

    .line 201
    :cond_3
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_3

    .line 202
    :cond_4
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_4
.end method

.method public static a()Lcom/flurry/sdk/ne$a;
    .locals 1

    .prologue
    .line 186
    sget-object v0, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    return-object v0
.end method

.method private static a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 402
    array-length v2, p0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, p0, v1

    .line 403
    if-eq v3, p1, :cond_0

    sget-object v4, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->ALL:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    if-ne v3, v4, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 405
    :cond_1
    return v0

    .line 402
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public synthetic a(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ne$a;->f(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v0

    return-object v0
.end method

.method public synthetic a(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;)Lcom/flurry/sdk/ne;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ne$a;->b(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;)Lcom/flurry/sdk/ne$a;

    move-result-object v0

    return-object v0
.end method

.method public a(Lcom/flurry/sdk/mp;)Z
    .locals 1

    .prologue
    .line 361
    invoke-virtual {p1}, Lcom/flurry/sdk/mp;->e()Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ne$a;->a(Ljava/lang/reflect/Field;)Z

    move-result v0

    return v0
.end method

.method public a(Lcom/flurry/sdk/mq;)Z
    .locals 1

    .prologue
    .line 351
    invoke-virtual {p1}, Lcom/flurry/sdk/mq;->i()Ljava/lang/reflect/Member;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ne$a;->a(Ljava/lang/reflect/Member;)Z

    move-result v0

    return v0
.end method

.method public a(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 371
    invoke-virtual {p1}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ne$a;->a(Ljava/lang/reflect/Method;)Z

    move-result v0

    return v0
.end method

.method public a(Ljava/lang/reflect/Field;)Z
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->isVisible(Ljava/lang/reflect/Member;)Z

    move-result v0

    return v0
.end method

.method public a(Ljava/lang/reflect/Member;)Z
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->isVisible(Ljava/lang/reflect/Member;)Z

    move-result v0

    return v0
.end method

.method public a(Ljava/lang/reflect/Method;)Z
    .locals 1

    .prologue
    .line 366
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->isVisible(Ljava/lang/reflect/Member;)Z

    move-result v0

    return v0
.end method

.method public b(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;)Lcom/flurry/sdk/ne$a;
    .locals 3

    .prologue
    .line 253
    if-nez p1, :cond_0

    .line 269
    :goto_0
    return-object p0

    .line 256
    :cond_0
    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->value()[Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    move-result-object v1

    .line 259
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->GETTER:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->getterVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    .line 260
    :goto_1
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ne$a;->f(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v2

    .line 261
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->IS_GETTER:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->isGetterVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    .line 262
    :goto_2
    invoke-virtual {v2, v0}, Lcom/flurry/sdk/ne$a;->g(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v2

    .line 263
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->SETTER:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->setterVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    .line 264
    :goto_3
    invoke-virtual {v2, v0}, Lcom/flurry/sdk/ne$a;->h(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v2

    .line 265
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->CREATOR:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->creatorVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    .line 266
    :goto_4
    invoke-virtual {v2, v0}, Lcom/flurry/sdk/ne$a;->i(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v2

    .line 267
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;->FIELD:Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;

    invoke-static {v1, v0}, Lcom/flurry/sdk/ne$a;->a([Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;Lcom/flurry/org/codehaus/jackson/annotate/JsonMethod;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect;->fieldVisibility()Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    move-result-object v0

    .line 268
    :goto_5
    invoke-virtual {v2, v0}, Lcom/flurry/sdk/ne$a;->j(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object p0

    goto :goto_0

    .line 259
    :cond_1
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_1

    .line 261
    :cond_2
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_2

    .line 263
    :cond_3
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_3

    .line 265
    :cond_4
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_4

    .line 267
    :cond_5
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->NONE:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    goto :goto_5
.end method

.method public synthetic b(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ne$a;->g(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v0

    return-object v0
.end method

.method public b(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 381
    invoke-virtual {p1}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ne$a;->b(Ljava/lang/reflect/Method;)Z

    move-result v0

    return v0
.end method

.method public b(Ljava/lang/reflect/Method;)Z
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->isVisible(Ljava/lang/reflect/Member;)Z

    move-result v0

    return v0
.end method

.method public synthetic c(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ne$a;->h(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v0

    return-object v0
.end method

.method public c(Lcom/flurry/sdk/mr;)Z
    .locals 1

    .prologue
    .line 391
    invoke-virtual {p1}, Lcom/flurry/sdk/mr;->e()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/flurry/sdk/ne$a;->c(Ljava/lang/reflect/Method;)Z

    move-result v0

    return v0
.end method

.method public c(Ljava/lang/reflect/Method;)Z
    .locals 1

    .prologue
    .line 386
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, p1}, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->isVisible(Ljava/lang/reflect/Member;)Z

    move-result v0

    return v0
.end method

.method public synthetic d(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ne$a;->i(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v0

    return-object v0
.end method

.method public synthetic e(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne;
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/ne$a;->j(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;

    move-result-object v0

    return-object v0
.end method

.method public f(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;
    .locals 6

    .prologue
    .line 305
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->DEFAULT:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    iget-object v1, v0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 306
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne v0, v1, :cond_0

    .line 307
    :goto_1
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/ne$a;

    iget-object v2, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v3, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v4, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v5, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ne$a;-><init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)V

    move-object p0, v0

    goto :goto_1

    :cond_1
    move-object v1, p1

    goto :goto_0
.end method

.method public g(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;
    .locals 6

    .prologue
    .line 312
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->DEFAULT:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    iget-object v2, v0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 313
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne v0, v2, :cond_0

    .line 314
    :goto_1
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/ne$a;

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v3, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v4, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v5, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ne$a;-><init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)V

    move-object p0, v0

    goto :goto_1

    :cond_1
    move-object v2, p1

    goto :goto_0
.end method

.method public h(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;
    .locals 6

    .prologue
    .line 319
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->DEFAULT:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    iget-object v3, v0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 320
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne v0, v3, :cond_0

    .line 321
    :goto_1
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/ne$a;

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v2, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v4, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v5, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ne$a;-><init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)V

    move-object p0, v0

    goto :goto_1

    :cond_1
    move-object v3, p1

    goto :goto_0
.end method

.method public i(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;
    .locals 6

    .prologue
    .line 326
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->DEFAULT:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    iget-object v4, v0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 327
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne v0, v4, :cond_0

    .line 328
    :goto_1
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/ne$a;

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v2, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v3, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v5, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ne$a;-><init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)V

    move-object p0, v0

    goto :goto_1

    :cond_1
    move-object v4, p1

    goto :goto_0
.end method

.method public j(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)Lcom/flurry/sdk/ne$a;
    .locals 6

    .prologue
    .line 333
    sget-object v0, Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;->DEFAULT:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne p1, v0, :cond_1

    sget-object v0, Lcom/flurry/sdk/ne$a;->a:Lcom/flurry/sdk/ne$a;

    iget-object v5, v0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    .line 334
    :goto_0
    iget-object v0, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    if-ne v0, v5, :cond_0

    .line 335
    :goto_1
    return-object p0

    :cond_0
    new-instance v0, Lcom/flurry/sdk/ne$a;

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v2, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v3, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    iget-object v4, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ne$a;-><init>(Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;)V

    move-object p0, v0

    goto :goto_1

    :cond_1
    move-object v5, p1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 415
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[Visibility:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " getter: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->b:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isGetter: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->c:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", setter: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->d:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", creator: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->e:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", field: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/sdk/ne$a;->f:Lcom/flurry/org/codehaus/jackson/annotate/JsonAutoDetect$Visibility;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
