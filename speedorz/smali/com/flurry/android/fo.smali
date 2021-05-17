.class final enum Lcom/flurry/android/fo;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/android/fo;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum hD:Lcom/flurry/android/fo;

.field public static final enum hE:Lcom/flurry/android/fo;

.field public static final enum hF:Lcom/flurry/android/fo;

.field public static final enum hG:Lcom/flurry/android/fo;

.field public static final enum hH:Lcom/flurry/android/fo;

.field private static final synthetic hI:[Lcom/flurry/android/fo;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 34
    new-instance v0, Lcom/flurry/android/fo;

    const-string v1, "PENDING_DB"

    invoke-direct {v0, v1, v2}, Lcom/flurry/android/fo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/android/fo;->hD:Lcom/flurry/android/fo;

    new-instance v0, Lcom/flurry/android/fo;

    const-string v1, "SERVER_DB"

    invoke-direct {v0, v1, v3}, Lcom/flurry/android/fo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/android/fo;->hE:Lcom/flurry/android/fo;

    new-instance v0, Lcom/flurry/android/fo;

    const-string v1, "REGISTERED_DB"

    invoke-direct {v0, v1, v4}, Lcom/flurry/android/fo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/android/fo;->hF:Lcom/flurry/android/fo;

    new-instance v0, Lcom/flurry/android/fo;

    const-string v1, "SEARCH_DATA_DB"

    invoke-direct {v0, v1, v5}, Lcom/flurry/android/fo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/android/fo;->hG:Lcom/flurry/android/fo;

    new-instance v0, Lcom/flurry/android/fo;

    const-string v1, "SEARCH_ITEMS_DATA_DB"

    invoke-direct {v0, v1, v6}, Lcom/flurry/android/fo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flurry/android/fo;->hH:Lcom/flurry/android/fo;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/flurry/android/fo;

    sget-object v1, Lcom/flurry/android/fo;->hD:Lcom/flurry/android/fo;

    aput-object v1, v0, v2

    sget-object v1, Lcom/flurry/android/fo;->hE:Lcom/flurry/android/fo;

    aput-object v1, v0, v3

    sget-object v1, Lcom/flurry/android/fo;->hF:Lcom/flurry/android/fo;

    aput-object v1, v0, v4

    sget-object v1, Lcom/flurry/android/fo;->hG:Lcom/flurry/android/fo;

    aput-object v1, v0, v5

    sget-object v1, Lcom/flurry/android/fo;->hH:Lcom/flurry/android/fo;

    aput-object v1, v0, v6

    sput-object v0, Lcom/flurry/android/fo;->hI:[Lcom/flurry/android/fo;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static bd()[Lcom/flurry/android/fo;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/flurry/android/fo;->hI:[Lcom/flurry/android/fo;

    invoke-virtual {v0}, [Lcom/flurry/android/fo;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flurry/android/fo;

    return-object v0
.end method
