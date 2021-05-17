.class public final enum Lcom/amazon/ags/constants/AuthorizeResult;
.super Ljava/lang/Enum;
.source "AuthorizeResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/AuthorizeResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/AuthorizeResult;

.field public static final enum AUTHORIZED:Lcom/amazon/ags/constants/AuthorizeResult;

.field public static final enum CANNOT_AUTHORIZE:Lcom/amazon/ags/constants/AuthorizeResult;

.field public static final enum NOT_AUTHORIZED:Lcom/amazon/ags/constants/AuthorizeResult;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/constants/AuthorizeResult;

    const-string v1, "AUTHORIZED"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/AuthorizeResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/AuthorizeResult;->AUTHORIZED:Lcom/amazon/ags/constants/AuthorizeResult;

    .line 11
    new-instance v0, Lcom/amazon/ags/constants/AuthorizeResult;

    const-string v1, "NOT_AUTHORIZED"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/AuthorizeResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/AuthorizeResult;->NOT_AUTHORIZED:Lcom/amazon/ags/constants/AuthorizeResult;

    .line 13
    new-instance v0, Lcom/amazon/ags/constants/AuthorizeResult;

    const-string v1, "CANNOT_AUTHORIZE"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/AuthorizeResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/AuthorizeResult;->CANNOT_AUTHORIZE:Lcom/amazon/ags/constants/AuthorizeResult;

    .line 8
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/ags/constants/AuthorizeResult;

    sget-object v1, Lcom/amazon/ags/constants/AuthorizeResult;->AUTHORIZED:Lcom/amazon/ags/constants/AuthorizeResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/AuthorizeResult;->NOT_AUTHORIZED:Lcom/amazon/ags/constants/AuthorizeResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/AuthorizeResult;->CANNOT_AUTHORIZE:Lcom/amazon/ags/constants/AuthorizeResult;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/ags/constants/AuthorizeResult;->$VALUES:[Lcom/amazon/ags/constants/AuthorizeResult;

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
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/AuthorizeResult;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/constants/AuthorizeResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/AuthorizeResult;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/AuthorizeResult;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/constants/AuthorizeResult;->$VALUES:[Lcom/amazon/ags/constants/AuthorizeResult;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/AuthorizeResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/AuthorizeResult;

    return-object v0
.end method
