.class public final enum Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;
.super Ljava/lang/Enum;
.source "AuthzConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PROFILE_KEY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

.field public static final enum EMAIL:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

.field public static final enum NAME:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

.field public static final enum POSTAL_CODE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

.field public static final enum USER_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;


# instance fields
.field public final val:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 33
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    const-string v1, "NAME"

    const-string v2, "name"

    invoke-direct {v0, v1, v3, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->NAME:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    .line 34
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    const-string v1, "EMAIL"

    const-string v2, "email"

    invoke-direct {v0, v1, v4, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->EMAIL:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    .line 35
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    const-string v1, "USER_ID"

    const-string v2, "user_id"

    invoke-direct {v0, v1, v5, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->USER_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    .line 36
    new-instance v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    const-string v1, "POSTAL_CODE"

    const-string v2, "postal_code"

    invoke-direct {v0, v1, v6, v2}, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->POSTAL_CODE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    .line 32
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->NAME:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->EMAIL:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->USER_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->POSTAL_CODE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    aput-object v1, v0, v6

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "val"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->val:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    const-class v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->$VALUES:[Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$PROFILE_KEY;

    return-object v0
.end method
