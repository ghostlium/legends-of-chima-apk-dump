.class public final Lcom/unity3d/player/u;
.super Ljava/lang/Object;


# static fields
.field static final a:Z

.field static final b:Z

.field static final c:Z

.field static final d:Z

.field static final e:Z

.field static final f:Z

.field static final g:Z

.field static final h:Lcom/unity3d/player/h;

.field static final i:Lcom/unity3d/player/i;

.field static final j:Lcom/unity3d/player/j;

.field static final k:Lcom/unity3d/player/l;

.field static final l:Lcom/unity3d/player/k;

.field static final m:Lcom/unity3d/player/m;

.field static final n:Lcom/unity3d/player/n;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v4, 0x5

    if-lt v0, v4, :cond_1

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/unity3d/player/u;->a:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x8

    if-lt v0, v4, :cond_2

    move v0, v1

    :goto_1
    sput-boolean v0, Lcom/unity3d/player/u;->b:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x9

    if-lt v0, v4, :cond_3

    move v0, v1

    :goto_2
    sput-boolean v0, Lcom/unity3d/player/u;->c:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v0, v4, :cond_4

    move v0, v1

    :goto_3
    sput-boolean v0, Lcom/unity3d/player/u;->d:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xc

    if-lt v0, v4, :cond_5

    move v0, v1

    :goto_4
    sput-boolean v0, Lcom/unity3d/player/u;->e:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v0, v4, :cond_6

    move v0, v1

    :goto_5
    sput-boolean v0, Lcom/unity3d/player/u;->f:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v0, v4, :cond_7

    :goto_6
    sput-boolean v1, Lcom/unity3d/player/u;->g:Z

    sget-boolean v0, Lcom/unity3d/player/u;->a:Z

    if-eqz v0, :cond_8

    new-instance v0, Lcom/unity3d/player/b;

    invoke-direct {v0}, Lcom/unity3d/player/b;-><init>()V

    :goto_7
    sput-object v0, Lcom/unity3d/player/u;->h:Lcom/unity3d/player/h;

    sget-boolean v0, Lcom/unity3d/player/u;->b:Z

    if-eqz v0, :cond_9

    new-instance v0, Lcom/unity3d/player/c;

    invoke-direct {v0}, Lcom/unity3d/player/c;-><init>()V

    :goto_8
    sput-object v0, Lcom/unity3d/player/u;->i:Lcom/unity3d/player/i;

    sget-boolean v0, Lcom/unity3d/player/u;->c:Z

    if-eqz v0, :cond_a

    new-instance v0, Lcom/unity3d/player/d;

    invoke-direct {v0}, Lcom/unity3d/player/d;-><init>()V

    :goto_9
    sput-object v0, Lcom/unity3d/player/u;->j:Lcom/unity3d/player/j;

    sget-boolean v0, Lcom/unity3d/player/u;->d:Z

    if-eqz v0, :cond_b

    new-instance v0, Lcom/unity3d/player/g;

    invoke-direct {v0}, Lcom/unity3d/player/g;-><init>()V

    :goto_a
    sput-object v0, Lcom/unity3d/player/u;->k:Lcom/unity3d/player/l;

    sget-boolean v0, Lcom/unity3d/player/u;->e:Z

    if-eqz v0, :cond_c

    new-instance v0, Lcom/unity3d/player/f;

    invoke-direct {v0}, Lcom/unity3d/player/f;-><init>()V

    :goto_b
    sput-object v0, Lcom/unity3d/player/u;->l:Lcom/unity3d/player/k;

    sget-boolean v0, Lcom/unity3d/player/u;->f:Z

    if-eqz v0, :cond_d

    new-instance v0, Lcom/unity3d/player/p;

    invoke-direct {v0}, Lcom/unity3d/player/p;-><init>()V

    :goto_c
    sput-object v0, Lcom/unity3d/player/u;->m:Lcom/unity3d/player/m;

    sget-boolean v0, Lcom/unity3d/player/u;->g:Z

    if-eqz v0, :cond_0

    new-instance v3, Lcom/unity3d/player/q;

    invoke-direct {v3}, Lcom/unity3d/player/q;-><init>()V

    :cond_0
    sput-object v3, Lcom/unity3d/player/u;->n:Lcom/unity3d/player/n;

    return-void

    :cond_1
    move v0, v2

    goto/16 :goto_0

    :cond_2
    move v0, v2

    goto :goto_1

    :cond_3
    move v0, v2

    goto :goto_2

    :cond_4
    move v0, v2

    goto :goto_3

    :cond_5
    move v0, v2

    goto :goto_4

    :cond_6
    move v0, v2

    goto :goto_5

    :cond_7
    move v1, v2

    goto :goto_6

    :cond_8
    move-object v0, v3

    goto :goto_7

    :cond_9
    move-object v0, v3

    goto :goto_8

    :cond_a
    move-object v0, v3

    goto :goto_9

    :cond_b
    move-object v0, v3

    goto :goto_a

    :cond_c
    move-object v0, v3

    goto :goto_b

    :cond_d
    move-object v0, v3

    goto :goto_c
.end method
