.class public final enum Lcom/flurry/sdk/ht$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ht;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/sdk/ht$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/flurry/sdk/ht$a;

.field public static final enum b:Lcom/flurry/sdk/ht$a;

.field public static final enum c:Lcom/flurry/sdk/ht$a;

.field public static final enum d:Lcom/flurry/sdk/ht$a;

.field public static final enum e:Lcom/flurry/sdk/ht$a;

.field public static final enum f:Lcom/flurry/sdk/ht$a;

.field public static final enum g:Lcom/flurry/sdk/ht$a;

.field public static final enum h:Lcom/flurry/sdk/ht$a;

.field public static final enum i:Lcom/flurry/sdk/ht$a;

.field public static final enum j:Lcom/flurry/sdk/ht$a;

.field private static final synthetic l:[Lcom/flurry/sdk/ht$a;


# instance fields
.field final k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 68
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "AUTO_CLOSE_SOURCE"

    invoke-direct {v0, v1, v3, v4}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->a:Lcom/flurry/sdk/ht$a;

    .line 86
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_COMMENTS"

    invoke-direct {v0, v1, v4, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->b:Lcom/flurry/sdk/ht$a;

    .line 102
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_UNQUOTED_FIELD_NAMES"

    invoke-direct {v0, v1, v5, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->c:Lcom/flurry/sdk/ht$a;

    .line 120
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_SINGLE_QUOTES"

    invoke-direct {v0, v1, v6, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->d:Lcom/flurry/sdk/ht$a;

    .line 137
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_UNQUOTED_CONTROL_CHARS"

    invoke-direct {v0, v1, v7, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->e:Lcom/flurry/sdk/ht$a;

    .line 152
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->f:Lcom/flurry/sdk/ht$a;

    .line 168
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_NUMERIC_LEADING_ZEROS"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->g:Lcom/flurry/sdk/ht$a;

    .line 186
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "ALLOW_NON_NUMERIC_NUMBERS"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->h:Lcom/flurry/sdk/ht$a;

    .line 205
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "INTERN_FIELD_NAMES"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->i:Lcom/flurry/sdk/ht$a;

    .line 215
    new-instance v0, Lcom/flurry/sdk/ht$a;

    const-string v1, "CANONICALIZE_FIELD_NAMES"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2, v4}, Lcom/flurry/sdk/ht$a;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/flurry/sdk/ht$a;->j:Lcom/flurry/sdk/ht$a;

    .line 52
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/flurry/sdk/ht$a;

    sget-object v1, Lcom/flurry/sdk/ht$a;->a:Lcom/flurry/sdk/ht$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/flurry/sdk/ht$a;->b:Lcom/flurry/sdk/ht$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/flurry/sdk/ht$a;->c:Lcom/flurry/sdk/ht$a;

    aput-object v1, v0, v5

    sget-object v1, Lcom/flurry/sdk/ht$a;->d:Lcom/flurry/sdk/ht$a;

    aput-object v1, v0, v6

    sget-object v1, Lcom/flurry/sdk/ht$a;->e:Lcom/flurry/sdk/ht$a;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/flurry/sdk/ht$a;->f:Lcom/flurry/sdk/ht$a;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/flurry/sdk/ht$a;->g:Lcom/flurry/sdk/ht$a;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/flurry/sdk/ht$a;->h:Lcom/flurry/sdk/ht$a;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/flurry/sdk/ht$a;->i:Lcom/flurry/sdk/ht$a;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/flurry/sdk/ht$a;->j:Lcom/flurry/sdk/ht$a;

    aput-object v2, v0, v1

    sput-object v0, Lcom/flurry/sdk/ht$a;->l:[Lcom/flurry/sdk/ht$a;

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
    .line 237
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 238
    iput-boolean p3, p0, Lcom/flurry/sdk/ht$a;->k:Z

    .line 239
    return-void
.end method

.method public static a()I
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 229
    invoke-static {}, Lcom/flurry/sdk/ht$a;->values()[Lcom/flurry/sdk/ht$a;

    move-result-object v2

    array-length v3, v2

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v4, v2, v1

    .line 230
    invoke-virtual {v4}, Lcom/flurry/sdk/ht$a;->b()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 231
    invoke-virtual {v4}, Lcom/flurry/sdk/ht$a;->c()I

    move-result v4

    or-int/2addr v0, v4

    .line 229
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 234
    :cond_1
    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flurry/sdk/ht$a;
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/flurry/sdk/ht$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/ht$a;

    return-object v0
.end method

.method public static values()[Lcom/flurry/sdk/ht$a;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lcom/flurry/sdk/ht$a;->l:[Lcom/flurry/sdk/ht$a;

    invoke-virtual {v0}, [Lcom/flurry/sdk/ht$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/sdk/ht$a;

    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 1

    .prologue
    .line 241
    iget-boolean v0, p0, Lcom/flurry/sdk/ht$a;->k:Z

    return v0
.end method

.method public c()I
    .locals 2

    .prologue
    .line 245
    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/flurry/sdk/ht$a;->ordinal()I

    move-result v1

    shl-int/2addr v0, v1

    return v0
.end method
