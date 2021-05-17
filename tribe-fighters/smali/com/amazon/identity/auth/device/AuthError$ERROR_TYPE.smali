.class public final enum Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;
.super Ljava/lang/Enum;
.source "AuthError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazon/identity/auth/device/AuthError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ERROR_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_AUTH_DIALOG:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_BAD_API_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_COM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_DATA_STORAGE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_DCP_DMS:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_DIRECTED_ID_NOT_FOUND:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_FORCE_UPDATE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_INIT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_INVALID_API:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_INVALID_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_INVALID_GRANT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_INVALID_SCOPE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_INVALID_TOKEN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_PARSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_RESOURCES:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_REVOKE_AUTH:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_SECURITY:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_THREAD:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_UNAUTHORIZED_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

.field public static final enum ERROR_WEBVIEW_SSL:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;


# instance fields
.field private final _category:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 64
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_INVALID_TOKEN"

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v4, v2}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_TOKEN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 66
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_INVALID_GRANT"

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v5, v2}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_GRANT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 68
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_INVALID_CLIENT"

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v6, v2}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 70
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_INVALID_SCOPE"

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v7, v2}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_SCOPE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 72
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_UNAUTHORIZED_CLIENT"

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v8, v2}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNAUTHORIZED_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 74
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_WEBVIEW_SSL"

    const/4 v2, 0x5

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_WEBVIEW_SSL:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 76
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_ACCESS_DENIED"

    const/4 v2, 0x6

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 79
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_COM"

    const/4 v2, 0x7

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->NETWORK:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_COM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 81
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_IO"

    const/16 v2, 0x8

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->NETWORK:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 84
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_UNKNOWN"

    const/16 v2, 0x9

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 87
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_BAD_PARAM"

    const/16 v2, 0xa

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 89
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_JSON"

    const/16 v2, 0xb

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 91
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_PARSE"

    const/16 v2, 0xc

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_PARSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 93
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_SERVER_REPSONSE"

    const/16 v2, 0xd

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 95
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_DATA_STORAGE"

    const/16 v2, 0xe

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_DATA_STORAGE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 97
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_THREAD"

    const/16 v2, 0xf

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_THREAD:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 100
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_DCP_DMS"

    const/16 v2, 0x10

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_DCP_DMS:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 102
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_FORCE_UPDATE"

    const/16 v2, 0x11

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->ACTION:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_FORCE_UPDATE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 105
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_REVOKE_AUTH"

    const/16 v2, 0x12

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_REVOKE_AUTH:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 107
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_AUTH_DIALOG"

    const/16 v2, 0x13

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->INTERNAL:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_AUTH_DIALOG:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 110
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_BAD_API_PARAM"

    const/16 v2, 0x14

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_API_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 112
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_INIT"

    const/16 v2, 0x15

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INIT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 114
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_RESOURCES"

    const/16 v2, 0x16

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_RESOURCES:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 116
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_DIRECTED_ID_NOT_FOUND"

    const/16 v2, 0x17

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_DIRECTED_ID_NOT_FOUND:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 118
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_INVALID_API"

    const/16 v2, 0x18

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_API:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 120
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    const-string v1, "ERROR_SECURITY"

    const/16 v2, 0x19

    sget-object v3, Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;->BAD_REQUEST:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    invoke-direct {v0, v1, v2, v3}, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;-><init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SECURITY:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    .line 62
    const/16 v0, 0x1a

    new-array v0, v0, [Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_TOKEN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_GRANT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_SCOPE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNAUTHORIZED_CLIENT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_WEBVIEW_SSL:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_COM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_IO:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_PARSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_DATA_STORAGE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_THREAD:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_DCP_DMS:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_FORCE_UPDATE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_REVOKE_AUTH:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_AUTH_DIALOG:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_BAD_API_PARAM:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INIT:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_RESOURCES:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_DIRECTED_ID_NOT_FOUND:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_INVALID_API:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    const/16 v1, 0x19

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SECURITY:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->$VALUES:[Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;)V
    .locals 0
    .param p3, "category"    # Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;",
            ")V"
        }
    .end annotation

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 125
    iput-object p3, p0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->_category:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    .line 126
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    const-class v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    return-object v0
.end method

.method public static values()[Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->$VALUES:[Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-virtual {v0}, [Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    return-object v0
.end method


# virtual methods
.method public getCategory()Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->_category:Lcom/amazon/identity/auth/device/AuthError$ERROR_CATEGORY;

    return-object v0
.end method
