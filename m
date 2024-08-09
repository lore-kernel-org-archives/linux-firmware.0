Return-Path: <SRS0=G/vb=PI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431CEC3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 08:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03BC5C4AF09; Fri,  9 Aug 2024 08:41:25 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC5C9C32782
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 08:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC5C9C32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f193.google.com with SMTP id 5614622812f47-3dab336717fso1239409b6e.0
        for <linux-firmware@kernel.org>; Fri, 09 Aug 2024 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723192883; x=1723797683; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z+OGfMa06Jcw9c4E1tR1TjeEnkD86Y7cSjosOtJd7tg=;
        b=YA/3WUoza06AIGhlX6ZIbvo+W7AK7hLmD30zPwd4IfgESuiPD+6T80cm3feayD8bVV
         Kora4qGQhtukR8I4u2r16m/R3jgcY61ldIne4GcSwA3vqseXOhnrS/ZORjB3koJZSsGm
         ZF4EII4JXKucc0hhBzrzSy0duqchlY7iKFa3/PD/qsNI50nPo0wnKk8QQS9rXHmP72jv
         iGTrkAW+qsoDtjP6+j9fqCskVmPtPhvD750GeY/xZX5FVlmu+T4qs6XV1+aO34tVLIeQ
         SP56uFuA85dZLKwohLF6jbHEnnCa/iZiJqo5scT7pdpwfHVzeFwEy9sQjPus7dI2NpQL
         jSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192883; x=1723797683;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+OGfMa06Jcw9c4E1tR1TjeEnkD86Y7cSjosOtJd7tg=;
        b=rb6c5nu8yPAqf73dpZ5KWQeXHk/ZFPE1DHDMW8vcwxp2vtepib5sYmvKEhrDGg9fA1
         Dmwcjv2xw3ZbTxuMzVaGPa8ohWMa1j+7HrQWo0LLaDgaQPEKLZBMwE5Ft2/9A4msQyPd
         GxJXunbpraRDTZIA3FBxFLTu3m/SOsipzCG6mTWMo1wpmTPvJ6rWIlUNYxqyPUz8tMiK
         9Mr1TJlWDIOipX1cEE+e3DkPWTm0OAYTCNw6QwxKhx7DEyp0lGf04OB4uXWwsDdG/YDU
         UJb4lKHLJbR6JAIXvtezfFG/uZ9kygXzl5Z+n6ltXTcZEMzZ0uHGvwOR17RtncZGUCQY
         9MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWevzOwNz2y40GG2pDzLf9ZKhKKk/qzu48y10Ab/tfqgqzaxaHfulHVr/bCYGJP5UVqrqX032KSHsHrbmMr0wBRbR1pRiyRiqsK
X-Gm-Message-State: AOJu0YxjAF7FOeWndhEkv5YChg9bs9RWFiLdZvDe2Vt/zeYNWvhm+ldy
	7tMM+i8oEqJYHTpkq2FX8/94E+he0EgvHDufcNO0zqyvqzt5FMoJ1VlWOyuU9p0=
X-Google-Smtp-Source: AGHT+IFB0PSCYkR1HruyHM/LYEehEUUlCCRIpcq01xWXZsFGZuwLYvUtBIdaQ91H/P1sZGxTHr9JRw==
X-Received: by 2002:a05:6808:159f:b0:3d6:35cc:7624 with SMTP id 5614622812f47-3dc416e112amr834594b6e.36.1723192882869;
        Fri, 09 Aug 2024 01:41:22 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.175.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2fd5aasm2191404b3a.216.2024.08.09.01.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 01:41:22 -0700 (PDT)
Date: Fri, 09 Aug 2024 15:18:02 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org
CC: quic_vgarodia@quicinc.com
Subject: Re: [PATCH v2] qcom: update path for video firmware for vpu-1/2/3.0
User-Agent: K-9 Mail for Android
In-Reply-To: <1723188568-20342-1-git-send-email-quic_dikshita@quicinc.com>
References: <1723188568-20342-1-git-send-email-quic_dikshita@quicinc.com>
Message-ID: <7A614880-F6AA-435F-9504-B9731773DF58@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 9, 2024 2:29:28 PM GMT+07:00, Dikshita Agarwal <quic_dikshita@qui=
cinc=2Ecom> wrote:
>- Rename qcom/vpu-3=2E0/ to qcom/vpu/ to have common sub-folder for
>  new firmware files=2E
>- Move firmware files from vpu-1=2E0/ and vpu-2=2E0/ to vpu/ with
>  proper names for firmware binaries and provide backwards-compatible
>  links=2E
>
>Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc=2Ecom>
>---
>Changes since v1:
> - Updated firmware binary names to better names following
>   common convention=2E
> - Used Link: tag in WHENCE to create symlinks=2E
>
> WHENCE                                          |  10 ++++++----
> qcom/{vpu-2=2E0/venus=2Embn =3D> vpu/vpu20_p1=2Embn}    | Bin
> qcom/{vpu-1=2E0/venus=2Embn =3D> vpu/vpu20_p4=2Embn}    | Bin
> qcom/{vpu-3=2E0/vpu30_4v=2Embn =3D> vpu/vpu30_p4=2Embn} | Bin
> 4 files changed, 6 insertions(+), 4 deletions(-)
> rename qcom/{vpu-2=2E0/venus=2Embn =3D> vpu/vpu20_p1=2Embn} (100%)
> rename qcom/{vpu-1=2E0/venus=2Embn =3D> vpu/vpu20_p4=2Embn} (100%)
> rename qcom/{vpu-3=2E0/vpu30_4v=2Embn =3D> vpu/vpu30_p4=2Embn} (100%)
>
>diff --git a/WHENCE b/WHENCE
>index 0a737b6=2E=2Eedee7a9 100644
>--- a/WHENCE
>+++ b/WHENCE
>@@ -5961,12 +5961,13 @@ File: qcom/venus-6=2E0/venus=2Embn
>=20
> Version: VIDEO=2EVE=2E6=2E0-00049-PROD-1
>=20
>-File: qcom/vpu-1=2E0/venus=2Embn
>-Link: qcom/vpu-1=2E0/venus=2Emdt -> venus=2Embn
>+File: qcom/vpu/vpu20_p4=2Embn
>+Link: qcom/vpu-1=2E0/venus=2Embn -> =2E=2E/vpu/vpu20_p4=2Embn
>=20
> Version: VIDEO=2EVPU=2E1=2E0-00087-PROD-1
>=20
>-File: qcom/vpu-2=2E0/venus=2Embn
>+File: qcom/vpu/vpu20_p1=2Embn
>+Link: qcom/vpu-2=2E0/venus=2Embn -> =2E=2E/vpu/vpu20_p1=2Embn
>=20
> Version: VIDEO=2EVPU=2E2=2E0-00049-PROD-1
>=20
>@@ -5979,7 +5980,8 @@ https://developer=2Equalcomm=2Ecom/hardware/dragonb=
oard-410c/tools
>=20
> Driver: iris - Qualcomm Iris video codec accelerator
>=20
>-File: qcom/vpu-3=2E0/vpu30_4v=2Embn
>+File: qcom/vpu/vpu30_p4=2Embn
>+Link: qcom/vpu-3=2E0/vpu30_4v=2Embn -> =2E=2E/vpu/vpu30_p4=2Embn

Since there was no linux-firmware release with qcom/vpu-3=2E0 subdir, can =
we drop this extra symlink? I don't think there is a need to be compatible =
with the interim git revisions=2E

Other than that LGTM, thank you!



>=20
> Version: VIDEO=2EVPU=2E3=2E1-0076
>=20
>diff --git a/qcom/vpu-2=2E0/venus=2Embn b/qcom/vpu/vpu20_p1=2Embn
>similarity index 100%
>rename from qcom/vpu-2=2E0/venus=2Embn
>rename to qcom/vpu/vpu20_p1=2Embn
>diff --git a/qcom/vpu-1=2E0/venus=2Embn b/qcom/vpu/vpu20_p4=2Embn
>similarity index 100%
>rename from qcom/vpu-1=2E0/venus=2Embn
>rename to qcom/vpu/vpu20_p4=2Embn
>diff --git a/qcom/vpu-3=2E0/vpu30_4v=2Embn b/qcom/vpu/vpu30_p4=2Embn
>similarity index 100%
>rename from qcom/vpu-3=2E0/vpu30_4v=2Embn
>rename to qcom/vpu/vpu30_p4=2Embn


--=20
With best wishes
Dmitry
