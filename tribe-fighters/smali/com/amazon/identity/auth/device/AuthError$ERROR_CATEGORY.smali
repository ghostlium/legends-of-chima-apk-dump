.class public final enum Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
.super Ljava/lang/Enum;
.source "AuthError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/AuthError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ERROR_CATEGORY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

.field public static final enum ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

.field public static final enum BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

.field public static final enum INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

.field public static final enum NETWORK:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

.field public static final enum UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 48
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    const-string v1, "ACTION"

    invoke-direct {v0, v1, v2}, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    .line 50
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    const-string v1, "BAD_REQUEST"

    invoke-direct {v0, v1, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    .line 52
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    const-string v1, "NETWORK"

    invoke-direct {v0, v1, v4}, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->NETWORK:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    .line 54
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    const-string v1, "INTERNAL"

    invoke-direct {v0, v1, v5}, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    .line 56
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v6}, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    .line 46
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->NETWORK:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->$VALUES:[Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

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
    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->$VALUES:[Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    return-object v0
.end method
