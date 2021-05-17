.class public final enum Lcom/amazon/ags/api/ErrorCode;
.super Ljava/lang/Enum;
.source "ErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/api/ErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/api/ErrorCode;

.field public static final enum AUTHENTICATION_ERROR:Lcom/amazon/ags/api/ErrorCode;

.field public static final CODE_TO_ERROR:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/amazon/ags/api/ErrorCode;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum CONNECTION_ERROR:Lcom/amazon/ags/api/ErrorCode;

.field public static final enum DATA_VALIDATION_ERROR:Lcom/amazon/ags/api/ErrorCode;

.field public static final enum IO_ERROR:Lcom/amazon/ags/api/ErrorCode;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum NONE:Lcom/amazon/ags/api/ErrorCode;

.field public static final enum SERVICE_NOT_READY:Lcom/amazon/ags/api/ErrorCode;

.field public static final enum UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;


# instance fields
.field private final isError:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 46
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v4, v4}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->NONE:Lcom/amazon/ags/api/ErrorCode;

    .line 51
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "UNRECOVERABLE"

    invoke-direct {v0, v1, v3, v3}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    .line 56
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "SERVICE_NOT_READY"

    invoke-direct {v0, v1, v5, v3}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->SERVICE_NOT_READY:Lcom/amazon/ags/api/ErrorCode;

    .line 63
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "IO_ERROR"

    invoke-direct {v0, v1, v6, v3}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->IO_ERROR:Lcom/amazon/ags/api/ErrorCode;

    .line 70
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "CONNECTION_ERROR"

    invoke-direct {v0, v1, v7, v3}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->CONNECTION_ERROR:Lcom/amazon/ags/api/ErrorCode;

    .line 75
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "AUTHENTICATION_ERROR"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->AUTHENTICATION_ERROR:Lcom/amazon/ags/api/ErrorCode;

    .line 80
    new-instance v0, Lcom/amazon/ags/api/ErrorCode;

    const-string v1, "DATA_VALIDATION_ERROR"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/ags/api/ErrorCode;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->DATA_VALIDATION_ERROR:Lcom/amazon/ags/api/ErrorCode;

    .line 35
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/amazon/ags/api/ErrorCode;

    sget-object v1, Lcom/amazon/ags/api/ErrorCode;->NONE:Lcom/amazon/ags/api/ErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/api/ErrorCode;->SERVICE_NOT_READY:Lcom/amazon/ags/api/ErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/api/ErrorCode;->IO_ERROR:Lcom/amazon/ags/api/ErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/ags/api/ErrorCode;->CONNECTION_ERROR:Lcom/amazon/ags/api/ErrorCode;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->AUTHENTICATION_ERROR:Lcom/amazon/ags/api/ErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/ags/api/ErrorCode;->DATA_VALIDATION_ERROR:Lcom/amazon/ags/api/ErrorCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->$VALUES:[Lcom/amazon/ags/api/ErrorCode;

    .line 104
    new-instance v0, Lcom/amazon/ags/api/ErrorCode$1;

    invoke-direct {v0}, Lcom/amazon/ags/api/ErrorCode$1;-><init>()V

    sput-object v0, Lcom/amazon/ags/api/ErrorCode;->CODE_TO_ERROR:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .param p3, "isError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 87
    iput-boolean p3, p0, Lcom/amazon/ags/api/ErrorCode;->isError:Z

    .line 88
    return-void
.end method

.method public static fromServiceResponseCode(I)Lcom/amazon/ags/api/ErrorCode;
    .locals 3
    .param p0, "responseCode"    # I

    .prologue
    .line 95
    sget-object v1, Lcom/amazon/ags/api/ErrorCode;->CODE_TO_ERROR:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/ErrorCode;

    .line 96
    .local v0, "error":Lcom/amazon/ags/api/ErrorCode;
    if-nez v0, :cond_0

    .line 97
    sget-object v0, Lcom/amazon/ags/api/ErrorCode;->UNRECOVERABLE:Lcom/amazon/ags/api/ErrorCode;

    .line 99
    .end local v0    # "error":Lcom/amazon/ags/api/ErrorCode;
    :cond_0
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/api/ErrorCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    const-class v0, Lcom/amazon/ags/api/ErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/ErrorCode;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/api/ErrorCode;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/amazon/ags/api/ErrorCode;->$VALUES:[Lcom/amazon/ags/api/ErrorCode;

    invoke-virtual {v0}, [Lcom/amazon/ags/api/ErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/api/ErrorCode;

    return-object v0
.end method


# virtual methods
.method public isError()Z
    .locals 1

    .prologue
    .line 91
    iget-boolean v0, p0, Lcom/amazon/ags/api/ErrorCode;->isError:Z

    return v0
.end method
