.class Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;
.super Lcom/android/internal/telephony/cat/ResponseData;
.source "ResponseData.java"


# static fields
.field protected static final GET_INKEY_NO:B = 0x0t

.field protected static final GET_INKEY_YES:B = 0x1t


# instance fields
.field public mInData:Ljava/lang/String;

.field private mIsPacked:Z

.field private mIsUcs2:Z

.field private mIsYesNo:Z

.field private mYesNoResponse:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ZZ)V
    .locals 1
    .parameter "inData"
    .parameter "ucs2"
    .parameter "packed"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/android/internal/telephony/cat/ResponseData;-><init>()V

    .line 68
    iput-boolean p2, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsUcs2:Z

    .line 69
    iput-boolean p3, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsPacked:Z

    .line 70
    iput-object p1, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsYesNo:Z

    .line 72
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .parameter "yesNoResponse"

    .prologue
    const/4 v0, 0x0

    .line 75
    invoke-direct {p0}, Lcom/android/internal/telephony/cat/ResponseData;-><init>()V

    .line 76
    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsUcs2:Z

    .line 77
    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsPacked:Z

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsYesNo:Z

    .line 80
    iput-boolean p1, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mYesNoResponse:Z

    .line 81
    return-void
.end method


# virtual methods
.method public format(Ljava/io/ByteArrayOutputStream;)V
    .locals 13
    .parameter "buf"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 85
    if-nez p1, :cond_1

    .line 146
    :cond_0
    return-void

    .line 90
    :cond_1
    sget-object v11, Lcom/android/internal/telephony/cat/ComprehensionTlvTag;->TEXT_STRING:Lcom/android/internal/telephony/cat/ComprehensionTlvTag;

    invoke-virtual {v11}, Lcom/android/internal/telephony/cat/ComprehensionTlvTag;->value()I

    move-result v11

    or-int/lit16 v7, v11, 0x80

    .line 91
    .local v7, tag:I
    invoke-virtual {p1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 95
    iget-boolean v11, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsYesNo:Z

    if-eqz v11, :cond_3

    .line 96
    new-array v2, v9, [B

    .line 97
    .local v2, data:[B
    iget-boolean v11, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mYesNoResponse:Z

    if-eqz v11, :cond_2

    :goto_0
    aput-byte v9, v2, v10

    .line 127
    :goto_1
    array-length v9, v2

    const/16 v11, 0x80

    if-ge v9, v11, :cond_7

    .line 128
    array-length v9, v2

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {p1, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 135
    :goto_2
    iget-boolean v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsUcs2:Z

    if-eqz v9, :cond_8

    .line 136
    const/16 v9, 0x8

    invoke-virtual {p1, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 143
    :goto_3
    move-object v0, v2

    .local v0, arr$:[B
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_4
    if-ge v4, v5, :cond_0

    aget-byte v1, v0, v4

    .line 144
    .local v1, b:B
    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 143
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .end local v0           #arr$:[B
    .end local v1           #b:B
    .end local v4           #i$:I
    .end local v5           #len$:I
    :cond_2
    move v9, v10

    .line 97
    goto :goto_0

    .line 98
    .end local v2           #data:[B
    :cond_3
    iget-object v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    if-eqz v9, :cond_6

    iget-object v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_6

    .line 100
    :try_start_0
    iget-boolean v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsUcs2:Z

    if-eqz v9, :cond_4

    .line 101
    iget-object v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    const-string v11, "UTF-16BE"

    invoke-virtual {v9, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    .restart local v2       #data:[B
    goto :goto_1

    .line 102
    .end local v2           #data:[B
    :cond_4
    iget-boolean v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsPacked:Z

    if-eqz v9, :cond_5

    .line 103
    iget-object v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v9, v11, v12}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPacked(Ljava/lang/String;II)[B

    move-result-object v8

    .line 106
    .local v8, tempData:[B
    array-length v9, v8

    add-int/lit8 v6, v9, -0x1

    .line 108
    .local v6, size:I
    new-array v2, v6, [B

    .line 112
    .restart local v2       #data:[B
    const/4 v9, 0x1

    const/4 v11, 0x0

    invoke-static {v8, v9, v2, v11, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 116
    .end local v2           #data:[B
    .end local v6           #size:I
    .end local v8           #tempData:[B
    :catch_0
    move-exception v3

    .line 117
    .local v3, e:Ljava/io/UnsupportedEncodingException;
    new-array v2, v10, [B

    .line 120
    .restart local v2       #data:[B
    goto :goto_1

    .line 114
    .end local v2           #data:[B
    .end local v3           #e:Ljava/io/UnsupportedEncodingException;
    :cond_5
    :try_start_1
    iget-object v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mInData:Ljava/lang/String;

    invoke-static {v9}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm8BitPacked(Ljava/lang/String;)[B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .restart local v2       #data:[B
    goto :goto_1

    .line 118
    .end local v2           #data:[B
    :catch_1
    move-exception v3

    .line 119
    .local v3, e:Lcom/android/internal/telephony/EncodeException;
    new-array v2, v10, [B

    .line 120
    .restart local v2       #data:[B
    goto :goto_1

    .line 122
    .end local v2           #data:[B
    .end local v3           #e:Lcom/android/internal/telephony/EncodeException;
    :cond_6
    new-array v2, v10, [B

    .restart local v2       #data:[B
    goto :goto_1

    .line 130
    :cond_7
    const/16 v9, 0x81

    invoke-virtual {p1, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 131
    array-length v9, v2

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {p1, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_2

    .line 137
    :cond_8
    iget-boolean v9, p0, Lcom/android/internal/telephony/cat/GetInkeyInputResponseData;->mIsPacked:Z

    if-eqz v9, :cond_9

    .line 138
    invoke-virtual {p1, v10}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_3

    .line 140
    :cond_9
    const/4 v9, 0x4

    invoke-virtual {p1, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_3
.end method
