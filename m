Return-Path: <SRS0=G/vb=PI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEFDC52D7C
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 16:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94D30C4AF09; Fri,  9 Aug 2024 16:43:23 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 698ECC32782
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 16:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 698ECC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-1fda7fa60a9so20168205ad.3
        for <linux-firmware@kernel.org>; Fri, 09 Aug 2024 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723221802; x=1723826602; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oMe9Z4DzGu6MlbLxHUwL7ZbkWRvXyhEyeFAG7p90bEY=;
        b=qnNGmEcDW9qgJEG5n0Rv6YUgxY8w/aaeKymlWMccxtuKQheHN52bgWPxp0oHTIIP7j
         zTnaHB70pQTn33ScyQ3YTyu6+Q1PwRhODlCLAZga9I5qpqPbjjXbQctcmcefwd2GeUtg
         plGhRLduWfuaXL9RzZ1I65GGdW+hBnC88+3nxz3+/nKpcOrovAOCXkUKlIaikLrE8NiD
         19w3O8ybNHEPG8kdEXDjG1TJ/Jyym+ndokAX9vqtkRjyS2ND2awa+pW35QLsPwOb3W/n
         +axjfFFEN71el+1POa4J8Fedpt3WNWNm/F+rEzLQoY1kRkPZL8AniW05TdgSGhb+ZTJ4
         i2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221802; x=1723826602;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMe9Z4DzGu6MlbLxHUwL7ZbkWRvXyhEyeFAG7p90bEY=;
        b=YVg+KikKFYc+TIKU9SNGlzFsHHwLCpESM3eqt9eElv5XBdN2zhx0UQmCgOS3d7rnm8
         dEqyfoCu5lbMY4udUAM7BV1elF1X1ftwVTrwgevrhU7NsuTUpYcojbBO5uPVyvjv6bJ/
         1epkK3Se5opoUPIAWr9D53sS/btDGSA0vj1Br90yPAD22wRXcARsic6uHE72ha3ysd48
         8Glc5j6WeeOFiVdMjQfNb1NMMdH/wRDTf4sUV95g70mPG9H/nw/UWx+gl4+MzTnR7PMc
         EFGqclYNXByabyleYTJHFpy3Qz7W4oPrYV20XcrqPRGzR0J5RrmLviebAV/u3kcRete+
         /OCw==
X-Gm-Message-State: AOJu0YxW1dW28TSJkmS8pYjLipBOZL8+q+WwC97AylzBn9LlC/MnrNsN
	4qKJ5rG4oIGf13E8Vx50tq8ELzz5xkW7r8NwkHXP/qcvUuk9Ji7IgP5zCEKe/pA=
X-Google-Smtp-Source: AGHT+IFdR36VZhnnnsQo6EJAI8zgS13PMqhDyPArIxyVcAOUg/mIrX2q9Gs0ugZrbm706zxsWA+V1w==
X-Received: by 2002:a17:902:dac6:b0:200:953b:75a6 with SMTP id d9443c01a7336-200ae4bb21dmr19583505ad.5.1723221801540;
        Fri, 09 Aug 2024 09:43:21 -0700 (PDT)
Received: from ?IPv6:::1? ([2001:fb1:70:db30:e800:e7b1:d:337a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5917829esm144773465ad.215.2024.08.09.09.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 09:43:20 -0700 (PDT)
Date: Fri, 09 Aug 2024 23:43:17 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Josh Boyer <jwboyer@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: linux-firmware@kernel.org, quic_vgarodia@quicinc.com
Subject: Re: [PATCH v3] qcom: update path for video firmware for vpu-1/2/3.0
User-Agent: K-9 Mail for Android
In-Reply-To: <CA+5PVA5qm89D1fv2yfiwfTMin=n2gVqq0exs6qdaOaO2yUKgcw@mail.gmail.com>
References: <1723199857-10405-1-git-send-email-quic_dikshita@quicinc.com> <CA+5PVA5qm89D1fv2yfiwfTMin=n2gVqq0exs6qdaOaO2yUKgcw@mail.gmail.com>
Message-ID: <6EB2770E-9247-4C5F-A512-15677FC45EBF@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 9, 2024 8:28:46 PM GMT+07:00, Josh Boyer <jwboyer@kernel=2Eorg> w=
rote:
>On Fri, Aug 9, 2024 at 6:38=E2=80=AFAM Dikshita Agarwal
><quic_dikshita@quicinc=2Ecom> wrote:
>>
>> - Rename qcom/vpu-3=2E0/ to qcom/vpu/ to have common sub-folder for
>>   new firmware files=2E
>> - Move firmware files from vpu-1=2E0/ and vpu-2=2E0/ to vpu/ with
>>   proper names for firmware binaries and provide backwards-compatible
>>   links=2E
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc=2Ecom>
>> ---
>> Changes since v2:
>>  - Dropped the symlink for vpu-3=2E0=2E
>>
>> Changes since v1:
>>  - Updated firmware binary names to better names following
>>    common convention=2E
>>  - Used Link: tag in WHENCE to create symlinks=2E
>>
>>  WHENCE                                          |   9 +++++----
>>  qcom/{vpu-2=2E0/venus=2Embn =3D> vpu/vpu20_p1=2Embn}    | Bin
>>  qcom/{vpu-1=2E0/venus=2Embn =3D> vpu/vpu20_p4=2Embn}    | Bin
>>  qcom/{vpu-3=2E0/vpu30_4v=2Embn =3D> vpu/vpu30_p4=2Embn} | Bin
>>  4 files changed, 5 insertions(+), 4 deletions(-)
>>  rename qcom/{vpu-2=2E0/venus=2Embn =3D> vpu/vpu20_p1=2Embn} (100%)
>>  rename qcom/{vpu-1=2E0/venus=2Embn =3D> vpu/vpu20_p4=2Embn} (100%)
>>  rename qcom/{vpu-3=2E0/vpu30_4v=2Embn =3D> vpu/vpu30_p4=2Embn} (100%)
>
>Merged and pushed out=2E
>
>https://gitlab=2Ecom/kernel-firmware/linux-firmware/-/merge_requests/271

Josh, thanks a lot!

Dikshita, thanks for the prompt update too!


>
>josh
>
>>
>> diff --git a/WHENCE b/WHENCE
>> index 0a737b6=2E=2Eb7dc6ff 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -5961,12 +5961,13 @@ File: qcom/venus-6=2E0/venus=2Embn
>>
>>  Version: VIDEO=2EVE=2E6=2E0-00049-PROD-1
>>
>> -File: qcom/vpu-1=2E0/venus=2Embn
>> -Link: qcom/vpu-1=2E0/venus=2Emdt -> venus=2Embn
>> +File: qcom/vpu/vpu20_p4=2Embn
>> +Link: qcom/vpu-1=2E0/venus=2Embn -> =2E=2E/vpu/vpu20_p4=2Embn
>>
>>  Version: VIDEO=2EVPU=2E1=2E0-00087-PROD-1
>>
>> -File: qcom/vpu-2=2E0/venus=2Embn
>> +File: qcom/vpu/vpu20_p1=2Embn
>> +Link: qcom/vpu-2=2E0/venus=2Embn -> =2E=2E/vpu/vpu20_p1=2Embn
>>
>>  Version: VIDEO=2EVPU=2E2=2E0-00049-PROD-1
>>
>> @@ -5979,7 +5980,7 @@ https://developer=2Equalcomm=2Ecom/hardware/drago=
nboard-410c/tools
>>
>>  Driver: iris - Qualcomm Iris video codec accelerator
>>
>> -File: qcom/vpu-3=2E0/vpu30_4v=2Embn
>> +File: qcom/vpu/vpu30_p4=2Embn
>>
>>  Version: VIDEO=2EVPU=2E3=2E1-0076
>>
>> diff --git a/qcom/vpu-2=2E0/venus=2Embn b/qcom/vpu/vpu20_p1=2Embn
>> similarity index 100%
>> rename from qcom/vpu-2=2E0/venus=2Embn
>> rename to qcom/vpu/vpu20_p1=2Embn
>> diff --git a/qcom/vpu-1=2E0/venus=2Embn b/qcom/vpu/vpu20_p4=2Embn
>> similarity index 100%
>> rename from qcom/vpu-1=2E0/venus=2Embn
>> rename to qcom/vpu/vpu20_p4=2Embn
>> diff --git a/qcom/vpu-3=2E0/vpu30_4v=2Embn b/qcom/vpu/vpu30_p4=2Embn
>> similarity index 100%
>> rename from qcom/vpu-3=2E0/vpu30_4v=2Embn
>> rename to qcom/vpu/vpu30_p4=2Embn
>> --
>> 2=2E7=2E4
>>


--=20
With best wishes
Dmitry
