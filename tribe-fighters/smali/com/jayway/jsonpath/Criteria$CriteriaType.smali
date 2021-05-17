.class final enum Lcom/jayway/jsonpath/Criteria$CriteriaType;
.super Ljava/lang/Enum;
.source "Criteria.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jayway/jsonpath/Criteria;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "CriteriaType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/jayway/jsonpath/Criteria$CriteriaType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum ALL:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum EXISTS:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum GT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum GTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum IN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum LT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum LTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum NE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum NIN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum OR:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum REGEX:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum SIZE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

.field public static final enum TYPE:Lcom/jayway/jsonpath/Criteria$CriteriaType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 31
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "GT"

    invoke-direct {v0, v1, v3}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 32
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "GTE"

    invoke-direct {v0, v1, v4}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 33
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "LT"

    invoke-direct {v0, v1, v5}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 34
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "LTE"

    invoke-direct {v0, v1, v6}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 35
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "NE"

    invoke-direct {v0, v1, v7}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 36
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "IN"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->IN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 37
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "NIN"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NIN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 38
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "ALL"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->ALL:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 39
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "SIZE"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->SIZE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 40
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "EXISTS"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->EXISTS:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 41
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "TYPE"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->TYPE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 42
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "REGEX"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->REGEX:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 43
    new-instance v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    const-string v1, "OR"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/jayway/jsonpath/Criteria$CriteriaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->OR:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    .line 30
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/jayway/jsonpath/Criteria$CriteriaType;

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->GTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LT:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->LTE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->IN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->NIN:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->ALL:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->SIZE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->EXISTS:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->TYPE:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->REGEX:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/jayway/jsonpath/Criteria$CriteriaType;->OR:Lcom/jayway/jsonpath/Criteria$CriteriaType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->$VALUES:[Lcom/jayway/jsonpath/Criteria$CriteriaType;

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
    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/jayway/jsonpath/Criteria$CriteriaType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 30
    const-class v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;

    return-object v0
.end method

.method public static values()[Lcom/jayway/jsonpath/Criteria$CriteriaType;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/jayway/jsonpath/Criteria$CriteriaType;->$VALUES:[Lcom/jayway/jsonpath/Criteria$CriteriaType;

    invoke-virtual {v0}, [Lcom/jayway/jsonpath/Criteria$CriteriaType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/jayway/jsonpath/Criteria$CriteriaType;

    return-object v0
.end method
