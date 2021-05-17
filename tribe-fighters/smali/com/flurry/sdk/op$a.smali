.class final Lcom/flurry/sdk/op$a;
.super Lcom/flurry/sdk/op;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/op;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final c:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lcom/flurry/sdk/jl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/flurry/sdk/jl;Ljava/lang/Class;Lcom/flurry/sdk/jl;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 157
    invoke-direct {p0}, Lcom/flurry/sdk/op;-><init>()V

    .line 158
    iput-object p1, p0, Lcom/flurry/sdk/op$a;->a:Ljava/lang/Class;

    .line 159
    iput-object p2, p0, Lcom/flurry/sdk/op$a;->c:Lcom/flurry/sdk/jl;

    .line 160
    iput-object p3, p0, Lcom/flurry/sdk/op$a;->b:Ljava/lang/Class;

    .line 161
    iput-object p4, p0, Lcom/flurry/sdk/op$a;->d:Lcom/flurry/sdk/jl;

    .line 162
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Lcom/flurry/sdk/jl;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lcom/flurry/sdk/op$a;->a:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/flurry/sdk/op$a;->c:Lcom/flurry/sdk/jl;

    .line 173
    :goto_0
    return-object v0

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/op$a;->b:Ljava/lang/Class;

    if-ne p1, v0, :cond_1

    .line 171
    iget-object v0, p0, Lcom/flurry/sdk/op$a;->d:Lcom/flurry/sdk/jl;

    goto :goto_0

    .line 173
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Ljava/lang/Class;Lcom/flurry/sdk/jl;)Lcom/flurry/sdk/op;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/flurry/sdk/jl",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/flurry/sdk/op;"
        }
    .end annotation

    .prologue
    .line 179
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/flurry/sdk/op$f;

    .line 180
    const/4 v1, 0x0

    new-instance v2, Lcom/flurry/sdk/op$f;

    iget-object v3, p0, Lcom/flurry/sdk/op$a;->a:Ljava/lang/Class;

    iget-object v4, p0, Lcom/flurry/sdk/op$a;->c:Lcom/flurry/sdk/jl;

    invoke-direct {v2, v3, v4}, Lcom/flurry/sdk/op$f;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/jl;)V

    aput-object v2, v0, v1

    .line 181
    const/4 v1, 0x1

    new-instance v2, Lcom/flurry/sdk/op$f;

    iget-object v3, p0, Lcom/flurry/sdk/op$a;->b:Ljava/lang/Class;

    iget-object v4, p0, Lcom/flurry/sdk/op$a;->d:Lcom/flurry/sdk/jl;

    invoke-direct {v2, v3, v4}, Lcom/flurry/sdk/op$f;-><init>(Ljava/lang/Class;Lcom/flurry/sdk/jl;)V

    aput-object v2, v0, v1

    .line 182
    new-instance v1, Lcom/flurry/sdk/op$c;

    invoke-direct {v1, v0}, Lcom/flurry/sdk/op$c;-><init>([Lcom/flurry/sdk/op$f;)V

    return-object v1
.end method
