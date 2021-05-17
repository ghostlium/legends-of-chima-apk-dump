.class public Lcom/flurry/sdk/go;
.super Lcom/flurry/sdk/gm;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/go$a;
    }
.end annotation


# static fields
.field static final synthetic d:Z


# instance fields
.field private final e:Lcom/flurry/sdk/go$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/flurry/sdk/go;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/flurry/sdk/go;->d:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gm$a;Lcom/flurry/sdk/go$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/flurry/sdk/gm;-><init>(Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gm$a;)V

    .line 49
    iput-object p3, p0, Lcom/flurry/sdk/go;->e:Lcom/flurry/sdk/go$a;

    .line 50
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    :goto_0
    iget v0, p0, Lcom/flurry/sdk/go;->c:I

    if-ge p1, v0, :cond_3

    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/go;->b:[Lcom/flurry/sdk/gp;

    iget v1, p0, Lcom/flurry/sdk/go;->c:I

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    .line 61
    iget-object v1, v0, Lcom/flurry/sdk/gp;->a:Lcom/flurry/sdk/gp$i;

    sget-object v2, Lcom/flurry/sdk/gp$i;->a:Lcom/flurry/sdk/gp$i;

    if-eq v1, v2, :cond_2

    .line 62
    iget-object v1, v0, Lcom/flurry/sdk/gp;->a:Lcom/flurry/sdk/gp$i;

    sget-object v2, Lcom/flurry/sdk/gp$i;->f:Lcom/flurry/sdk/gp$i;

    if-eq v1, v2, :cond_0

    iget-object v1, v0, Lcom/flurry/sdk/gp;->a:Lcom/flurry/sdk/gp$i;

    sget-object v2, Lcom/flurry/sdk/gp$i;->g:Lcom/flurry/sdk/gp$i;

    if-ne v1, v2, :cond_1

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/flurry/sdk/go;->e:Lcom/flurry/sdk/go$a;

    invoke-interface {v0}, Lcom/flurry/sdk/go$a;->l()V

    goto :goto_0

    .line 66
    :cond_1
    iget v1, p0, Lcom/flurry/sdk/go;->c:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/flurry/sdk/go;->c:I

    .line 67
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/go;->b(Lcom/flurry/sdk/gp;)V

    goto :goto_0

    .line 71
    :cond_2
    iget-object v0, p0, Lcom/flurry/sdk/go;->e:Lcom/flurry/sdk/go$a;

    invoke-interface {v0}, Lcom/flurry/sdk/go$a;->t()V

    goto :goto_0

    .line 73
    :cond_3
    return-void
.end method

.method public final d(Lcom/flurry/sdk/gp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget v0, p0, Lcom/flurry/sdk/go;->c:I

    .line 92
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/go;->c(Lcom/flurry/sdk/gp;)V

    .line 93
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/go;->a(I)V

    .line 94
    return-void
.end method

.method public final f()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget v0, p0, Lcom/flurry/sdk/go;->c:I

    .line 80
    iget-object v1, p0, Lcom/flurry/sdk/go;->b:[Lcom/flurry/sdk/gp;

    iget v2, p0, Lcom/flurry/sdk/go;->c:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/flurry/sdk/go;->c:I

    aget-object v1, v1, v2

    .line 81
    sget-boolean v2, Lcom/flurry/sdk/go;->d:Z

    if-nez v2, :cond_0

    iget-object v2, v1, Lcom/flurry/sdk/gp;->a:Lcom/flurry/sdk/gp$i;

    sget-object v3, Lcom/flurry/sdk/gp$i;->d:Lcom/flurry/sdk/gp$i;

    if-eq v2, v3, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 82
    :cond_0
    invoke-virtual {p0, v1}, Lcom/flurry/sdk/go;->b(Lcom/flurry/sdk/gp;)V

    .line 83
    invoke-virtual {p0, v0}, Lcom/flurry/sdk/go;->a(I)V

    .line 84
    return-void
.end method
