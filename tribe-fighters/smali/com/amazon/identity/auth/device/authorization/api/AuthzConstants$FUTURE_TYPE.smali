.class public final enum Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;
.super Ljava/lang/Enum;
.source "AuthzConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FUTURE_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

.field public static final enum CANCEL:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

.field public static final enum ERROR:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

.field public static final enum SUCCESS:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 45
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->SUCCESS:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    .line 46
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v3}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->ERROR:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    .line 47
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    const-string v1, "CANCEL"

    invoke-direct {v0, v1, v4}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->CANCEL:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    .line 43
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->SUCCESS:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->ERROR:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->CANCEL:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

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
    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    const-class v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$FUTURE_TYPE;

    return-object v0
.end method