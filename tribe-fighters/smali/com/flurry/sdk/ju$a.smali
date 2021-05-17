.class public final enum Lcom/flurry/sdk/ju$a;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/jo$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ju;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/sdk/ju$a;",
        ">;",
        "Lcom/flurry/sdk/jo$b;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/flurry/sdk/ju$a;

.field public static final enum b:Lcom/flurry/sdk/ju$a;

.field public static final enum c:Lcom/flurry/sdk/ju$a;

.field public static final enum d:Lcom/flurry/sdk/ju$a;

.field public static final enum e:Lcom/flurry/sdk/ju$a;

.field public static final enum f:Lcom/flurry/sdk/ju$a;

.field public static final enum g:Lcom/flurry/sdk/ju$a;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum h:Lcom/flurry/sdk/ju$a;

.field public static final enum i:Lcom/flurry/sdk/ju$a;

.field public static final enum j:Lcom/flurry/sdk/ju$a;

.field public static final enum k:Lcom/flurry/sdk/ju$a;

.field public static final enum l:Lcom/flurry/sdk/ju$a;

.field public static final enum m:Lcom/flurry/sdk/ju$a;

.field public static final enum n:Lcom/flurry/sdk/ju$a;

.field public static final enum o:Lcom/flurry/sdk/ju$a;

.field public static final enum p:Lcom/flurry/sdk/ju$a;

.field public static final enum q:Lcom/flurry/sdk/ju$a;

.field public static final enum r:Lcom/flurry/sdk/ju$a;

.field public static final enum s:Lcom/flurry/sdk/ju$a;

.field public static final enum t:Lcom/flurry/sdk/ju$a;

.field public static final enum u:Lcom/flurry/sdk/ju$a;

.field public static final enum v:Lcom/flurry/sdk/ju$a;

.field public static final enum w:Lcom/flurry/sdk/ju$a;

.field private static final synthetic y:[Lcom/flurry/sdk/ju$a;


# instance fields
.field final x:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 63
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "USE_ANNOTATIONS"

    invoke-direct {v0, v1, v4, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->a:Lcom/flurry/sdk/ju$a;

    .line 82
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "AUTO_DETECT_GETTERS"

    invoke-direct {v0, v1, v3, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->b:Lcom/flurry/sdk/ju$a;

    .line 98
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "AUTO_DETECT_IS_GETTERS"

    invoke-direct {v0, v1, v5, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->c:Lcom/flurry/sdk/ju$a;

    .line 115
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "AUTO_DETECT_FIELDS"

    invoke-direct {v0, v1, v6, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->d:Lcom/flurry/sdk/ju$a;

    .line 127
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "CAN_OVERRIDE_ACCESS_MODIFIERS"

    invoke-direct {v0, v1, v7, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->e:Lcom/flurry/sdk/ju$a;

    .line 141
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "REQUIRE_SETTERS_FOR_GETTERS"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->f:Lcom/flurry/sdk/ju$a;

    .line 163
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_NULL_PROPERTIES"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->g:Lcom/flurry/sdk/ju$a;

    .line 176
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "USE_STATIC_TYPING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->h:Lcom/flurry/sdk/ju$a;

    .line 194
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "DEFAULT_VIEW_INCLUSION"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->i:Lcom/flurry/sdk/ju$a;

    .line 209
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRAP_ROOT_VALUE"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->j:Lcom/flurry/sdk/ju$a;

    .line 228
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "INDENT_OUTPUT"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->k:Lcom/flurry/sdk/ju$a;

    .line 244
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "SORT_PROPERTIES_ALPHABETICALLY"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->l:Lcom/flurry/sdk/ju$a;

    .line 267
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "FAIL_ON_EMPTY_BEANS"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->m:Lcom/flurry/sdk/ju$a;

    .line 287
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRAP_EXCEPTIONS"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->n:Lcom/flurry/sdk/ju$a;

    .line 311
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "CLOSE_CLOSEABLE"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->o:Lcom/flurry/sdk/ju$a;

    .line 325
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "FLUSH_AFTER_WRITE_VALUE"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->p:Lcom/flurry/sdk/ju$a;

    .line 348
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_DATES_AS_TIMESTAMPS"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->q:Lcom/flurry/sdk/ju$a;

    .line 361
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_DATE_KEYS_AS_TIMESTAMPS"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->r:Lcom/flurry/sdk/ju$a;

    .line 371
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->s:Lcom/flurry/sdk/ju$a;

    .line 386
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_ENUMS_USING_TO_STRING"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->t:Lcom/flurry/sdk/ju$a;

    .line 401
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_ENUMS_USING_INDEX"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->u:Lcom/flurry/sdk/ju$a;

    .line 411
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_NULL_MAP_VALUES"

    const/16 v2, 0x15

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->v:Lcom/flurry/sdk/ju$a;

    .line 424
    new-instance v0, Lcom/flurry/sdk/ju$a;

    const-string v1, "WRITE_EMPTY_JSON_ARRAYS"

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ju$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ju$a;->w:Lcom/flurry/sdk/ju$a;

    .line 45
    const/16 v0, 0x17

    new-array v0, v0, [Lcom/flurry/sdk/ju$a;

    sget-object v1, Lcom/flurry/sdk/ju$a;->a:Lcom/flurry/sdk/ju$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/flurry/sdk/ju$a;->b:Lcom/flurry/sdk/ju$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/flurry/sdk/ju$a;->c:Lcom/flurry/sdk/ju$a;

    aput-object v1, v0, v5

    sget-object v1, Lcom/flurry/sdk/ju$a;->d:Lcom/flurry/sdk/ju$a;

    aput-object v1, v0, v6

    sget-object v1, Lcom/flurry/sdk/ju$a;->e:Lcom/flurry/sdk/ju$a;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/flurry/sdk/ju$a;->f:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/flurry/sdk/ju$a;->g:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/flurry/sdk/ju$a;->h:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/flurry/sdk/ju$a;->i:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/flurry/sdk/ju$a;->j:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/flurry/sdk/ju$a;->k:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/flurry/sdk/ju$a;->l:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/flurry/sdk/ju$a;->m:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/flurry/sdk/ju$a;->n:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/flurry/sdk/ju$a;->o:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/flurry/sdk/ju$a;->p:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/flurry/sdk/ju$a;->q:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/flurry/sdk/ju$a;->r:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/flurry/sdk/ju$a;->s:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/flurry/sdk/ju$a;->t:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/flurry/sdk/ju$a;->u:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lcom/flurry/sdk/ju$a;->v:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lcom/flurry/sdk/ju$a;->w:Lcom/flurry/sdk/ju$a;

    aput-object v2, v0, v1

    sput-object v0, Lcom/flurry/sdk/ju$a;->y:[Lcom/flurry/sdk/ju$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .prologue
    .line 430
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 431
    iput-boolean p3, p0, Lcom/flurry/sdk/ju$a;->x:Z

    .line 432
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flurry/sdk/ju$a;
    .locals 1

    .prologue
    .line 45
    const-class v0, Lcom/flurry/sdk/ju$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ju$a;

    return-object v0
.end method

.method public static values()[Lcom/flurry/sdk/ju$a;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/flurry/sdk/ju$a;->y:[Lcom/flurry/sdk/ju$a;

    invoke-virtual {v0}, [Lcom/flurry/sdk/ju$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/ju$a;

    return-object v0
.end method


# virtual methods
.method public a()Z
    .locals 1

    .prologue
    .line 435
    iget-boolean v0, p0, Lcom/flurry/sdk/ju$a;->x:Z

    return v0
.end method

.method public b()I
    .locals 2

    .prologue
    .line 438
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/flurry/sdk/ju$a;->ordinal()I

    move-result v1

    shl-int/2addr v0, v1

    return v0
.end method
