Return-Path: <SRS0=G/vb=PI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C6C52D71
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Aug 2024 10:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBDF7C4AF0D; Fri,  9 Aug 2024 10:20:28 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B868BC32782
	for <linux-firmware@kernel.org>; Fri,  9 Aug 2024 10:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B868BC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-1fd70ba6a15so17066905ad.0
        for <linux-firmware@kernel.org>; Fri, 09 Aug 2024 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723198827; x=1723803627; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Au+MChO1W9FuSV5ruJNEXlvE3vdweJUU3ngvx0pqRc=;
        b=Gacas7eRf+u7+UqFux0A7YTxO1ggRsPpHFAujJtInpN5uJ/5zNN3uC7mPrquO5LZS7
         fCYMQyX+JsPb3iLCIyENj8+GACSVPDFTjAIrtPJBE8+Fc3+2fdsbOAVvtv/2iYIYPLwW
         HymU2hiWRsq5KzJHVUT1E33JMxhbqdNabuHHtJ6bYkMQBkrCU09H8tM1oWTnCPEqwh0f
         yopHMMb3wVrFFvTe7+dynrO+N7CoOiyYcHyRb+NsEgMXS2VM14OMaD0CUasn/DsP/gfQ
         N8yy6Nn1ma890QSEOlgNtczzhWT0/YcwjKvBfEcrrM6fcpJlCPkRtdfji7DieKs6xo06
         cV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723198827; x=1723803627;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Au+MChO1W9FuSV5ruJNEXlvE3vdweJUU3ngvx0pqRc=;
        b=DWxJOaiCht9qFT2myGBx+H4YG4z4DE05M6O1Q4t0fHJvV4LvP39xuXiBdw5j8wMFOh
         NQcHxJC5ezdZIHKVCv9FWjXd3lE2qm9P68cgWsIV5Wy5ECNm/SHcQKtud5f5x8k4PduT
         sz4Ly+35yBC1elSCBaOHVXMbT7VexItYeN55IO/kLA/QOvbekRdgcR57qA+SqwHakgMC
         5y0Fwa5RcsLjQEC4OnnUP0uLsvRtG1TAolCBuCLhA+IwqDbKPkQTrs+vFnmgw3AlkkQ1
         IvB15k94lEffVCDh2Jfan7m14XIQ1hDJMTaroaRKAQusuTjAxa3PrFEjxliTAZopjICm
         Efqg==
X-Forwarded-Encrypted: i=1; AJvYcCXgGV2q4GudIe5/yoyq6fsA+UI2pBc2YI5fvqhwK1rsJ5enkwZ/UGnS33mgD0151Oy/6TseTj2dZZGqeP6nlvSg+tCeY1X6/fBI
X-Gm-Message-State: AOJu0YwL+LfQR16Ol6/2u0qz6t1SAJZSoeH8CYKx+eJokw6Ib++YUOPs
	KTdpd2Ei0g/F7cua6AsNLZOKBJP0JMPlsO5rnYUjdgDTG0qWf72L++egyMitG/DpZqhMIyFKFxx
	NeADSsQQy
X-Google-Smtp-Source: AGHT+IFVDxgZado2u0Y6TdIZChs3zuhD2kz2w7Twf9qSezb4GQ+coWtc3KabsqMjmH0gm42oi1BB+g==
X-Received: by 2002:a17:903:2304:b0:1fb:74b3:53d5 with SMTP id d9443c01a7336-200ae55f254mr11606385ad.35.1723198826635;
        Fri, 09 Aug 2024 03:20:26 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.175.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5928ee8dsm139163155ad.230.2024.08.09.03.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 03:20:26 -0700 (PDT)
Date: Fri, 09 Aug 2024 17:20:22 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org
CC: quic_vgarodia@quicinc.com
Subject: Re: [PATCH v2] qcom: update path for video firmware for vpu-1/2/3.0
User-Agent: K-9 Mail for Android
In-Reply-To: <08dc4b92-5f98-8408-1111-fc3bccb03ae8@quicinc.com>
References: <1723188568-20342-1-git-send-email-quic_dikshita@quicinc.com> <7A614880-F6AA-435F-9504-B9731773DF58@linaro.org> <08dc4b92-5f98-8408-1111-fc3bccb03ae8@quicinc.com>
Message-ID: <B7612BB8-A086-42DE-810E-09F6B5A544FB@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 9, 2024 4:51:39 PM GMT+07:00, Dikshita Agarwal <quic_dikshita@qui=
cinc=2Ecom> wrote:
>
>
>On 8/9/2024 1:48 PM, Dmitry Baryshkov wrote:
>> On August 9, 2024 2:29:28 PM GMT+07:00, Dikshita Agarwal <quic_dikshita=
@quicinc=2Ecom> wrote:
>>> - Rename qcom/vpu-3=2E0/ to qcom/vpu/ to have common sub-folder for
>>>  new firmware files=2E
>>> - Move firmware files from vpu-1=2E0/ and vpu-2=2E0/ to vpu/ with
>>>  proper names for firmware binaries and provide backwards-compatible
>>>  links=2E
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc=2Ecom>
>>> ---
>>> Changes since v1:
>>> - Updated firmware binary names to better names following
>>>   common convention=2E
>>> - Used Link: tag in WHENCE to create symlinks=2E
>>>
>>> WHENCE                                          |  10 ++++++----
>>> qcom/{vpu-2=2E0/venus=2Embn =3D> vpu/vpu20_p1=2Embn}    | Bin
>>> qcom/{vpu-1=2E0/venus=2Embn =3D> vpu/vpu20_p4=2Embn}    | Bin
>>> qcom/{vpu-3=2E0/vpu30_4v=2Embn =3D> vpu/vpu30_p4=2Embn} | Bin
>>> 4 files changed, 6 insertions(+), 4 deletions(-)
>>> rename qcom/{vpu-2=2E0/venus=2Embn =3D> vpu/vpu20_p1=2Embn} (100%)
>>> rename qcom/{vpu-1=2E0/venus=2Embn =3D> vpu/vpu20_p4=2Embn} (100%)
>>> rename qcom/{vpu-3=2E0/vpu30_4v=2Embn =3D> vpu/vpu30_p4=2Embn} (100%)
>>>
>>> diff --git a/WHENCE b/WHENCE
>>> index 0a737b6=2E=2Eedee7a9 100644
>>> --- a/WHENCE
>>> +++ b/WHENCE
>>> @@ -5961,12 +5961,13 @@ File: qcom/venus-6=2E0/venus=2Embn
>>>
>>> Version: VIDEO=2EVE=2E6=2E0-00049-PROD-1
>>>
>>> -File: qcom/vpu-1=2E0/venus=2Embn
>>> -Link: qcom/vpu-1=2E0/venus=2Emdt -> venus=2Embn
>>> +File: qcom/vpu/vpu20_p4=2Embn
>>> +Link: qcom/vpu-1=2E0/venus=2Embn -> =2E=2E/vpu/vpu20_p4=2Embn
>>>
>>> Version: VIDEO=2EVPU=2E1=2E0-00087-PROD-1
>>>
>>> -File: qcom/vpu-2=2E0/venus=2Embn
>>> +File: qcom/vpu/vpu20_p1=2Embn
>>> +Link: qcom/vpu-2=2E0/venus=2Embn -> =2E=2E/vpu/vpu20_p1=2Embn
>>>
>>> Version: VIDEO=2EVPU=2E2=2E0-00049-PROD-1
>>>
>>> @@ -5979,7 +5980,8 @@ https://developer=2Equalcomm=2Ecom/hardware/drag=
onboard-410c/tools
>>>
>>> Driver: iris - Qualcomm Iris video codec accelerator
>>>
>>> -File: qcom/vpu-3=2E0/vpu30_4v=2Embn
>>> +File: qcom/vpu/vpu30_p4=2Embn
>>> +Link: qcom/vpu-3=2E0/vpu30_4v=2Embn -> =2E=2E/vpu/vpu30_p4=2Embn
>>=20
>> Since there was no linux-firmware release with qcom/vpu-3=2E0 subdir, c=
an we drop this extra symlink? I don't think there is a need to be compatib=
le with the interim git revisions=2E
>>=20
>> Other than that LGTM, thank you!
>
>Sure, will remove the link for vpu-3=2E0 in next revision=2E

Thanks!

Josh, could we please get v3 (hoping Dikshita posts it soon) into the next=
 release (I guess it is due in a couple if days), so that we won't have to =
bother everybody with yet another compatibility symlink?


>
>Thanks,
>Dikshita
>>=20
>>=20
>>=20
>>>
>>> Version: VIDEO=2EVPU=2E3=2E1-0076
>>>
>>> diff --git a/qcom/vpu-2=2E0/venus=2Embn b/qcom/vpu/vpu20_p1=2Embn
>>> similarity index 100%
>>> rename from qcom/vpu-2=2E0/venus=2Embn
>>> rename to qcom/vpu/vpu20_p1=2Embn
>>> diff --git a/qcom/vpu-1=2E0/venus=2Embn b/qcom/vpu/vpu20_p4=2Embn
>>> similarity index 100%
>>> rename from qcom/vpu-1=2E0/venus=2Embn
>>> rename to qcom/vpu/vpu20_p4=2Embn
>>> diff --git a/qcom/vpu-3=2E0/vpu30_4v=2Embn b/qcom/vpu/vpu30_p4=2Embn
>>> similarity index 100%
>>> rename from qcom/vpu-3=2E0/vpu30_4v=2Embn
>>> rename to qcom/vpu/vpu30_p4=2Embn
>>=20
>>=20


--=20
With best wishes
Dmitry
