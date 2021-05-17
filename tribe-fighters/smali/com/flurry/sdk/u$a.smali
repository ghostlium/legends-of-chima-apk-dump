.class Lcom/flurry/sdk/u$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/u;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/u$a$a;
    }
.end annotation


# instance fields
.field private a:Lcom/flurry/sdk/u$a$a;

.field private b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private d:Z

.field private e:Lcom/flurry/sdk/ag;

.field private f:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/sdk/u$a;->b:Ljava/lang/ref/WeakReference;

    .line 100
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/sdk/u$a;->c:Ljava/lang/ref/WeakReference;

    .line 102
    invoke-virtual {p0}, Lcom/flurry/sdk/u$a;->a()V

    .line 103
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 106
    sget-object v0, Lcom/flurry/sdk/u$a$a;->a:Lcom/flurry/sdk/u$a$a;

    iput-object v0, p0, Lcom/flurry/sdk/u$a;->a:Lcom/flurry/sdk/u$a$a;

    .line 108
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 109
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/sdk/u$a;->d:Z

    .line 111
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/sdk/u$a;->e:Lcom/flurry/sdk/ag;

    .line 112
    return-void
.end method

.method public a(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 131
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/sdk/u$a;->b:Ljava/lang/ref/WeakReference;

    .line 132
    return-void
.end method

.method public a(Landroid/view/ViewGroup;)V
    .locals 1

    .prologue
    .line 139
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/flurry/sdk/u$a;->c:Ljava/lang/ref/WeakReference;

    .line 140
    return-void
.end method

.method public a(Lcom/flurry/sdk/ag;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/flurry/sdk/u$a;->e:Lcom/flurry/sdk/ag;

    .line 156
    return-void
.end method

.method public a(Lcom/flurry/sdk/u$a$a;)V
    .locals 0

    .prologue
    .line 115
    if-nez p1, :cond_0

    .line 116
    sget-object p1, Lcom/flurry/sdk/u$a$a;->a:Lcom/flurry/sdk/u$a$a;

    .line 119
    :cond_0
    iput-object p1, p0, Lcom/flurry/sdk/u$a;->a:Lcom/flurry/sdk/u$a$a;

    .line 120
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lcom/flurry/sdk/u$a;->f:Ljava/lang/String;

    .line 164
    return-void
.end method

.method public a(Z)V
    .locals 0

    .prologue
    .line 147
    iput-boolean p1, p0, Lcom/flurry/sdk/u$a;->d:Z

    .line 148
    return-void
.end method

.method public b()Lcom/flurry/sdk/u$a$a;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->a:Lcom/flurry/sdk/u$a$a;

    return-object v0
.end method

.method public c()Landroid/content/Context;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method public d()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public e()Z
    .locals 1

    .prologue
    .line 143
    iget-boolean v0, p0, Lcom/flurry/sdk/u$a;->d:Z

    return v0
.end method

.method public f()Lcom/flurry/sdk/ag;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->e:Lcom/flurry/sdk/ag;

    return-object v0
.end method

.method public g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/flurry/sdk/u$a;->f:Ljava/lang/String;

    return-object v0
.end method
