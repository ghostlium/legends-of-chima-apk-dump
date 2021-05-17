.class public final Lcom/amazon/ags/constants/ServiceResponseCode;
.super Ljava/lang/Object;
.source "ServiceResponseCode.java"


# static fields
.field public static final ACHIEVEMENTS_ERROR_RECEIVED:I = 0x15

.field public static final ACHIEVEMENTS_REQUEST_FAILURE:I = 0x14

.field public static final AUTHENTICATED:I = 0x5

.field public static final AUTHENTICATION_CANCELED:I = 0x8

.field public static final AUTHENTICATION_ERROR_RECEIVED:I = 0x9

.field public static final AUTHENTICATION_OK:I = 0x7

.field public static final CLIENT_VERSION_INCOMPATIBLE:I = 0x19

.field public static final CONNECTION_ERROR_RECEIVED:I = 0xb

.field public static final DATA_VALIDATION_ERROR:I = 0x1a

.field public static final DOWNLOAD_FAILURE:I = 0x4

.field public static final DOWNLOAD_SUCCESS:I = 0x3

.field public static final INTERNAL_ERROR_RECEIVED:I = 0xc

.field public static final LEADERBOARDS_ERROR_RECEIVED:I = 0x13

.field public static final LEADERBOARDS_REQUEST_FAILURE:I = 0x12

.field public static final NOT_AUTHENTICATED:I = 0x6

.field public static final PROFILES_ERROR_RECEIVED:I = 0x17

.field public static final PROFILES_REQUEST_FAILURE:I = 0x16

.field public static final RESPONSE_CODE_KEY:Ljava/lang/String; = "RESPONSE_CODE"

.field public static final RESPONSE_ERROR_NETWORK:I = 0x1c

.field public static final RESPONSE_ERROR_UNAUTHORIZED:I = 0x1e

.field public static final RESPONSE_ERROR_UNRECOVERABLE:I = 0x1d

.field public static final RESPONSE_SUCCESS:I = 0x1b

.field public static final RETRIEVE_HISTORY_FAILURE:I = 0x10

.field public static final RETRIEVE_HISTORY_SUCCESS:I = 0xf

.field public static final RETRIEVE_LATEST_SUMMARY_FAILURE:I = 0xe

.field public static final RETRIEVE_LATEST_SUMMARY_SUCCESS:I = 0xd

.field public static final SERVICE_REQUEST_FAILURE:I = 0x18

.field public static final SERVICE_REQUEST_SUCCESS:I = 0x11

.field public static final UPLOAD_FAILURE:I = 0x2

.field public static final UPLOAD_SUCCESS:I = 0x1


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
